#          __                __
#    _____/ /_  ____  ____  / /____  _____
#   / ___/ __ \/ __ \/ __ \/ __/ _ \/ ___/  __
#  /__  / / / / /_/ / /_/ / /_/  __/ / ____/ /__ _   __
# /____/_/ /_/\____/\____/\__/\___/_/ / __  / _ | | / /
#       -*- By ShooterDev -*-        / /_/ /  __| |/ /
#                                    \____/\___/|___/
# =====================================================
from django.urls import include, path

from rest_framework import routers


router = routers.DefaultRouter()

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    path("", include(router.urls)),
    path("webapi-auth/", include("rest_framework.urls", namespace="rest_framework")),
]
