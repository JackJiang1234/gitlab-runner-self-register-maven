FROM gitlab/gitlab-runner:latest
COPY run.sh /home/gitlab-runner/bin/run.sh
RUN apt-get update && apt-get install openjdk-8-jdk maven docker.io -y && apt update && apt upgrade -y
RUN echo "#the following will increase the heap" >> /etc/environment
RUN echo 'MAVEN_OPTS="-Xmx768m"' >> /etc/environment
COPY settings-sample.xml /etc/maven/settings.xml
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/bin/run.sh"]
