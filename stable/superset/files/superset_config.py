import os
from cachelib.redis import RedisCache

cache_default_timeout: int
cache_key_prefix: str
cache_redis_host: str
cache_redis_port: int
cache_redis_db: str
cache_redis_url: str

sqlalchemy_database_engine: str
sqlalchemy_database_username: str
sqlalchemy_database_password: str
sqlalchemy_database_address: str
sqlalchemy_database_uri: str

celery_broker_url: str
celery_result_backend: str

results_backend_host: str
results_backend_port: str
results_backend_key_prefix: str

MAPBOX_API_KEY = os.getenv("MAPBOX_API_KEY", "")

CACHE_CONFIG = {
    "CACHE_TYPE": "redis",
    "CACHE_DEFAULT_TIMEOUT": cache_default_timeout,
    "CACHE_KEY_PREFIX": cache_key_prefix,
    "CACHE_REDIS_HOST": cache_redis_host,
    "CACHE_REDIS_PORT": cache_redis_port,
    "CACHE_REDIS_DB": cache_redis_db,
    "CACHE_REDIS_URL": cache_redis_url,
}

DATA_CACHE_CONFIG = CACHE_CONFIG
SQLALCHEMY_DATABASE_URI = sqlalchemy_database_uri
SQLALCHEMY_TRACK_MODIFICATIONS = True
SECRET_KEY = os.getenv("SECRET_KEY", "")
# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = True
# Add endpoints that need to be exempt from CSRF protection
WTF_CSRF_EXEMPT_LIST = []
# A CSRF token that expires in 1 year
WTF_CSRF_TIME_LIMIT = 60 * 60 * 24 * 365


class CeleryConfig(object):
    BROKER_URL = celery_broker_url
    CELERY_IMPORTS = ("superset.sql_lab",)
    CELERY_RESULT_BACKEND = celery_result_backend
    CELERY_ANNOTATIONS = {"tasks.add": {"rate_limit": "10/s"}}


CELERY_CONFIG = CeleryConfig

RESULTS_BACKEND = RedisCache(
    host=results_backend_host,
    port=results_backend_port,
    key_prefix=results_backend_key_prefix,
)
