# gitlab-runner-self-register-maven

usage
-----
sudo docker run -v {location of register-run-maven.sh}:/home/gitlab-runner -it mxl125/gitlab-runner-self-register-maven:latest

register-run-maven.sh
-------------------------
/usr/bin/gitlab-runner register --non-interactive --executor "shell" --url "http://X.X.X.X" --registration-token "XXX" --description "gitlab_runner_maven" --tag-list "maven" --run-untagged="false" --locked="false"
/usr/bin/gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner