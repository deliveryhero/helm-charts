{{- define "superset_config_variables" -}}
import os

cache_default_timeout = {{ .Values.superset.redis.default_timeout }}
cache_key_prefix = {{ .Values.superset.redis.key_prefix | quote }}
cache_redis_host = {{ .Values.superset.redis.hostname | quote }}
cache_redis_port = {{ .Values.superset.redis.port }}
cache_redis_db = {{ .Values.superset.redis.cacheDbIndex | quote }}
cache_redis_url = f"redis://{cache_redis_host}:{cache_redis_port}/{cache_redis_db}"

sqlalchemy_database_engine = {{ .Values.superset.database.engine | quote }}
sqlalchemy_database_username = os.getenv("DB_USERNAME", "")
sqlalchemy_database_password = os.getenv("DB_PASSWORD", "")
sqlalchemy_database_address = {{ include "superset.database.address" . | quote }}
sqlalchemy_database_uri = f"{sqlalchemy_database_engine}://{sqlalchemy_database_username}:{sqlalchemy_database_password}@{sqlalchemy_database_address}"

celery_broker_url = f"redis://{cache_redis_host}:{cache_redis_port}/{{ .Values.superset.redis.brokerDbIndex }}"
celery_result_backend = f"redis://{cache_redis_host}:{cache_redis_port}/{{ .Values.superset.redis.brokerDbIndex }}"

results_backend_host = cache_redis_host
results_backend_port = cache_redis_port
results_backend_key_prefix = "superset_results"
{{ end }}
