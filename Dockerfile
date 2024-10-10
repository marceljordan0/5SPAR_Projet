FROM jupyter/pyspark-notebook:latest

USER root
RUN apt-get update && apt-get install -y curl && \
    mkdir -p /opt/spark/jars && \
    curl -o /opt/spark/jars/spark-sql-kafka-0-10_2.12-3.4.0.jar https://repo1.maven.org/maven2/org/apache/spark/spark-sql-kafka-0-10_2.12/3.4.0/spark-sql-kafka-0-10_2.12-3.4.0.jar && \
    curl -o /opt/spark/jars/kafka-clients-2.8.1.jar https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.8.1/kafka-clients-2.8.1.jar

USER jovyan