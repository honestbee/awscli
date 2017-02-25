# AWS CLI 

Alpine container with AWS CLI

Example usage:

```bash
docker run -it --rm  \
 -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
 -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
 -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
 -e "AWS_DEFAULT_OUTPUT=${AWS_DEFAULT_OUTPUT}" \
 quay.io/honestbee/awscli:latest \
 /bin/sh -c "aws ec2 describe-vpcs | jq --raw-output '.Vpcs[] | select(.IsDefault==true) | .CidrBlock '"
```
