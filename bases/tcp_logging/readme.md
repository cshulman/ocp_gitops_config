When utilizing mTLS auth for clusterlogforwarding, there must exist a secret in the openshift-logging namespace that contains the following key-calue pairs.


- key: ca-bundle.crt:
	- value: ca.crt from the original (in the kafka cluster ns) logging-kafkauser secret AND the cluster ca.crt aka the root ca from the logging-kafka-cluster-ca-cert secret (in the kafka cluster ns) 


- key: tls.crt 
	- value: user.crt from the original (in the kafka cluster ns) logging-kafkauser secret

- key: tls.key
	- value: user.key from the original (in the kafka cluster ns) logging-kafkauser secret


Note: the secrets may be different in your cluster based on what you named things. In the above examples the kafka cluster is named `logging-kafka` and the root ca is located in a secret named <kafka-cluster>-cluster-ca-cert. & the kafka user is named logging-kafkauser.

