#!/bin/bash
docker run --rm -d -p 3838:3838 -v /s3bucket/cellxgene:/data 017309998751.dkr.ecr.us-east-1.amazonaws.com/tools/single_cell/cellxgene:latest
