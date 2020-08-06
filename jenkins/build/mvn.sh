#/bin/bash

echo "************************"
echo "******BUILDING JAR******"
echo "************************"

#Here the full path of the Jenkins workspace is given as the Git repo is downloaded to the workspace loacation
docker run --rm -v /root/jenkins-data/jenkins_home/workspace/pipeline-docker-maven/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
