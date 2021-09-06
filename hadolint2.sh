#!/bin/sh

if docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile.Alpha; then
    echo $?
    echo 'I got 0'
else
    echo $?
    echo 'I got 1'
fi


x=$(docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile)
z=$(echo $x | awk '{ print $3 }' | sed s/://g)

echo $z

if [[ $z == *"warning"* ]] || [[ $z == *"error"* ]] || [[ $z == *"info"* ]]; then
    echo "It's there"
fi

echo 'test 2'

y=$(docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile)
a=$(echo $y | awk '{ print $3 }' | sed s/://g)

if [[ $a == *"error"* ]]; then
    echo "It's there haha"
fi

echo $a

echo 'test 3'

docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile | grep 'error'
retVal=$?
if [ $retVal -ne 0 ]; then
    echo "No Error"
    docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile | grep 'warning' || true
    result_warn=$?
    if [ $result_warn -ne 0 ]; then
        echo "No Warning"
        docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile | grep 'info' || true
        result_info=$?
        if [ $result_info -ne 0 ]; then
            echo "No Info"
            echo "clean hadolint file good to go!"
        else
            echo "Found Info"
        fi
    fi
fi
