#!/bin/bash

FILENAME=/tmp/test_test
SIZE=500M

# 4k
# シーケンシャルREAD
#fio -filename=${FILENAME} -direct=1 -rw=read -bs=4k -size=${SIZE} -numjobs=64 -runtime=10 -group_reporting -name=file1
# シーケンシャルライト
#fio -filename=${FILENAME} -direct=1 -rw=write -bs=4k -size=${SIZE} -numjobs=64 -runtime=10 -group_reporting -name=file1
# ランダムリード
fio -filename=${FILENAME} -direct=1 -rw=randread -bs=4k -size=${SIZE} -numjobs=64 -runtime=10 -group_reporting -name=file2
# ランダムライト
fio -filename=${FILENAME} -direct=1 -rw=randwrite -bs=4k -size=${SIZE} -numjobs=64 -runtime=10 -group_reporting -name=file3
# 32m
# シーケンシャルリード
#fio -filename=${FILENAME} -direct=1 -rw=read -bs=32m -size=${SIZE} -numjobs=16 -runtime=10 -group_reporting -name=file4
# シーケンシャルライト
#fio -filename=${FILENAME} -direct=1 -rw=write -bs=32m -size=${SIZE} -numjobs=16 -runtime=10 -group_reporting -name=file5
# ランダムリード
#fio -filename=${FILENAME} -direct=1 -rw=randread -bs=32m -size=${SIZE} -numjobs=16 -runtime=10 -group_reporting -name=file6
# ランダムライト
#fio -filename=${FILENAME} -direct=1 -rw=randwrite -bs=32m -size=${SIZE} -numjobs=16 -runtime=10 -group_reporting -name=file7
