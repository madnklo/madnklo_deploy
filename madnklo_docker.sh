#!/bin/bash

if [ "$1" = "--docker_build" ]
then
	docker build --tag=ndeutschmann/madnklo ./docker_src
	exit
fi

if [ "$1"="--set_persistent" ] && [[ ! -z "$2"  ]]
then
	echo ""
	echo "================================================"
	echo " This command must be sourced to have an effect"
	echo "================================================"
	echo ""
	echo "(This message is printed also if you did use source)"
	echo ""	
	export DOCKER_MG5_PERSISTENT="$2"
	exit
fi

if [ -z "$DOCKER_MNK_PERSISTENT" ]
then
	echo ""
	echo "The DOCKER_MNK_PERSISTENT variable is not set."
	echo "Setting the working directory as output path. You can choose another directory by running:"
	echo "source docker_mg5.sh --set_persistent PATH"
	DOCKER_MNK_PERSISTENT=$(pwd)
	read -p "Press enter to continue using the active directory as output directory
> "
fi
	
docker run -it --rm -v $DOCKER_MNK_PERSISTENT:/var/madnklo_persistent ndeutschmann/madnklo $1
