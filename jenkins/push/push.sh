#/bin/bash

echo "*************************"
echo "**************Pushing images********************"
echo "********************************"

IMAGE="maven-project"

echo "**** Docker login***"

docker login -u abdulhafis786 -p $PASS

echo "***** Tagging image******"

docker tag $IMAGE:$BUILD_TAG abdulhafis786/$IMAGE:$BUILD_TAG

echo "********** Pushing image *********"

docker push abdulhafis786/$IMAGE:$BUILD_TAG
