#/bin/bash
set -exu
# aws setup
sudo apt update
sudo apt install -y awscli
aws configure
