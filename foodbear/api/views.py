from rest_framework import generics,serializers,mixins, permissions
from django.core.mail import send_mail
from rest_framework.views import APIView
import json
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from foodbear.models import FoodCategory,Restaurant,Food
from django.http import HttpResponse,JsonResponse
from rest_framework.renderers import JSONRenderer

# from django.views.generic import View

#from foodbear.models import Airline,Schedule
from .serializers import FoodCategorySerializer,ResturantSerializer,FoodSerializer

class TypeOfFoodsListAPIView(APIView):
    authentication_classes = []
    permission_classes = []

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

class ResturantFilterList(generics.ListAPIView):
    serializer_class = ResturantSerializer

    def get_queryset(self):
        cat_id = self.kwargs['cat_id']
        return Restaurant.objects.filter(food_category_cat_id=cat_id)

class FoodListAPIView(APIView):
    authentication_classes = []
    permission_classes = []

    def get(self, request, format=None):
        qs = Food.objects.all()
        serializer = FoodSerializer(qs, many=True)
        return Response({'data':serializer.data})

class FoodFilterByResturants(generics.ListAPIView):
    serializer_class = FoodSerializer

    def get_queryset(self):
        r_id = self.kwargs['r_id']
        return Food.objects.filter(restaurant_r_id=r_id)

class RestaurantCountView(APIView):
    renderer_classes = (JSONRenderer, )
    authentication_classes = []
    permission_classes = []

    def get(self, request, format=None):
        qs = Restaurant.objects.count()
        return Response([{'data':qs}])

class CategoryCountView(APIView):
    renderer_classes = (JSONRenderer, )
    authentication_classes = []
    permission_classes = []

    def get(self, request, format=None):
        qs = FoodCategory.objects.count()
        return Response([{'data':qs}])
class FoodFilterById(generics.ListAPIView):
    serializer_class = FoodSerializer

    def get_queryset(self):
        f_id = self.kwargs['f_id']
        return Food.objects.filter(f_id=f_id)