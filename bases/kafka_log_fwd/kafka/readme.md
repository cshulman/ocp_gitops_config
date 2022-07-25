To test the kafka cluster & topic configuration, a producer is needed to write information to the topic & a consumer is needed to read that. 


- Producer:
To create a temporary producer  for a topic called my-topic, in a kafka cluster with the configuration in this repository run the following:

oc run kafka-producer -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list logging-kafka-kafka-bootstrap.kafka-logging.svc.cluster.local:9092 --topic my-topic


- Consumer:
To create a temporary consumer, for a topic called my-topic, in a kafka cluster with the configuration in this repository run the following:

oc run kafka-consumer -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server logging-kafka-kafka-bootstrap.kafka-logging.svc.cluster.local:9092 --topic my-topic --from-beginning

note: to view live logs only, remove `--from-beginning` flag from consumer run command.



Example commands:
Producer & consumer run commands can be modified as needed by using the below examples:

- Producer:
oc run <producer-pod-name> -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-producer.sh --broker-list <kafka-cluster-bootstrap-service>-<kafka-cluster-namespace>.svc.cluster.local:<port> --topic <topic-name>

- Consumer: (with optional --from-beginning flag)
oc run <consumer-pod-name>-ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server <kafka-cluster-bootstrap-service>-<kafka-cluster-namespace>.svc.cluster.local:<port> --topic <topic-name> --from-beginning


Note that if the command is being run in the same namespace as the kafka cluster, then the --bootstrap-server parameter can be modified to the local service instead of the FQDN of the service. This is done by removing -<kafka-cluster-namespace>.svc.cluster.local. Instead, the parameter would look as follows:  --bootstrap-server <kafka-cluster-bootstrap-service>:<port> 

# Secure Kafka resources
- Listener Authentication: https://access.redhat.com/documentation/en-us/red_hat_amq_streams/2.1/html-single/configuring_amq_streams_on_openshift/index#con-securing-kafka-authentication-str

- Securing Kafka Brokers: https://access.redhat.com/documentation/en-us/red_hat_amq_streams/2.1/html-single/configuring_amq_streams_on_openshift/index#con-securing-kafka-authentication-str

- Configuring Internal clients (in OCP cluster) to trust cluster CA: https://access.redhat.com/documentation/en-us/red_hat_amq_streams/2.1/html-single/configuring_amq_streams_on_openshift/index#configuring-internal-clients-to-trust-cluster-ca-str


- User Authentication: https://access.redhat.com/documentation/en-us/red_hat_amq_streams/2.1/html-single/configuring_amq_streams_on_openshift/index#con-securing-client-authentication-str

- Securing User access to Kafka: https://access.redhat.com/documentation/en-us/red_hat_amq_streams/2.1/html-single/configuring_amq_streams_on_openshift/index#proc-configuring-kafka-user-str
