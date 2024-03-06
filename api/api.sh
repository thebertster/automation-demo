#!/bin/bash

AVI_CONTROLLER_IP="10.206.112.60"
AVI_USERNAME="admin"
AVI_TENANT_NAME="automation-demo"
AVI_VERSION="22.1.5"

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

echo "Create VsVip..."

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" --data-binary "@./vsvip.json" -POST "https://$AVI_CONTROLLER_IP/api/vsvip"

echo
read -p "Next..."
echo
echo

echo "Create Pool..."

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" --data-binary "@./pool.json" -POST "https://$AVI_CONTROLLER_IP/api/pool"

echo
read -p "Next..."
echo
echo

echo "Create VirtualService..."

curl -k -i -b ./cookie-jar -H "X-CSRFToken: $AVI_CSRF_TOKEN" -H "Referer: https://$AVI_CONTROLLER_IP/" -H "X-Avi-Tenant: $AVI_TENANT_NAME" -H "Content-Type: application/json" --data-binary "@./vs.json" -POST "https://$AVI_CONTROLLER_IP/api/virtualservice"

rm ./cookie-jar
