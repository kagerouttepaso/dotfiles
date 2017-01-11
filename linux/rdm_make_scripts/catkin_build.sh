#!/bin/bash

catkin build  --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
find ./build -name compile_commands.json | sed -e "s;/compile_commands.json;/;" | xargs -n1 rc -J
