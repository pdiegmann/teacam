curl -s -f --request DELETE \
  --url ${CAMUNDA_CONSOLE_BASE_URL}/members/${args[mail]} \
  --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}"