# MadNkLO docker image: `madnklo_docker`
This is a first attempt at providing a Docker image for the python branch of [MadNkLO](https://github.com/madnklo/madnklo).
The docker image itself is `ndeutschmann/madnklo` and is available on the Docker hub.

## Quick start

run the `madnklo_docker.sh` command provided in this repository in your desired working directory

## Setup

### Pre-requisites
- [Docker](https://www.docker.com/)

### Install
- run `git clone https://github.com/ndeutschmann/madnklo_docker.git`

### Setting up the system
- ensure the Docker is running
  - for Linux look [here](https://docs.docker.com/config/daemon)
  - for OSX/Windows start the app or use [docker-machine](https://docs.docker.com/machine/overview/)

- Setup a working directory, there are two options
  1. if the environment variable `DOCKER_MNK_PERSISTENT` is set, the program will use it as a working directory for input/output.
  This variable can be set using `source madnklo_docker.sh --set_persistent $DESIRED_PERSISTENT_PATH`
  2. just run the program from your desired working directory

## Running the program

### Usage
run `madnklo_docker.sh [args]` to start the image and immediately start MadNkLO with all the necessary tools pre-compiled. 
Any arguments `[args]` provided which are NOT `--set_persistent` or `--docker_build` will be passed to the `mg5_aMC` executable.

### What's under the hood
#### Image info
- The base Docker image is `python:2` which runs on Debian Buster
- MadNkLO is installed in `/home/hep/madnklo`
- The entrypoint is `/home/hep/madnklo/bin/mg5_aMC`
- The default working directory is `/var/madnklo_persistent` which is the expected volume mountpoint to be shared with the host

To inspect the system you can run `docker run -it --entrypoint /bin/bash --rm ndeutschmann/madnklo`

#### Run script

The run script `madklo_docker.sh` provided with this repository has the default command

`docker run -it --rm -v $DOCKER_MNK_PERSISTENT:/var/madnklo_persistent ndeutschmann/madnklo $1`

which mounts $DOCKER_MNK_PERSISTENT (if undefined, uses the current host workdir) on the host to the default workdir `/var/madnklo_persistent`. 
If a command is provided for the executable this is where it should be placed and MadNkLO outputs processes here.

#### Rebuilding the image
You can re-build the image locally using `madnklo_docker.sh --docker_build` **inside the repository** (`./docker_src` should be available).


