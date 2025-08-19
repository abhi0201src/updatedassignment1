from rest_framework import routers

from menu.viewsets import MenuViewSet

# Accept both with and without trailing slash
router = routers.SimpleRouter(trailing_slash='/?')

router.register(r'menu', MenuViewSet, basename="menu")

urlpatterns = router.urls