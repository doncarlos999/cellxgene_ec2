#/bin/bash
set -exu
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 017309998751.dkr.ecr.us-east-1.amazonaws.com
docker pull 017309998751.dkr.ecr.us-east-1.amazonaws.com/tools/single_cell/cellxgene:latest
