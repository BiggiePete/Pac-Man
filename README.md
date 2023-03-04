# Pac-Man

Pac-Man is a straightforward and easy to use Django handled search / inventory system. That leverages Docker to handle mico-service architecture

## Installation

reqs

    (full gui install) docker-desktop
    (lightweight install) docker-cli docker-compose docker

### Step by Step

Before you bring anything up, the following needs to be done :
(x) - Edit /pacman/settings.py
    Change the ALLOWED_HOSTS, to include the domain name EX : example.com
    Change the CSRF_TRUSTED_ORIGINS, to include domain name !MAKE SURE TO HAVE http and https versions added! EX : <http://example.com> & <https://example.com>

Bringing up the docker containers is a straightforward and thankfull very hands-off process
start by :

    cd /Pac-Man/

From here, all you need to do is :
    docker network create --attachable --subnet 172.240.0.0/16 --gateway 172.240.0.1 deezNuts
    docker compose up -d

If you cannot connect to localhost:8000 right away, dont worry about it, the docker database may take >5min to bring up, especially on a hard-drive. If you want to watch the startup live, run :

    docker ps

From here, find the ID of the container named "pacman" and paste it into here

    docker logs <container-id> -f

Pacman waits until a connection to mysql can be made, once that is complete, it will begin migrating and spin up the server, Error code 0 will be displayed with the server is ready to start
Once the terminal reads : "Watching for file changes with StatReloader", the server is up, and can be connected to as [localhost:8000]

### Post-Install

Every time the pacman container is started, the admin account is created, this is to make sure that there is always a way in, when running in production make sure to create a new account for login, then remove the admin account
