#!/usr/bin/env bash

# kafka cluster name
KAFKA_CLUSTER=logging-kafka
# kafka cluster ns
KAFKA_NAMESPACE=amq-logging
# name of consumer kafka user
KAFKA_USER=consumer-kafkauser

# if ran before clear collected files before running again
rm truststore.jks user.p12 client.properties

# extract user password
USER_PASSWORD=$(oc extract secret/$KAFKA_USER -n $KAFKA_NAMESPACE --keys=user.password --to=-)

# extract consumer kafka user p12 cert
oc extract secret/$KAFKA_USER -n $KAFKA_NAMESPACE --keys=user.p12 --to=- > user.p12

# extract kafka cluster - cluster cert i.e root cert & write to ca.crt
oc extract secret/$KAFKA_CLUSTER-cluster-ca-cert -n $KAFKA_NAMESPACE --keys=ca.crt --to=- > ca.crt

# add root cert to trust store & secure with password from consumer kafka user
echo "yes" | keytool -import -trustcacerts -file ca.crt -keystore truststore.jks -storepass $USER_PASSWORD

# create client.properties file
printf "security.protocol=SSL\nssl.truststore.location=./truststore.jks\nssl.truststore.password=$USER_PASSWORD\nssl.keystore.location=./user.p12\nssl.keystore.password=$USER_PASSWORD\ngroup.id=consumer-log-group" > client.properties


rm ca.crt
