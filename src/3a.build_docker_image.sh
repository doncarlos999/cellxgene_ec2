#/bin/bash
set -exu
# build cellxgene docker image
(
cd docker
docker build --rm -t 017309998751.dkr.ecr.us-east-1.amazonaws.com/tools/single_cell/cellxgene:latest .
)
