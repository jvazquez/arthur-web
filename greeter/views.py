from django.http import JsonResponse
from time import sleep
import logging


logger = logging.getLogger(__name__)


def index(request):
    """
    This is a simple sleep that blocks, it can be anything, a slow db query
    a file being opened, this will give you an idea on what to look
    """
    sleep(1)
    return JsonResponse({"message": "Hello world"})
