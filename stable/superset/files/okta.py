import os
from typing import List

from superset.security import SupersetSecurityManager
from flask_appbuilder.security.manager import AUTH_OAUTH

provider_token_key_name: str
default_admin_emails: List[str]

AUTH_TYPE = AUTH_OAUTH
AUTH_USER_REGISTRATION = True

AUTH_DEFAULT_ADMIN_EMAILS = default_admin_emails
# See all available roles in https://superset.apache.org/docs/security
AUTH_DEFAULT_ADMIN_ROLE = "Admin"
AUTH_DEFAULT_NON_ADMIN_ROLE = "Gamma"

# See: https://flask-appbuilder.readthedocs.io/en/latest/security.html#authentication-oauth
AUTH_ROLES_MAPPING = {
    # NOTE: A little bit inflexible for now, but should do the work
    AUTH_DEFAULT_ADMIN_ROLE: [AUTH_DEFAULT_ADMIN_ROLE],
    AUTH_DEFAULT_NON_ADMIN_ROLE: [AUTH_DEFAULT_NON_ADMIN_ROLE],
}

OKTA_BASE_URL = os.environ["OKTA_BASE_URL"]
OKTA_CLIENT_ID = os.environ["OKTA_CLIENT_ID"]
OKTA_CLIENT_SECRET = os.environ["OKTA_CLIENT_SECRET"]
OKTA_METADATA_URL = os.environ["OKTA_METADATA_URL"]


OAUTH_PROVIDERS = [
    {
        "name": "okta",
        "token_key": provider_token_key_name,
        "icon": "fa-sign-in",
        "remote_app": {
            "client_id": OKTA_CLIENT_ID,
            "client_secret": OKTA_CLIENT_SECRET,
            "server_metadata_url": OKTA_METADATA_URL,
            "api_base_url": OKTA_BASE_URL,
            "client_kwargs": {
                "scope": "openid profile email groups",
            },
        },
    }
]


class CustomSsoSecurityManager(SupersetSecurityManager):
    def oauth_user_info(self, provider, response=None):
        if provider == "okta":
            user: dict[str, str] = (
                self.appbuilder.sm.oauth_remotes[provider].get("userinfo").json()
            )
            return {
                "username": user["preferred_username"],
                "email": user["email"],
                "first_name": user["given_name"],
                "last_name": user["family_name"],
                "role_keys": [
                    AUTH_DEFAULT_ADMIN_ROLE
                    if user["email"] in AUTH_DEFAULT_ADMIN_EMAILS
                    else AUTH_DEFAULT_NON_ADMIN_ROLE
                ],
            }


CUSTOM_SECURITY_MANAGER = CustomSsoSecurityManager
