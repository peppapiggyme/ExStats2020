#!/bin/bash

##############################################
# Setup the environment for this program     #
# Bowen Zhang                                #
#                                            #
# Usage: source SetupEnv.sh (from anywhere)  #
##############################################

#setupATLAS -q 
#export ALRB_rootVersion=6.20.06-x86_64-centos7-gcc8-opt
#lsetup root

HEREPATH=$( dirname $( readlink -f $BASH_SOURCE ) )
export SOURCEPATH=$( ls -d ${HEREPATH}/../ )
mkdir -p ${SOURCEPATH}/plots/ ${SOURCEPATH}/build/
export RES_PATH=${SOURCEPATH}/res/
export TOOLS_PATH=${SOURCEPATH}/tools/
export PATH=$PATH:${TOOLS_PATH}
