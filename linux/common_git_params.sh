#!/bin/bash
LATEST_TAG_VERSION=`git tag | tail -n1`
LATEST_TAG_VERSION_HASH=`git rev-parse ${LATEST_TAG_VERSION}`
HEAD_HASH=`git rev-parse HEAD`
