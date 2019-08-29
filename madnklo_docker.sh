#!/bin/bash

if [ "$1" = "--docker_build" ]
then
	docker build --tag=ndeutschmann/madnklo ./docker_src
	echo ""
	echo "================================================================"
	echo "   New image built. Consider pruning/removing dangling images"
	echo "================================================================"	
	exit
fi

if [ "$1" = "--docker_update" ]
then
	docker pull ndeutschmann/madnklo
	exit
fi

if [ -z "$DOCKER_MNK_PERSISTENT" ]
then
	echo ""
	echo "The DOCKER_MNK_PERSISTENT variable is not set."
	echo "Setting the working directory as output path. You can choose another directory by running:"
	DOCKER_MNK_PERSISTENT=$(pwd)
	read -p -t 15 "Press enter to continue using the active directory as output directory (15s)
> [Press Enter to continue]"
fi
	
docker run -it --rm -v $DOCKER_MNK_PERSISTENT:/var/madnklo_persistent ndeutschmann/madnklo $1
