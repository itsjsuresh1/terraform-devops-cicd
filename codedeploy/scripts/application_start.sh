#!/bin/bash

aws ecr get-login-password --region aws_region | docker login --username AWS --password-stdin repository_url
docker run -d --name hello-world -p 80:8080 image_url