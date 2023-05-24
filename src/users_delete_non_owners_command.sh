list=$(curl -s -f --request GET \
  --url ${CAMUNDA_CONSOLE_BASE_URL}/members \
  --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}" | jq -c '. - map(select(.roles[] | contains ("owner"))) | .[] .email')

i=0
for email in "${list[@]}"
do
  ((i=i+1))
  echo -ne "[INFO] Processing ${i}/${${#list[@]}}: ${email}}\033[0K\r"
  curl -s -f --request DELETE \
    --url ${CAMUNDA_CONSOLE_BASE_URL}/members/${email} \
    --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}"
done
echo "\n\nDONE."