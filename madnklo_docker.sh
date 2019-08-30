#!/bin/bash

if [ "$1" = "--docker_build" ]
then
	docker build --tag=madnklo/madnklo ./docker_src
	echo ""
	echo "================================================================"
	echo "   New image built. Consider pruning/removing dangling images"
	echo "================================================================"	
	exit
fi

if [ "$1" = "--docker_update" ]
then
	docker pull madnklo/madnklo
	exit
fi

if [ -z "$DOCKER_MNK_PERSISTENT" ]
then
	echo ""
	echo "The DOCKER_MNK_PERSISTENT variable is not set."
	DOCKER_MNK_PERSISTENT=$(pwd)
	read -t 15 -p "Press enter to continue using the active directory as output directory (15s)
> [Press Enter to continue]"
fi
	
docker run -it --rm -v $DOCKER_MNK_PERSISTENT:/var/madnklo_persistent madnklo/madnklo $1
