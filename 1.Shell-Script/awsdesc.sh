#?/bin/bash
Region=$@
if [ $# -ge 0 ]; then
for Region in $@
do
aws ec2 describe-vpcs --region ${Region}| jq .Vpcs[1].VpcId
done
cowsay " you have passed $# arguments "
else
cowsay " you did not pass any arguments "
fi