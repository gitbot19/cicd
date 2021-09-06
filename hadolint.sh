#!/bin/sh
echo 'testing start'
docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile.Alpha

echo 'next file ---- '
docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile || true

#warning=$(docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile.Alpha | awk '{ print $3 }' | sed 's/://')


echo 'test 3'

docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile > output.txt

echo 'test 4'


docker run --rm -i -v /Users/mayom/Desktop/cicd/.hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile > all_reports.json 
echo 'the end'