
#!/bin/bash
set -e
set -x

if [ "${GITLAB_REGISTRATION_TOKEN}" == "" ] ; then
  echo "no GITLAB_REGISTRATION_TOKEN present"
  exit 1
fi

#exit if gitlab is not ready, and docker will try again
curl -L ${GITLAB_URL}

echo "unregister"
/usr/bin/gitlab-runner unregister --all-runners

rm -rf /home/gitlab-runner/builds/*

echo "initializing"
  /usr/bin/gitlab-runner register \
    --non-interactive \
    --executor "shell" \
    --url "${GITLAB_URL}" \
    --registration-token "${GITLAB_REGISTRATION_TOKEN}" \
    --tag-list "${GITLAB_RUNNER_TAGLIST}"\
    --run-untagged="false" \
    --locked="false"\
    --description "${GITLAB_RUNNER_DESCRIPTION} (${HOSTNAME})"

echo "running"
/usr/bin/gitlab-runner run \
  --user=gitlab-runner \
  --working-directory=/home/gitlab-runner 


