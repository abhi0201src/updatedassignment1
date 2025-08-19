#!/bin/sh
set -e

cd /app
python manage.py migrate --noinput
python manage.py loaddata initial_menu.json || true
exec python manage.py runserver 0.0.0.0:8000

