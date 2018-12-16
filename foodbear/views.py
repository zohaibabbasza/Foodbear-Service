from django.shortcuts import render
import json
from django.http import HttpResponse,JsonResponse



# Create your views here.

def some_view(request):
    responseData = {
        'id': 4,
        'name': 'Test Response',
        'roles' : ['Admin','User']
    }



    

    return JsonResponse(responseData)