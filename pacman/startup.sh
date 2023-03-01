#!/bin/bash

# /bin/bash ./wait.sh -h localhost -p 3306 -t 2400 &
# process_id=$!
# echo "PID: $process_id"
# wait $process_id
# echo "Exit status: $?"
# echo "Starting"
python3.9 ./manage.py makemigrations inventory
python3.9 ./manage.py migrate 
python3.9 ./manage.py createsuperuser --noinput --email admin@admin.com
python3.9 ./manage.py migrate 
python3.9 ./manage.py runserver 0.0.0.0:8000