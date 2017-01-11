#!/bin/bash
PYTHON_CONFIG_CODE="import distutils.sysconfig; print(distutils.sysconfig.get_config_var('LIBPL'))"
PYTHON3_CONFIG_DIR=`python3 -c "${PYTHON_CONFIG_CODE}"`
PYTHON2_CONFIG_DIR=`python -c "${PYTHON_CONFIG_CODE}"`
CPUS=`cat /proc/cpuinfo | grep -c processor`
