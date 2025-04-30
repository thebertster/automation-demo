#!/bin/bash

AVI_CONTROLLER_IP="10.6.248.91"
AVI_USERNAME="admin"
AVI_TENANT_NAME="admin"
AVI_VERSION="30.2.2"

echo -n Password:
read -s AVI_PASSWORD
echo

echo "Call login API..."
curl -k -i -c ./cookie-jar -H "X-Avi-Version: $AVI_VERSION" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" -d '{"username": "'$AVI_USERNAME'", "password": "'$AVI_PASSWORD'"}' -POST "https://$AVI_CONTROLLER_IP/login"

AVI_CSRF_TOKEN=$(sed -nr "s/.*csrftoken\s+(.*)$/\1/p" ./cookie-jar)

echo
echo
echo CSRF Token from cookie: $AVI_CSRF_TOKEN

echo
read -p "Next..."
echo
echo

echo "Delete Virtual Service"

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" -H "X-Avi-UserAgent: UI" -X DELETE "https://$AVI_CONTROLLER_IP/api/virtualservice/virtualservice-38202d35-4a0a-4509-8110-75138ca1fe2b"

rm ./cookie-jar
