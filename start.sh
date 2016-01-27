#!/bin/bash

# log output of this script
exec > >( tee -a /logs/configure-and-start.out )
exec 2>&1

# REQUIRED:
#   ZOOKEEPER_BOOTSTRAP_SERVERS

if [[ $ZOOKEEPER_BOOTSTRAP_SERVERS ]] ; then
    ZKOPTION="--zk $ZOOKEEPER_BOOTSTRAP_SERVERS"
fi

java -cp /opt/KafkaOffsetMonitor.jar com.quantifind.kafka.offsetapp.OffsetGetterWeb --offsetStorage kafka $ZKOPTION --port 8080 --refresh 10.seconds --retain 2.days --kafkaOffsetForceFromStart true
