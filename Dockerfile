FROM centos:centos8

LABEL maintainer="Seu Nome / E-mail"

RUN yum update -y && \
      yum install -y git && \
      yum install -y java-11-openjdk-devel.x86_64 && \
      yum clean all

ENV JAVA_HOME /etc/alternatives/java_sdk_11_openjdk


RUN cd /opt && \
      curl -O https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz && \
      tar -xzvf apache-maven-3.6.3-bin.tar.gz && \
      ln -sf /opt/apache-maven-3.6.3/bin/mvn /usr/local/bin



COPY pom.xml pom.xml
COPY src src

RUN mvn clean install

EXPOSE 8080

USER 1001

HEALTHCHECK --interval=10s --timeout=3s \
  CMD curl -f http://localhost:8080 || exit 1



CMD ["java", "-jar", "/target/testeprobe-0.0.1-SNAPSHOT.jar"]


