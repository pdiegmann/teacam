lines=$(cat ${args[file]} | sed '/^\s*$/d' | wc -l | xargs)
i=0
while read -r line
do
  ((i=i+1))
  echo -ne "[INFO] Processing ${i}/${lines}: ${line}}\033[0K\r"
  curl --request POST \
    --url ${CAMUNDA_CONSOLE_BASE_URL}/members/${line} \
    --header "Authorization: Bearer ${CAMUNDA_OAUTH_TOKEN}" \
    --header "Content-Type: application/json" \
    --data "{\"orgRoles\": [\"developer\", \"analyst\"]}"
done < ${args[file]}
echo "\n\nDONE."