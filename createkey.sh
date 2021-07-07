#!/bin/bash

aws ec2 create-key-pair --key-name fd310b7 --query 'KeyMaterial' --output text > fd310b7.pem
chmod 400 fd310b7.pem