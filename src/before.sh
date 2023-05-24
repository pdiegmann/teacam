## before hook
##
## Any code here will be placed inside a `before_hook()` function and called
## before running any command (but after processing its arguments).
##
## You can safely delete this file if you do not need it.
CAMUNDA_OAUTH_TOKEN=$(curl -s -f --request POST \
  --url ${CAMUNDA_OAUTH_URL} \
  --header 'Content-Type: application/json' \
  --data "{\"grant_type\":\"client_credentials\", \"audience\":\"${CAMUNDA_CONSOLE_OAUTH_AUDIENCE}\", \"client_id\":\"${CAMUNDA_CONSOLE_CLIENT_ID}\", \"client_secret\":\"${CAMUNDA_CONSOLE_CLIENT_SECRET}\"}" | jq '.access_token')
CAMUNDA_OAUTH_TOKEN=${CAMUNDA_OAUTH_TOKEN:1:-1}