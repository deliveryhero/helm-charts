#!/bin/bash

#
# PostgreSQL pg_repack wrapper 1.1 
# This script will repack the objects ( tables or indexes ) in the current context of db based upon the certain conditions.
# And it will pick up the binary version ( repacking the objects) based upon the installed extension version in current context database. 
# This can be used as standalone or any container.  

# set : environment variables.    
export PGPASSWORD=${PGPASSWORD}
export PGHOST=${PGHOST}
export PGUSER=${PGUSER}
export PGDATABASE=${PGDATABASE}

# set : args variables with default if the values are not passed during exec. 
export PG_REPACK_OBJECTLIST_TYPE=${1:-"query"} # pg_repack object list type : passed as sql query to reterieve the list of objects ( tables/indexes) and array.
export PG_REPACK_OBJECTLIST=${2:-"select schemaname||'.'||tablename from pg_catalog.pg_tables where schemaname = 'public' "} # sql command which retrun object lists for repacking ( by default repack all the tables in the database with public schema).
export PG_REPACK_CLEANUP=${3:-"true"}  # cleanup is enabled or disabled ( by default enabled). 
export PG_REPACK_DETAILED_LOGGING=${4:-"true"} # pg_repack command logging  is enabled or disabled ( by default enabled).
export PG_REPACK_PARALLEL_JOB=${5:-"4"} # pg_repack parrellism is enabled with optimal core values numbers  ( 2 , 4 ...) and disabled with value 0 ( by default enabled with 4 cpu core).
export PG_REPACK_INSTALL_MAINT_OBJECTS=${6:-"true"} # custom maintenance objects : installed or not ( by default true).
export SQLFILEPATH=${7:-"SQL/install_maint_schema.sql"} # script custom maintenace objects file path.

# log : environment variables  
echo Received PGUSER: $PGUSER
echo Received PGDATABASE: $PGDATABASE
echo Received PGHOST: $PGHOST

# log : argurment variables
echo Received PG_REPACK_OBJECTLIST_TYPE: $PG_REPACK_OBJECTLIST_TYPE
echo Received PG_REPACK_OBJECTLIST: $PG_REPACK_OBJECTLIST
echo Received PG_REPACK_CLEANUP: $PG_REPACK_CLEANUP
echo Received PG_REPACK_DETAILED_LOGGING: $PG_REPACK_DETAILED_LOGGING
echo Received PG_REPACK_PARALLEL_JOB: $PG_REPACK_PARALLEL_JOB
echo Received PG_REPACK_INSTALL_MAINT_OBJECTS: $PG_REPACK_INSTALL_MAINT_OBJECTS
echo Received SQLFILEPATH: $SQLFILEPATH


# local variables : used for storing the intermediate output.
PG_REPACK_EXT_VERSION=""
PG_REPACK_COMMAND=""
PG_REPACK_MAINT_SCHEMA=""
PG_REPACK_OBJECT_SIZE=""
PG_OBJECT_TYPE="r"


# local variable: store sql command variable for pg_repack extension and maint schema existence.
MAINT_SCHEMA_EXISTENCE_SQL="select nspname from pg_catalog.pg_namespace where nspname  = 'maint';"
PG_REPACK_EXT_EXISTENCE_SQL="select extversion from pg_catalog.pg_extension where extname  = 'pg_repack';"

# functions 

# cleanup function: This will drops pg_repack extension ( depended objects) and main schema ( depended objects).
cleanup(){
    psql -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE"  << EOF
        DROP EXTENSION IF EXISTS pg_repack CASCADE;
        DROP SCHEMA IF EXISTS maint CASCADE;
EOF
}

# pg_object_type function : This will retrun the object type ( 'r' for table or 'i' index )
pg_object_type(){
    local object_name="$1"
    local object_type_sql="select relkind from pg_class where relname = substring('$object_name', position('.' in '$object_name') + 1 ); "
    PG_OBJECT_TYPE=$(psql -qtAX -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE" -c "$object_type_sql")
    if [ "$PG_OBJECT_TYPE" = "r" ]; then PG_OBJECT_TYPE=" -t "; elif  [ "$PG_OBJECT_TYPE" = "i" ]; then PG_OBJECT_TYPE=" -i "; fi
}
# pg_repack_exit function: This functions will install the pg_repack extension in the connection context database.
pg_repack_ext() {
    psql -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE"  << EOF
        DROP EXTENSION IF EXISTS pg_repack CASCADE;
        CREATE EXTENSION pg_repack;
        ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT INSERT ON TABLES TO PUBLIC;
        ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT USAGE, SELECT ON SEQUENCES TO PUBLIC;
EOF
}

# pg_repack_ext_version function : extract the version of installed pg_repack extension in the context database.
pg_repack_ext_version(){
    PG_REPACK_EXT_VERSION=$( psql -qtAX -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE"  -c "$PG_REPACK_EXT_EXISTENCE_SQL")
}

# pg_repack_command function : prepare the base command for pg_repack binary call
# there is bug in pg_repack_version  1.4.3 ( expression indexes , few operator class in the indexes with parallel job). 
# As a workaround , parallel job parameter is set to empty to diabled it.  
pg_repack_command(){
    if [ "$PG_REPACK_EXT_VERSION" = "1.4.3" ]; then PG_REPACK_PARALLEL_JOB=""; else PG_REPACK_PARALLEL_JOB=" -j ${PG_REPACK_PARALLEL_JOB} " ; fi
    if [ "$PG_REPACK_DETAILED_LOGGING" = "true" ]; then PG_REPACK_DETAILED_LOGGING=" -e "; else PG_REPACK_DETAILED_LOGGING=""; fi
    PG_REPACK_COMMAND="time ./pg_repack-$PG_REPACK_EXT_VERSION/bin/pg_repack -h ${PGHOST} --user ${PGUSER}  -k $PG_REPACK_PARALLEL_JOB $PG_REPACK_DETAILED_LOGGING ${PGDATABASE}"
}

# pg_repack_maint_objects : This will install the maint objects as scripted in sql file.
pg_repack_maint_objects(){
    psql -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE" -w -f "$SQLFILEPATH"
}

# pg_repack_maint_exist function : This will retrun the existence of maint schema in current context of the database.
pg_repack_maint_exist(){
    PG_REPACK_MAINT_SCHEMA=$(psql -qtAX -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE" -c "$MAINT_SCHEMA_EXISTENCE_SQL")
}
# pg_repack_object_size function : This function will calculate the object size ( which is used before and after the pg_repack)
pg_repack_object_size(){
    local object_name="$1"
    local object_size_sql="select pg_size_pretty (pg_relation_size('$object_name'));"
    PG_REPACK_OBJECT_SIZE=$(psql -qtAX -h "$PGHOST"  -U "$PGUSER" -d "$PGDATABASE" -c "$object_size_sql")
    
}
# pg_repack function : This is main wrapper function which will do the actual repacking of the objects.
# Step 1 : It will call pg_repack_command function for the base command for pg_repack
# Step 2 : set the type option switch flag (  ---table  or --index ) for pg_repack command.
# step 3 : object list is retruned from current context database based upon sql passed in pg_repack_object_list arg and result is stored in memory recordset.
# step 4 : process the recordset ( object list) for repacking in while loop. 
pg_repack(){
    pg_repack_command $PG_REPACK_COMMAND
    if [ "$PG_REPACK_OBJECTLIST_TYPE" = "array" ] 
    then 
        PG_REPACK_OBJECTLIST="select relname from pg_class where relname in  (select unnest(ARRAY[$PG_REPACK_OBJECTLIST]));" ; 
    fi 
    psql -h "$PGHOST"  -U "$PGUSER" -At -d "$PGDATABASE" -c "$PG_REPACK_OBJECTLIST" \
        | while read -a Record ; do
            object_name=${Record[0]}
            unset COMMAND
            unset PG_REPACK_OBJECT_SIZE
            unset PG_OBJECT_TYPE
            pg_object_type $object_name
            pg_repack_object_size $object_name
            echo "Size of $object_name before pg_repacking: $PG_REPACK_OBJECT_SIZE."
            COMMAND="$PG_REPACK_COMMAND $PG_OBJECT_TYPE $object_name"
            echo $COMMAND
            eval $COMMAND
            unset PG_REPACK_OBJECT_SIZE
            pg_repack_object_size $object_name
            echo "Size of $object_name after pg_repacking: $PG_REPACK_OBJECT_SIZE."
        done       
}

# Run command 

# run cleanup function command if PG_REPACK_CLEANUP is set to "true" 
if [  "$PG_REPACK_CLEANUP" = "true" ]
then
    cleanup
fi

# run pg_repack_ext_version function command to get the pg_repack extension value.
pg_repack_ext_version $PG_REPACK_EXT_VERSION

# run pg_repack_ext function command to installed the pg_repack extension if wasn't installed. 
if [ -z "$PG_REPACK_EXT_VERSION" ]
then
    pg_repack_ext
    pg_repack_ext_version $PG_REPACK_EXT_VERSION
fi

# run pg_repack_maint_exist function command to check the existence for maint schema. 
pg_repack_maint_exist $PG_REPACK_MAINT_SCHEMA

# run pg_repack_maint_objects function command to installed the maintenance objects as per defined condtition
if [ -z "$PG_REPACK_MAINT_SCHEMA" ] && [ "$PG_REPACK_INSTALL_MAINT_OBJECTS" = "true" ]
then
    echo "Installing then maintenance objects"
    pg_repack_maint_objects
fi

# run pg_repack function command  for repacking the objects. 
pg_repack $PG_REPACK_OBJECTLIST_TYPE

exit 0

