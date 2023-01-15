FROM python:3.9-alpine
WORKDIR /pac
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
RUN apk update
RUN apk add --virtual build-deps gcc python3-dev musl-dev
RUN apk add --no-cache mariadb-connector-c-dev bash vim nano
EXPOSE 8000
COPY . /pac/
SHELL [ "/bin/bash","-c" ]
WORKDIR /pac/pacman
RUN python3.9 -m pip install django mysqlclient django-cors-headers
RUN chmod +x ./startup.sh
CMD [ "sh","startup.sh" ]