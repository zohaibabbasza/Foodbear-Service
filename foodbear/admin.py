from django.contrib import admin
from .models import User,Restaurant,RestaurantPackages,Food,FoodCategory,Invoice,Rating,Comment,PackageHistory,Payment,Order
# Register your models here.
admin.site.register(User)
admin.site.register(Restaurant)
admin.site.register(RestaurantPackages)
admin.site.register(Food)
admin.site.register(FoodCategory)
admin.site.register(Invoice)
admin.site.register(Rating)
admin.site.register(Comment)
admin.site.register(PackageHistory)
admin.site.register(Order)
admin.site.register(Payment)