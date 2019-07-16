#!/bin/bash +x

docker build -t alpine_shtest:latest .

docker run --rm -t alpine_shtest:latest $@

exit 0

