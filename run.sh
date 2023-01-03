#!/bin/sh

mkdir -p output

docker run -it \
    --rm \
    -v "$(pwd)/output":/root/output \
    micropy:latest \
    /bin/bash
