#!/bin/bash

# Asking to input the number of containers needed and for how long
echo "How many containers do you need? (200 max)"
read containers
echo "For how many minutes?"
read minutes

if [ $containers -gt 200 ]
then
        echo "We can't host more than 200 containers."
        echo "Please, select a number between 1 and 200."
        bash ContainerScript.sh

else

	timer=$(($minutes*60))

# Loop to start the required number of containers
	for i in $(seq 1 $containers)
	do
        	ip=$(($i+50))
		docker run -itd  --network=TP-BRIDGE --ip=192.168.10.$ip depat/bind
	done

# Timer to shut down the containers
	sleep $timer
	echo "Containers shutting down"
	docker container stop $(docker ps -a -q)
	docker container rm $(docker ps -a -q)
fi
