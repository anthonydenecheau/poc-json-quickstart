#!/bin/sh

## Start the proxy
# pending fix : cf. https://github.com/quarkusio/quarkus/issues/9985
echo "Start the proxy"
/usr/local/bin/cloud_sql_proxy -instances=${DATASOURCE_URL}=tcp:5432 -credential_file=ws-openid.json &

# wait for the proxy to spin up
sleep 10

## Start the server
echo "Start the server"
./application -Dquarkus.http.host=0.0.0.0 -Dquarkus.http.port=$PORT -Djavax.net.ssl.trustStore=/work/cacerts