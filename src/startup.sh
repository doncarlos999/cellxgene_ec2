#!/bin/bash
docker run -p 3838:3838 --rm -d \
       	--mount src="/s3bucket/cellxgene/bitbio",target="/data",type=bind,readonly \
       	017309998751.dkr.ecr.us-east-1.amazonaws.com/tools/single_cell/cellxgene:latest
