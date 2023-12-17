#!/bin/bash
region=$1
aws ec2 describe-vpcs --region $region1 | jq .Vpcs[].VpcId -r

#!/bin/bash
region=$@
for region in $@
do
cowsay "region is $region"
aws ec2 describe-vpcs --region $region | jq .Vpcs[].VpcId -r
done


#!/bin/bash
if [ $# -gt 0 ]
then
region=$@
for region in $@
do
cowsay "region is $region"
aws ec2 describe-vpcs --region $region | jq .Vpcs[].VpcId -r
done
else
echo "please provide valid arguments"
fi