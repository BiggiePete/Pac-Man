FROM python:3.9-alpine
WORKDIR /proj
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
RUN apk update
RUN apk add --virtual build-deps gcc python3-dev musl-dev
RUN apk add --no-cache mariadb-connector-c-dev
RUN apk add git 
RUN git clone https://github.com/BiggiePete/Pac-Man.git
EXPOSE 8000
WORKDIR /proj/Pac-Man/pacman
RUN python3.9 -m pip install django mysqlclient django-cors-headers
RUN python3.9 ./manage.py makemigrations inventory
RUN python3.9 ./manage.py collectstatic
RUN python3.9 ./manage.py migrate
RUN python3.9 ./manage.py createsuperuser --noinput
CMD [ "python3.9 /proj/Pac-Man/pacman/manage.py runserver 0.0.0.0:8000" ]