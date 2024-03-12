# Start with a base image of Alpine with OpenJDK 17
FROM openjdk:17-jdk-alpine
# Verify Java installation
RUN java -version
# Install wget and tar
RUN apk add --no-cache wget tar bash
# Install Ant 1.10.14
RUN wget https://downloads.apache.org/ant/binaries/apache-ant-1.10.14-bin.tar.gz -P /tmp \
&& tar -xzvf /tmp/apache-ant-1.10.14-bin.tar.gz -C /opt \
&& ln -s /opt/apache-ant-1.10.14 /opt/ant \
&& rm /tmp/apache-ant-1.10.14-bin.tar.gz
# Set Ant environment variables
ENV JAVA_HOME=jdk-install-dir
ENV ANT_HOME=/opt/ant
ENV PATH=${ANT_HOME}/bin:${PATH}
# Verify Ant installation
RUN ant -version
