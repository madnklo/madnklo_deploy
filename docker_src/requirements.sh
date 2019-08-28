#!/bin/bash

################## 
#    APT-GET-BUILD
##################

if [ "$1" = "apt-get-build" ]
#Write the list of apt-get packages to install 
then echo "
wget
ca-certificates
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
gfortran
build-essential
ghostscript
libginac6
emacs
vim
less
texlive-base"
fi

################## 
#    APT-GET-RUN
##################

if [ "$1" = "pip" ]
#Write the list of apt-get packages to install 
then 
	reqs="numpy bidict vegas mpmath pyjet matplotlib"
	for req in $reqs
		do
			pip install $req
		done
fi

