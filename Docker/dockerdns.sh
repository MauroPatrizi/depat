#!/bin/bash

# We had edited the Ubuntu BIND image to customize it according to our requirements.

docker container prune --force
for i in {50..80}
do 
docker run -itd  --network=TP-BRIDGE --ip=192.168.2.$i depat/bind
done


