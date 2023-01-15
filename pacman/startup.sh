#!/bin/bash
python3.9 ./manage.py createsuperuser --noinput 
python3.9 ./manage.py migrate 
python3.9 ./manage.py runserver 0.0.0.0:8000