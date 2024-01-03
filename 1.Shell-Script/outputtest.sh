#/bin/bash
$1 > /dev/null 2>&1 
if [ $? -eq 0 ]; then
echo "Command ran successfully"
else
echo "check the command"
fi