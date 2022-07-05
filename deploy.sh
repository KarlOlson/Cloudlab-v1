#!/bin/bash
# Start up services
filename='containers/priority.txt'
while read p; do
    sudo docker-compose -f "containers/${p}/docker-compose.yml" build
    sudo docker-compose -f "containers/${p}/docker-compose.yml" push
    sudo docker service create \
       --name "${p}-wrapper" \
       --mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
       --mount type=bind,source="/local/repository/containers/${p}",target=/tmp/ \
       --workdir /tmp/ \
       docker/compose \
       docker-compose up
    echo "Deployed $p to swarm"
done < "$filename"
