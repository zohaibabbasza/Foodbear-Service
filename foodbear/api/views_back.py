from rest_framework import generics,serializers,mixins, permissions
from django.core.mail import send_mail
# from rest_framework.generics import List
from rest_framework.views import APIView
import json
from rest_framework.authentication import SessionAuthentication,TokenAuthentication
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
# from django.views.generic import View

from flights.models import Airline,Schedule
from .serializers import AirlineSerializer,ScheduleSerializer

class AirlineListAPIView(APIView):
    authentication_classes      = []
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]

    def get(self, request, format=None):
        qs = Airline.objects.all()
        serializer = AirlineSerializer(qs, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        qs = Airline.objects.all()
        serializer = AirlineSerializer(qs, many=True)
        return Response(serializer.data)

class AirlineCreateAPIView(generics.CreateAPIView):
    permission_classes          = []
    authentication_classes      = []
    queryset                    = Airline.objects.all()
    serializer_class            = AirlineSerializer



class ScheduleListAPIView(APIView):
    authentication_classes      = [TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, format=None):
        qs = Schedule.objects.all()
        serializer = ScheduleSerializer(qs, many=True)
        return Response(serializer.data)

class SendEmailScheduleAPIView(APIView):
    authentication_classes      = [TokenAuthentication]
    permission_classes = [permissions.IsAuthenticated]
    def get(self, request, format=None):
        user=request.user

        send_mail(
            'Subject here',
            'Here is the message.',
            'from@example.com',
            [user.email],
            fail_silently=False,
        )
        return Response({"user":user.username,"email":user.email})