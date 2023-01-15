# Pac-Man

Pac-Man is a straightforward and easy to use Django handled search / inventory system.

## Running the Server

python ./manage.py runserver

### Oh NO! ive run into errors

run

## Installation

reqs
    docker-desktop
    vs-code-docker-extention



### Step by Step

if you want a different password for the database, change it in the etc/mysql dir

since the project now uses docker to handle the DBs, here is what needs to be done :

install docker desktop,
pull the mysql container from docker's source
run the mysql container, with the following options : 

    name = mysqldb
    port 3306::3306
        33060::unbound
    OPTIONAL_ENV_VAR:
        MYSQL_ROOT_PASSWORD = [whatever password you want, just remember it]
in vs-code, create a dev container using the pacman project
once both docker containers have stabilized, and are running (5-10min)

IN THE MYSQL DOCKER CONTAINER

run the following commands : 

    mysql -u root -p #use the password created earlier
    #once in mysql run the following
    CREATE USER 'roboticsuser'@'%' IDENTIFIED BY 'pwd';
    CREATE DATABASE robotics_inv;
    GRANT ALL PRIVILEGES ON *.* TO 'roboticsuser'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;
    exit


IN THE PACMAN DOCKER CONTAINER
run the following commands : 

    sudo apt install update
    sudo apt install python3.9-dev default-libmysqlclient-dev build-essential nmap
    python3.9 -m pip install django mysqlclient
    cd /workspaces/Pac-Man/pacman
    python3.9 ./manage.py makemigrations inventory
    python3.9 ./manage.py makemigrations 
    python3.9 ./manage.py migrate
    python3.9 ./manage.py createsuperuser # go through creating a master user
    python3.9 ./manage.py migrate #for good luck
    python3.9 ./manage.py runserver


#### Common Errors :

if you run into the error 'roboticsuser'@'172.17.0.4' access denied, do the following

log into mysql from the docker container
run the following commands:

    use mysql
    select * from user # if a user is named "'roboticsuser'@'172.17.0.4'" , then run the following
    drop user 'roboticsuser'@'172.17.0.4'

