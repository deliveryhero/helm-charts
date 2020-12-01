
-- create schema
create schema if not exists maint;


alter default privileges in schema maint grant select on  tables  to public;
alter default privileges in schema maint grant usage, select on sequences to public;

-- drop views 
drop view if exists maint.v_getbolatedobjects;
drop view if exists maint.v_getbtreeindexesbloatstats;
drop view if exists maint.v_gettablesbloatstats; 

-- create views
create view  maint.v_gettablesbloatstats 
as

with table_stats as 
(
	select 
	     ns.nspname   				  as schema_name, 
	     tbl.relname       			  as table_name, 
	     tbl.reltuples 				  as table_row_count,
	     tbl.relpages                 as table_heappages_count, 
	     coalesce(toast.relpages, 0)  as table_toast_pages_count,
	     coalesce(toast.reltuples, 0) as table_toast_row_count,
	     coalesce(substring(array_to_string(tbl.reloptions, ' ') from  'fillfactor=([0-9]+)')::smallint, 100) as table_fillfactor,
	     current_setting('block_size')::numeric as bs,
	     case when version()~'mingw32' or version()~'64-bit|x86_64|ppc64|ia64|amd64' then 8 else 4 end as ma,
	     24 as page_hdr,
	     23 + (case when max(coalesce(s.null_frac,0)) > 0 then ( 7 + count(s.attname) ) / 8 else 0::int end + case when bool_or(att.attname = 'oid' and att.attnum < 0) then 4 else 0 end) as table_row_hdrsize,
	     sum( (1-coalesce(s.null_frac, 0)) * coalesce(s.avg_width, 0) ) as table_row_datasize
	from pg_attribute as att
	join pg_class as tbl 
	  on att.attrelid = tbl.oid
	join pg_namespace as ns 
	  on ns.oid = tbl.relnamespace
	left join pg_stats as s 
	  on s.schemaname=ns.nspname
	 and s.tablename = tbl.relname 
	 and s.inherited=false and s.attname=att.attname
	left join pg_class as toast 
	 on tbl.reltoastrelid = toast.oid
	where not att.attisdropped
	  and tbl.relkind in ('r','m')
	  and ns.nspname not in ('information_schema' ,'pg_catalog' )
	group by 
	  ns.nspname ,
	  tbl.relname,
	  tbl.reltuples,
	  tbl.relpages,
	  toast.relpages,
	  toast.reltuples,
	  tbl.reloptions 
),
table_density_stats as 
(
	select 
		schema_name,
	  	table_name,
	  	table_row_count,
	  	table_heappages_count,
	  	table_toast_pages_count,
	    table_toast_row_count,
	    table_fillfactor,
	    ( 4 + table_row_hdrsize + table_row_datasize + (2*ma)- case when table_row_hdrsize%ma = 0 then ma else table_row_hdrsize%ma end - case when ceil(table_row_datasize)::int%ma = 0 then ma else ceil(table_row_datasize)::int%ma end) as table_row_size, 
        bs - page_hdr as table_size_per_block, 
        (table_heappages_count + table_toast_pages_count) as table_pages_count,
        bs,
        page_hdr
    from table_stats

),
table_estimation_stats as 
(
	 select 
	     schema_name,
		 table_name,
		 table_row_count,
		 table_heappages_count,
		 table_toast_pages_count,
		 table_toast_row_count,
		 table_fillfactor,
		 table_pages_count,
		 table_size_per_block,
		 ceil( table_row_count / ( (bs-page_hdr)/table_row_size ) ) + ceil( table_toast_row_count / 4 ) AS table_estimated_pages_count,
		 ceil( table_row_count / ( (bs-page_hdr)*table_fillfactor/(table_row_size*100) ) ) + ceil( table_toast_row_count / 4 ) AS table_estimated_pages_count_ff,
		 bs,
	     page_hdr
	  from table_density_stats
),
table_bloat_stats as 
(
	select 
	    schema_name,
        table_name,
		table_row_count,
		table_heappages_count,
		table_toast_pages_count,
		table_toast_row_count,
		table_fillfactor,
		table_pages_count,
		table_size_per_block,
		table_estimated_pages_count,
		table_estimated_pages_count_ff,
		bs*table_pages_count as table_real_size,
		(table_pages_count-table_estimated_pages_count)*bs as table_extra_size,
		(case when table_pages_count - table_estimated_pages_count > 0 then 100 * (table_pages_count - table_estimated_pages_count)/table_pages_count::int else 0 end)::int as table_extrasize_percent,
		(table_pages_count-table_estimated_pages_count_ff)*bs as table_bloat_size,
		(case when table_pages_count - table_estimated_pages_count_ff > 0 then 100 * (table_pages_count - table_estimated_pages_count_ff)/table_pages_count else 0 end)::int  as table_bloatsize_percent		
	from table_estimation_stats
)
select 
	schema_name,
    table_name,
    case when table_pages_count > 1000000  and table_bloatsize_percent >= 25 
         then 'big_tables_online_due_stage_1'
         when  table_pages_count >= 100000 and table_pages_count < 1000000  and table_bloatsize_percent >= 20
         then 'big_tables_online_due_stage_2'
         when  table_pages_count >= 100 and table_pages_count < 100000  and table_bloatsize_percent >= 30
         then 'small_tables_online_due' else 'not_due' end as table_miaintenance_mode,        
	table_row_count,
	table_heappages_count,
	table_toast_pages_count,
	table_toast_row_count,
	table_fillfactor,
	table_pages_count,
	table_size_per_block,
	table_estimated_pages_count,
	table_estimated_pages_count_ff,
	table_real_size,
	table_extra_size,
	table_extrasize_percent,
	table_bloat_size,
	table_bloatsize_percent
from table_bloat_stats;

create view maint.v_getbtreeindexesbloatstats
as
with btree_index_atts as 
(
	select
		nspname,
		indexclass.relname as index_name,
		indexclass.reltuples,
		indexclass.relpages,
		indrelid,
		indexrelid,
		indexclass.relam,
		tableclass.relname as tablename,
		regexp_split_to_table(indkey::text, ' ')::smallint as attnum,
		indexrelid as index_oid
	from pg_index
	join pg_class as indexclass 
	  on pg_index.indexrelid = indexclass.oid
	join pg_class as tableclass 
	  on pg_index.indrelid = tableclass.oid
	join pg_namespace 
	  on pg_namespace.oid = indexclass.relnamespace
	join pg_am 
	  on indexclass.relam = pg_am.oid
	where pg_am.amname = 'btree'
	  and indexclass.relpages > 0
	  and nspname not in ('pg_catalog', 'information_schema') 
),
index_item_sizes as 
(
	select
		ind_atts.nspname,
		ind_atts.index_name,
		ind_atts.reltuples,
		ind_atts.relpages,
		ind_atts.relam,
		indrelid as table_oid,
		index_oid,
		current_setting('block_size')::numeric as bs,
		8 as maxalign,
		24 as pagehdr,
		case
			when max(coalesce(pg_stats.null_frac, 0)) = 0 then 2
			else 6
		end as index_tuple_hdr,
		sum( (1-coalesce(pg_stats.null_frac, 0)) * coalesce(pg_stats.avg_width, 1024) ) as nulldatawidth
	from pg_attribute
	join btree_index_atts as ind_atts 
	  on pg_attribute.attrelid = ind_atts.indexrelid
	 and pg_attribute.attnum = ind_atts.attnum
	join pg_stats 
	  on pg_stats.schemaname = ind_atts.nspname
	 and ((pg_stats.tablename = ind_atts.tablename
	 and pg_stats.attname = pg_catalog.pg_get_indexdef(pg_attribute.attrelid, pg_attribute.attnum, true))
	  or (pg_stats.tablename = ind_atts.index_name
	 and pg_stats.attname = pg_attribute.attname))
	where pg_attribute.attnum > 0
	group by
	    ind_atts.nspname,
		ind_atts.index_name,
		ind_atts.reltuples,
		ind_atts.relpages,
		ind_atts.relam,
		indrelid ,
		index_oid,
		pg_stats.null_frac
),
index_aligned_est as 
(
	select
		maxalign,
		bs,
		nspname,
		index_name,
		reltuples,
		relpages,
		relam,
		table_oid,
		index_oid,
		coalesce ( ceil ( reltuples * ( 6 + maxalign -
		case
			when index_tuple_hdr%maxalign = 0 then maxalign
			else index_tuple_hdr%maxalign
		end + nulldatawidth + maxalign -
		case
			when nulldatawidth::integer%maxalign = 0 then maxalign
			else nulldatawidth::integer%maxalign
		end )::numeric / ( bs - pagehdr::numeric ) + 1 ) , 0 ) as expected
	from index_item_sizes 
),
raw_bloat as 
(
	select
		current_database() as dbname,
		nspname,
		pg_class.relname as table_name,
		index_name,
		bs*(index_aligned_est.relpages)::bigint as totalbytes,
		expected,
		case
			when index_aligned_est.relpages <= expected then 0
			else bs*(index_aligned_est.relpages-expected)::bigint
		end as wastedbytes,
		case
			when index_aligned_est.relpages <= expected then 0
			else bs*(index_aligned_est.relpages-expected)::bigint * 100 / (bs*(index_aligned_est.relpages)::bigint)
		end as realbloat,
		pg_relation_size(index_aligned_est.table_oid) as table_bytes,
		stat.idx_scan as index_scans
	from index_aligned_est
	join pg_class 
	  on pg_class.oid = index_aligned_est.table_oid
	join pg_stat_user_indexes as stat 
	  on index_aligned_est.index_oid = stat.indexrelid 
),
final_bloat as 
(
	select
		dbname as database_name,
		nspname as schema_name,
		table_name,
		index_name,
		round(realbloat) as bloat_pct,
		round(wastedbytes /(1024 ^2)::numeric) as bloat_mb,
		round(totalbytes /(1024 ^2)::numeric, 3) as index_mb,
		round(table_bytes /(1024 ^2)::numeric, 3) as table_mb,
		index_scans
	from
		raw_bloat 
)
 select
	database_name,
	schema_name,
	table_name,
	index_name,
	bloat_pct,
	bloat_mb,
	index_mb,
	table_mb, 
	case when (index_mb >= 2048 and  bloat_pct > 25) then 'index_online_due_stage1'
	     when (index_mb >= 1024 and  index_mb < 2048 ) and bloat_pct > 30 then 'index_online_due_stage2'
	     when (index_mb >= 10   and  index_mb < 1024 )  and bloat_pct > 40 then 'index_online_due_stage3'
	     else 'not_due' end as index_maintenance_mode
from final_bloat;


create view maint.v_getbolatedobjects
as 
with cteBloatedObjects as 
(
	select  
		schema_name 			         					as object_schema,
		table_name  			         					as object_name,
		't'         			         					as object_type,
		table_real_size							        	as object_real_size,
		table_bloat_size							        as object_bloat_size,
		table_bloatsize_percent   							as object_bloatsize_percent
	from maint.v_gettablesbloatstats 
	union 
	select 
		schema_name,
		index_name,
		'i',
		index_mb,
		bloat_mb,
		bloat_pct
	from maint.v_getbtreeindexesbloatstats
)
select  object_schema,
		object_name,
		object_type,
		object_real_size,
		object_bloat_size,
		object_bloatsize_percent
from cteBloatedObjects;


