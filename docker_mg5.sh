#!/bin/bash

if [ "$1" = "--docker_build" ]
then
	docker build --tag=ndeutschmann/madnklo ./docker_src
	exit
fi

if [ "$1"="--set_persistent" ] && [[ ! -z "$2"  ]]
then
	echo ""
	echo "=============================================="
	echo "This command must be sourced to have an effect"
	echo "=============================================="
	echo ""	
	export DOCKER_MG5_PERSISTENT="$2"
	exit
fi

if [ -z "$DOCKER_MG5_PERSISTENT" ]
then
	echo "The DOCKER_MG5_PERSISTENT variable is not set."
	echo "Setting the current folder"
	echo "You can set it by running"
	echo "source docker_mg5.sh --set_persistent PATH"
	DOCKER_MG5_PERSISTENT=$(pwd)
fi
	
docker run -it --rm -v $DOCKER_MG5_PERSISTENT:/var/mg5_persistent ndeutschmann/madnklo $1
