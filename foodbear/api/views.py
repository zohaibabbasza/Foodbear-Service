from rest_framework import generics,serializers,mixins, permissions
from django.core.mail import send_mail
# from rest_framework.generics import List
from rest_framework.views import APIView
import json
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from foodbear.models import FoodCategory,Restaurant
# from django.views.generic import View

#from foodbear.models import Airline,Schedule
from .serializers import FoodCategorySerializer,ResturantSerializer

class TypeOfFoodsListAPIView(APIView):
    authentication_classes = []
    permission_classes = []
    #permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get(self, request, format=None):
        qs = FoodCategory.objects.all()
        serializer = FoodCategorySerializer(qs, many=True)
        return Response({'data':serializer.data})

class RestaurantsListAPIView(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self, request, format=None):
        qs = Restaurant.objects.all()
        serializer = ResturantSerializer(qs, many=True)
        return Response({'data':serializer.data})
