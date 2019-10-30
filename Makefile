build:
	docker rmi keepalived
	docker build -t keepalived .

network:
	docker network create --subnet 10.5.0.0/16 lb

run:
	docker run -it -d --name lb3 --network lb --cap-add=NET_ADMIN --restart always keepalived
	docker run -it -d --name lb2 --network lb --cap-add=NET_ADMIN --restart always keepalived
	docker run -it -d --name lb1 --network lb --cap-add=NET_ADMIN --restart always keepalived
	docker run -it -d --name lbtester --network lb ubuntu

autoheal:
	docker run -d --name autoheal --restart=always -e AUTOHEAL_CONTAINER_LABEL=all -v /var/run/docker.sock:/var/run/docker.sock willfarrell/autoheal