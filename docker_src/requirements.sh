#!/bin/bash

################## 
#    APT-GET-BUILD
##################

if [ "$1" = "apt-get-build" ]
#Write the list of apt-get packages to install 
then echo "
wget
ca-certificates
python
gfortran
build-essential
ghostscript
libginac-dev"
fi

################## 
#    APT-GET-RUN
##################

if [ "$1" = "apt-get-run" ]
#Write the list of apt-get packages to install 
then echo "
ca-certificates
python
gfortran
build-essential
ghostscript
libginac6"
fi

################## 
#    APT-GET-RUN
##################

if [ "$1" = "pip" ]
#Write the list of apt-get packages to install 
then 
	reqs="numpy bidict vegas mpmath"
	for req in $reqs
		do
			pip install $req
		done
fi

