FROM gitlab/gitlab-runner:latest
COPY run.sh /home/gitlab-runner/bin/run.sh
RUN apt-get update && apt-get install openjdk-8-jdk maven docker.io -y
RUN echo "#the following will increase the heap" >> /etc/environment
RUN echo 'MAVEN_OPTS="-Xmx768m"' >> /etc/environment
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/bin/run.sh"]
