#!/bin/bash

docker build . -t "jupyter-project:latest-dev"
docker compose up
EOF