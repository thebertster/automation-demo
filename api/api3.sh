#!/bin/bash

AVI_CONTROLLER_IP="10.6.248.91"
AVI_USERNAME="admin"
AVI_TENANT_NAME="admin"
AVI_VERSION="30.2.2"

echo -n Password:
read -s AVI_PASSWORD
echo

echo "Call login API..."
curl -k -i -c ./cookie-jar -H "X-Avi-Version: $AVI_VERSION" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" -d '{"username": "'$AVI_USERNAME'", "password": "'$AVI_PASSWORD'"}' -X POST "https://$AVI_CONTROLLER_IP/login"

AVI_CSRF_TOKEN=$(sed -nr "s/.*csrftoken\s+(.*)$/\1/p" ./cookie-jar)

echo
echo
echo CSRF Token from cookie: $AVI_CSRF_TOKEN

echo
read -p "Next..."
echo
echo

echo "Batch Disable Server across all Pools"

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json"  --data-binary "@./server.json" -X POST "https://$AVI_CONTROLLER_IP/api/server/disable"

echo
read -p "Next..."
echo
echo

echo "Batch Enable Server across all Pools"

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json"  --data-binary "@./server.json" -X POST "https://$AVI_CONTROLLER_IP/api/server/enable"

rm ./cookie-jar
