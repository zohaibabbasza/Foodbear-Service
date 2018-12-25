
from django.conf.urls import url

#from .views import AirlineListAPIView,AirlineCreateAPIView,ScheduleListAPIView,SendEmailScheduleAPIView
from .views import TypeOfFoodsListAPIView,RestaurantsListAPIView,ResturantFilterList,FoodListAPIView,FoodFilterByResturants,RestaurantCountView,CategoryCountView,FoodFilterById
urlpatterns = [
    url('get_type_of_foods/', TypeOfFoodsListAPIView.as_view()),
    url('get_list_of_restaurants/', RestaurantsListAPIView.as_view()),
    url('get_filter_restaurants/(?P<cat_id>\d+)/', ResturantFilterList.as_view()),
    url('get_list_of_food/', FoodListAPIView.as_view()),
    url('get_food_filter/(?P<r_id>\d+)/', FoodFilterByResturants.as_view()),
    url('get_restaurant_count',RestaurantCountView.as_view()),
    url('get_food_category_count',CategoryCountView.as_view()),
    url('get_food_filter_id/(?P<f_id>\d+)/', FoodFilterById.as_view()),
    
]
