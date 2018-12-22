from django.db import models


class PackageHistory(models.Model):
    ph_id = models.AutoField(primary_key=True)
    duration = models.CharField(max_length=255)
    restaurant_r = models.ForeignKey('Restaurant', models.DO_NOTHING, db_column='Restaurant_r_id')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'Package_History'


class Rating(models.Model):
    rat_id = models.AutoField(primary_key=True)
    stars = models.IntegerField()
    user_u = models.ForeignKey('User', models.DO_NOTHING, db_column='User_u_id')  # Field name made lowercase.
    food_f = models.ForeignKey('Food', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Rating'


class Restaurant(models.Model):
    r_id = models.AutoField(primary_key=True)
    r_name = models.CharField(max_length=255)
    r_location = models.CharField(max_length=255)
    restaurant_packages_p = models.ForeignKey('RestaurantPackages', models.DO_NOTHING, db_column='Restaurant_Packages_p_id')  # Field name made lowercase.
    rating = models.IntegerField()
    date = models.DateTimeField(db_column='Date',auto_now=True)  # Field name made lowercase.
    food_category_cat = models.ForeignKey('FoodCategory', models.DO_NOTHING)
    r_image = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'Restaurant'


class RestaurantPackages(models.Model):
    p_id = models.AutoField(primary_key=True)
    p_name = models.CharField(max_length=255)
    p_price = models.IntegerField()
    p_duration = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'Restaurant_Packages'


class User(models.Model):
    u_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30)
    email = models.CharField(unique=True, max_length=100)
    password = models.CharField(max_length=50)
    p_number = models.IntegerField()
    cnic = models.IntegerField(db_column='CNIC')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=255)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'User'


class Comment(models.Model):
    com_id = models.AutoField(primary_key=True)
    comment = models.CharField(max_length=255)
    user_u = models.ForeignKey(User, models.DO_NOTHING, db_column='User_u_id')  # Field name made lowercase.
    food_f = models.ForeignKey('Food', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'comment'


class Food(models.Model):
    f_id = models.AutoField(primary_key=True)
    f_name = models.CharField(max_length=50)
    price = models.IntegerField()
    image_link = models.CharField(max_length=255)
    restaurant_r = models.ForeignKey(Restaurant, models.DO_NOTHING, db_column='Restaurant_r_id')  # Field name made lowercase.
    food_category_cat = models.ForeignKey('FoodCategory', models.DO_NOTHING)
    food_type = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'food'


class FoodCategory(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.CharField(max_length=255)
    cat_image = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'food_category'


class Invoice(models.Model):
    o_id = models.AutoField(primary_key=True)
    quantity = models.IntegerField()
    total_price = models.IntegerField()
    invoice_inv = models.ForeignKey('Order', models.DO_NOTHING)
    status = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'invoice'


class Order(models.Model):
    inv_id = models.AutoField(primary_key=True)
    price = models.IntegerField()
    delivery = models.CharField(max_length=255)
    food_f = models.ForeignKey(Food, models.DO_NOTHING)
    user_u = models.ForeignKey(User, models.DO_NOTHING, db_column='User_u_id')  # Field name made lowercase.
    payment_pay = models.ForeignKey('Payment', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'order'


class Payment(models.Model):
    pay_id = models.AutoField(primary_key=True)
    pay_method = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'payment'