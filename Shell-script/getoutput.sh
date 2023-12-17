#!/bin/bash
systemctl stop nginx > /dev/null 2>&1
if [ $? -eq 0 ]
then
echo "nginx is running"
else
echo "nginix is not running"
systemctl start nginx
sleep 5
systemctl status nginx
fi 
