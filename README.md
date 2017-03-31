# AWS CLI 

[![Docker Repository on Quay](https://quay.io/repository/honestbee/awscli/status "Docker Repository on Quay")](https://quay.io/repository/honestbee/awscli)

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

## Usage in Drone

1. Create Secrets:

  ```
  drone secret add --image=quay.io/honestbee/awscli:* \
    honestbee/assets AWS_ACCESS_KEY_ID AKIA...
  drone secret add --image=quay.io/honestbee/awscli:* \
    honestbee/assets AWS_SECRET_ACCESS_KEY pAwe7T...
  ```

1. Sample `.drone.yaml` file:

  ```
  pipeline:
    test:
      image: quay.io/honestbee/awscli:1.11.55
      environment:
        - AWS_DEFAULT_REGION=ap-southeast-1
        - AWS_DEFAULT_OUTPUT=json
      commands:
        - aws ec2 describe-vpcs | jq --raw-output '.Vpcs[] | select(.IsDefault==true) | .CidrBlock ' 
  
    notify:
      image: plugins/slack
      webhook: ${SLACK_WEBHOOK}
      channel: feed-devops
      when:
        status: [ success, failure ]
  ```
