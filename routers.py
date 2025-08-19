from rest_framework import routers

from menu.viewsets import MenuViewSet

router = routers.SimpleRouter(trailing_slash=False)

router.register(r'menu', MenuViewSet, basename="menu")

urlpatterns = router.urls