#!/bin/sh
set -e

# #build Rust
# cd ./rust-aws-lambda
# sh build.sh
# cd ./../
# ##
# #build Go
# cd ./dotnet-lambda
# sh build.sh
# cd ./../

# #build Go
# cd ./go-lambda
# sh build.sh
# cd ./../
#
#builds Java and GraalVM
cd ./java-graalvm-lambda
sh build.sh
cd ./../

## Deploy lambdas

#alias sam='sam.cmd'
sam build --use-container --exclude JavaFunction GraalVMFunction 
#sam build --use-container --build-image public.ecr.aws/sam/build-nodejs14.x
#public.ecr.aws/sam/build-nodejs14.x
#public.ecr.aws/sam/build-python3.9

#sam build --use-container RubyFunction -b ruby

sam deploy -t template.yaml --no-confirm-changeset --no-fail-on-empty-changeset --stack-name sam-hello-world --capabilities CAPABILITY_IAM
