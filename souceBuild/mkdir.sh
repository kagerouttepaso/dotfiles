#!/bin/bash
LOCAL_DIR=$HOME/local
if [ ! -d ${LOCAL_DIR}/src ]; then
    mkdir -p ${LOCAL_DIR}/src
fi
if [ ! -d ${LOCAL_DIR}/zip ]; then
    mkdir -p ${LOCAL_DIR}/zip
fi
if [ ! -d ${LOCAL_DIR}/lock ]; then
    mkdir -p ${LOCAL_DIR}/lock
fi
