FROM docker-sandbox.concurtech.net/eventservice/java:8
VOLUME ["/tmp", "/logs"]

COPY target/scala-2.10/*.jar /opt/KafkaOffsetMonitor.jar
COPY start.sh /start.sh

# Expose ports.
EXPOSE 8080

RUN bash -c 'touch /opt/*.jar'

ENTRYPOINT ./start.sh
