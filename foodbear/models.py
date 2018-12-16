# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
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
    date = models.DateTimeField(db_column='Date')  # Field name made lowercase.
    food_category_cat = models.ForeignKey('FoodCategory', models.DO_NOTHING)

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


class AccountEmailaddress(models.Model):
    email = models.CharField(unique=True, max_length=254)
    verified = models.IntegerField()
    primary = models.IntegerField()
    user = models.ForeignKey('AuthUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailaddress'


class AccountEmailconfirmation(models.Model):
    created = models.DateTimeField()
    sent = models.DateTimeField(blank=True, null=True)
    key = models.CharField(unique=True, max_length=64)
    email_address = models.ForeignKey(AccountEmailaddress, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailconfirmation'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class AuthtokenToken(models.Model):
    key = models.CharField(primary_key=True, max_length=40)
    created = models.DateTimeField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING, unique=True)

    class Meta:
        managed = False
        db_table = 'authtoken_token'


class Comment(models.Model):
    com_id = models.AutoField(primary_key=True)
    comment = models.CharField(max_length=255)
    user_u = models.ForeignKey(User, models.DO_NOTHING, db_column='User_u_id')  # Field name made lowercase.
    food_f = models.ForeignKey('Food', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'comment'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class DjangoSite(models.Model):
    domain = models.CharField(unique=True, max_length=100)
    name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'django_site'


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
    inv_id = models.AutoField(primary_key=True)
    price = models.IntegerField()
    delivery = models.CharField(max_length=255)
    food_f = models.ForeignKey(Food, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'invoice'


class Order(models.Model):
    o_id = models.AutoField(primary_key=True)
    quantity = models.IntegerField()
    total_price = models.IntegerField()
    invoice_inv = models.ForeignKey(Invoice, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'order'


class Payment(models.Model):
    pay_id = models.AutoField(primary_key=True)
    pay_method = models.CharField(max_length=255)
    invoice_inv = models.ForeignKey(Invoice, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'payment'
