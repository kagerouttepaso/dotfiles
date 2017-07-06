#!/bin/bash -eu
PYTHON_CONFIG_CODE="import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LIBPL'))"
if builtin command -v python3 ; then
    PYTHON3_CONFIG_DIR=`python3 -c "${PYTHON_CONFIG_CODE}"`
    echo PYTHON3_CONFIG_DIR ${PYTHON3_CONFIG_DIR}
fi
if builtin command -v python2 ; then
    PYTHON2_CONFIG_DIR=`python2 -c "${PYTHON_CONFIG_CODE}"`
    echo PYTHON2_CONFIG_DIR ${PYTHON2_CONFIG_DIR}
fi
CPUS=`cat /proc/cpuinfo | grep -c processor`
