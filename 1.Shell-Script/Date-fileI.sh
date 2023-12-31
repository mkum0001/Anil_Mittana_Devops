#!/bin/bash
set -x
for i in {1..10}
do
echo $(date +"%Y-%m-%d %H:%M:%S") > /tmp/file-$i
sleep 5
done
