FROM gitlab/gitlab-runner:latest
COPY run.sh /home/gitlab-runner/bin/run.sh
RUN apt-get update && apt-get install openjdk-8-jdk maven docker.io sudo supervisor nginx nodejs -y && apt update && apt upgrade -y 
RUN echo "#the following will increase the heap" >> /etc/environment
RUN echo 'MAVEN_OPTS="-Xmx768m"' >> /etc/environment
RUN echo "gitlab-runner  ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir -p /project/mm 
RUN chown –R gitlab-runner:gitlab-runner /project/mm
COPY settings-sample.xml /etc/maven/settings.xml
COPY mm.conf /etc/supervisor/conf.d/mm.conf
COPY backend_api.jar /project/mm
EXPOSE 80 8080 8090 9000 
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/bin/run.sh"]
