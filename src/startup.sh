#!/bin/bash
docker run --rm -p 3838:3838 -v /s3bucket:/data 017309998751.dkr.ecr.us-east-1.amazonaws.com/tools/single_cell/cellxgene:latest
