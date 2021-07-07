## Project description

This is an instagram clone called Udagram. Udagram developers can push the latest version of their code in a zip file located in a public S3 Bucket. The servers will copy the code in the S3 Bucket and deploy it into the Apache hosting document root folder.

## Infrastructure diagram

![](./Udagram%20infrastructure.png)

## Deployment

#### Prerequisite

The following resources are required for deploying Udagram

- AWS account
- A Linux based local system with aws cli installed and configured the aws cli profile
- A Linux based local system with git installed

#### Steps

1. git clone this repository

2. cd c3

3. ./createkey.sh

4. ./create.sh "network stack name" network-s3.yml parameters-s3.json

5. ./create.sh "server stack name" servers-s3.yml parameters-s3.json

   - The AWS region that the infrastructure deploy is in us-west-2
   - You may need to chmod 700 create.sh update.sh createkey.sh to run step 3 and step 4 and step 5
   - When creating the infrastructure in step 4, you should allow step 3 to finish before  executing it. The status of the execution can be viewed in CloudFormation section in the AWS management console
   - Step 3 is used to create the key pair to logon to the servers. The key file is fd310b7.pem
   - To logon to the servers in private subnets, you have to logon to the JumpBox first
   - To logon to the JumpBox, you may need to chmod 400 fd310b7.pem. Then ssh ubuntu@ip.of.jumpbox -i fd310b7.pem. After you logon to JumpBox, you need to copy fd310b7.pem into the JumpBox and use the same procedure to logon to the other servers in private subnets
   - You can use update.sh to update the CloudFormation stack

   

## Result

The public URL of Udagram is located in the output section of the server stack in CloudFormation by a variable called **ApplicationLoadBalancerDNSName**

The following will display if the deployment is successful

![](./Udagram.png)



