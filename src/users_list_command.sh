curl -s --request GET \
  --url ${CAMUNDA_CONSOLE_BASE_URL}/members \
  --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}"