#!/bin/sh
set -e

cd /app

# Run database migrations
python manage.py migrate --noinput


# Collect static files
python manage.py collectstatic --noinput

# Start server
exec python manage.py runserver 0.0.0.0:8000
