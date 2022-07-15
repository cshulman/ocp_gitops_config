To test that logs are being forwarder to the respective topics run the following to create a temporary consumer:


note: to view live logs only, remove `--from-beginning` flag from consumer run command.

- infra logs:
oc run kafka-consumer -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server logging-kafka-kafka-bootstrap.amq-logging.svc.cluster.local:9092 --topic infra-topic --from-beginning

- app-logs:
oc run kafka-consumer -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server logging-kafka-kafka-bootstrap.amq-logging.svc.cluster.local:9092 --topic app-topic --from-beginning


- audit-logs
oc run kafka-consumer -ti --image=registry.redhat.io/amq7/amq-streams-kafka-31-rhel8:2.1.0 --rm=true --restart=Never -- bin/kafka-console-consumer.sh --bootstrap-server logging-kafka-kafka-bootstrap.amq-logging.svc.cluster.local:9092 --topic audit-topic --from-beginning
