FROM gitlab/gitlab-runner:latest
RUN apt-get update && apt-get install openjdk-8-jdk maven -y
ENTRYPOINT ["/bin/bash", "-c", "/home/gitlab-runner/register-run.sh"]