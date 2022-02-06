#
kafka-topics --bootstrap-server broker:29092 --list 

#
kafka-topics --bootstrap-server broker:29092 --create --replication-factor 1 --partitions 1 --topic favourite-color-input

kafka-topics --bootstrap-server broker:29092 --create --replication-factor 1 --partitions 1 --topic user-keys-and-colours --config cleanup.policy=compact

kafka-topics --bootstrap-server broker:29092 --create --replication-factor 1 --partitions 1 --topic favourite-color-output --config cleanup.policy=compact


