#!/bin/sh
set -e

cd /app

# Run database migrations
python manage.py migrate --noinput

# Load initial data from fixture (if it exists)
# The `|| true` ensures the script continues even if this command fails
if [ -f "menu/fixtures/initial_menu.json" ]; then
  echo "Loading initial data from fixture..."
  python manage.py loaddata initial_menu.json || echo "Fixture load failed or already loaded; continuing..."
else
  echo "Fixture file not found; skipping initial data load."
fi

# Collect static files
python manage.py collectstatic --noinput

# Start server
exec python manage.py runserver 0.0.0.0:8000
