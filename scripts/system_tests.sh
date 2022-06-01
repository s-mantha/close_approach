#!/usr/bin/env bash

set -e
set -u

TAG=latest
usage() {
    cat >&2 <<END
    -t TAG      docker image tag (default '$TAG')
END
    exit 1
}

while getopts ":i:t:b:pl" o; do
    case "${o}" in
        t)  TAG=$OPTARG
            ;;
        *)  usage
            ;;
    esac
done
shift $((OPTIND-1))

echo "Build docker image"

docker build --no-cache \
    -t $TAG . 

echo "Run Tests " 

docker run --rm --volume "$PWD/tests":/robot $TAG robot --outputdir results .