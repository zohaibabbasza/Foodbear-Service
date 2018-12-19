
from django.conf.urls import url

#from .views import AirlineListAPIView,AirlineCreateAPIView,ScheduleListAPIView,SendEmailScheduleAPIView
from .views import TypeOfFoodsListAPIView,RestaurantsListAPIView,ResturantFilterList,FoodListAPIView,FoodFilterByResturants
urlpatterns = [
    url('get_type_of_foods/', TypeOfFoodsListAPIView.as_view()),
    url('get_list_of_restaurants/', RestaurantsListAPIView.as_view()),
    url('get_filter_restaurants/(?P<cat_id>\d+)/', ResturantFilterList.as_view()),
    url('get_list_of_food/', FoodListAPIView.as_view()),
    url('get_food_filter/(?P<r_id>\d+)/', FoodFilterByResturants.as_view()),
]
