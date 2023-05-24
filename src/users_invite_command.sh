curl -s --request POST \
  --url ${CAMUNDA_CONSOLE_BASE_URL}/members/${args[mail]} \
  --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}" \
  --header "Content-Type: application/json" \
  --data "{\"orgRoles\": [\"developer\", \"analyst\"]}"