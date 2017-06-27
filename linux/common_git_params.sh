#!/bin/bash
LATEST_TAG_VERSION=`git log --tags --simplify-by-decoration --pretty="format:%d" | grep tag| sed -e "s/.*tag: \([^,)]*\).*/\1/g" | head -n1`
LATEST_TAG_VERSION_HASH=`git rev-parse ${LATEST_TAG_VERSION}`
HEAD_HASH=`git rev-parse HEAD`
