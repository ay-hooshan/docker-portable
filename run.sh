#!/bin/bash

# start message
echo "Lesse Abow"

# load `registry` image from file!
sudo docker load -i registry-image.tar

# run docker from prepared volume
sudo docker run --rm -v ./regvol:/var/lib/registry --name hooshanreg -p 5000:5000 registry



