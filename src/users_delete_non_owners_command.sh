list=($(curl -s --request GET \
  --url ${CAMUNDA_CONSOLE_BASE_URL}/members \
  --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}" | jq -c '.[] | select(.roles | index("owner") | not) | .email'))

i=0
for email in "${list[@]}"
do
  ((i=i+1))
  echo -ne "[INFO] Processing ${i}/${#list[@]}: ${email:1:-1}\033[0K\r"
  curl -s --request DELETE \
    --url ${CAMUNDA_CONSOLE_BASE_URL}/members/${email:1:-1} \
    --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}"
done
echo "\n\nDONE."