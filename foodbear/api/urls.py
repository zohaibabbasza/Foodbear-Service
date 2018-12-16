
from django.conf.urls import url

#from .views import AirlineListAPIView,AirlineCreateAPIView,ScheduleListAPIView,SendEmailScheduleAPIView
from .views import TypeOfFoodsListAPIView,RestaurantsListAPIView
urlpatterns = [
    url('get_type_of_foods/', TypeOfFoodsListAPIView.as_view()),
    url('get_list_of_restaurants/', RestaurantsListAPIView.as_view()),
    
]
