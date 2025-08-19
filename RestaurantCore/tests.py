from django.test import TestCase
from django.urls import reverse
from rest_framework.test import APIClient


class HealthEndpointTests(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_health_ok(self):
        response = self.client.get("/health")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json(), {"status": "ok"})


class MenuApiTests(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_create_menu_item(self):
        payload = {"name": "Test Item", "price": 5.5}
        response = self.client.post("/api/menu/", payload, format="json")
        self.assertEqual(response.status_code, 201)
        # List to confirm presence
        list_resp = self.client.get("/api/menu/")
        self.assertEqual(list_resp.status_code, 200)
        names = [item["name"] for item in list_resp.json()]
        self.assertIn("Test Item", names)

