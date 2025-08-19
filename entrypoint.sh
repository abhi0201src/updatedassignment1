#!/bin/sh
set -e

cd /app
python manage.py migrate --noinput
python - <<'PY'
import os
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'RestaurantCore.settings')
django.setup()
from menu.models import Menu

if not Menu.objects.exists():
    seed_items = [
        ("Pizza", 25.0),
        ("Burger", 9.99),
        ("Pasta", 12.5),
        ("Salad", 7.5),
    ]
    Menu.objects.bulk_create([Menu(name=n, price=p) for n, p in seed_items])
    print("Seeded default menu items")
else:
    print("Menu items already exist; skipping seed")
PY
exec python manage.py runserver 0.0.0.0:8000

