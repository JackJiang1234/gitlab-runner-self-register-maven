FROM gitlab/gitlab-runner:latest
RUN apt-get update && apt-get install openjdk-8-jdk maven docker.io sudo supervisor nginx -y && apt update && apt upgrade -y 
RUN curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
RUN apt-get install nodejs
RUN echo "#the following will increase the heap" >> /etc/environment
RUN echo 'MAVEN_OPTS="-Xmx768m"' >> /etc/environment
RUN echo "gitlab-runner  ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /project/mm/logs
COPY run.sh /home/gitlab-runner/bin/run.sh
COPY settings-sample.xml /etc/maven/settings.xml
COPY mm.conf /etc/supervisor/conf.d/mm.conf
COPY backend_api.jar /project/mm
EXPOSE 80 8080 8090 9000 
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/bin/run.sh"]
