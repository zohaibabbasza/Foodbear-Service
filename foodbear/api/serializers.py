from rest_framework import serializers

from foodbear.models import FoodCategory,Restaurant,Food


class FoodCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = FoodCategory 
        fields =[
            'cat_id',
            'cat_name',
            'cat_image'
        ]
class ResturantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant 
        fields =[
            'r_id',
            'r_name',
            'r_location',
            'r_image',
            'restaurant_packages_p_id',
            'rating',
            'date',
            'food_category_cat_id'

        ]
class FoodSerializer(serializers.ModelSerializer):
    class Meta:
        model = Food
        fields=[
            'f_id',
            'f_name',
            'price',
            'image_link',
            'restaurant_r_id',
            'food_category_cat',
            'food_type',



        ]
    def validate(self, data):
        content = data.get("name", None)
        if content == "":
            content = None
        shortCode = data.get("shortCode", None)
        if content is None and shortCode is None:
            raise serializers.ValidationError("Name or ShortCode is required.")
        return data

