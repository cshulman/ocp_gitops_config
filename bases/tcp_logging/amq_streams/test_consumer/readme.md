To test that the connection is set up correctly & logs are being forwarded, utilizing the consumer with the permissions to read the three logging topics.

Before runing the consumer test, run the `prep-consumer-test.sh` to add the neccessary certs to the keystore & create the client.properties file.

Then execute:
`kfk console-consumer --topic app-topic -n amq-logging -c logging-kafka --consumer.config=client.properties --from-beginning`

Change the topic name based on the topic you wish to test. 
`kfk console-consumer --topic <topic-name> -n <kafkacluster-ns> -c <kafkacluster-name> --consumer.config=client.properties --from-beginning`

To view live logs instead of all log, remove optional `--from-beginning` flag. 


