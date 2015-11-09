#!/bin/sh

sudo docker run -d --name han -h han progrium/consul -server -bootstrap-expect 3

JOIN_IP="$(sudo docker inspect -f '{{.NetworkSettings.IPAddress}}' han)"

echo $JOIN_IP

sudo docker run -d --name chewbacca -h chewbacca progrium/consul -server -join $JOIN_IP

sudo docker run -d --name leia -h leia progrium/consul -server -join $JOIN_IP

sudo docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp --name luke -h luke progrium/consul -join $JOIN_IP
