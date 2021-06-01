#!/bin/bash
export CELLXGENE_LOCATION=`which cellxgene`
export CELLXGENE_DATA=/data
export GATEWAY_PORT=3838
export GATEWAY_ENABLE_UPLOAD=0
export GATEWAY_ENABLE_ANNOTATIONS=0
export GATEWAY_ENABLE_BACKED_MODE=0
cellxgene-gateway
