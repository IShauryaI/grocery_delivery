from django.db import models
from django.utils.html import format_html


class City(models.Model):
    city_name = models.CharField(max_length=255)
    city_state = models.CharField(max_length=255, default='U.T.')

    def __str__(self):
        return self.city_name

    class Meta:
        db_table = 'city'

        verbose_name = 'city'
        verbose_name_plural = 'city'



class Store(models.Model):
    storeStatus = [
        ('a', 'Accepted'),
        ('d', 'Declined'),
        ('p', 'Pending')
    ]

    store_name = models.CharField(max_length=80)
    store_email = models.EmailField()
    store_mobile = models.CharField(max_length=20)
    store_password = models.CharField(max_length=50)
    store_otp = models.CharField(max_length=20, null=True)
    store_image = models.FileField(upload_to='images/store-images/', null=True)
    store_address = models.TextField()
    store_status = models.CharField(max_length=1, choices=storeStatus, default='p')
    store_rating = models.FloatField(default=-1.0)
    City = models.ForeignKey(to=City, on_delete=models.CASCADE)

    objects = models.Manager

    def storeImage(self):
        return format_html('<img src="/static/media/%s" width="150" />' % self.store_image)

    def __str__(self):
        return self.store_name

    class Meta:
        db_table = 'store'

        verbose_name = 'store'
        verbose_name_plural = 'store'



class Category(models.Model):

    category_name = models.CharField(max_length=80, primary_key=True)
    category_description = models.TextField()
    category_image = models.FileField(upload_to='images/category-images/', null=True)

    objects = models.Manager

    def categoryImage(self):
        return format_html('<img src="/static/media/%s" width="150" />' % self.category_image)

    def __str__(self):
        return self.category_name

    class Meta:
        db_table = 'category'
        verbose_name = 'category'
        verbose_name_plural = 'category'



class Product(models.Model):
    productStatus = [
        ('a', 'Accepted'),
        ('d', 'Declined'),
        ('p', 'Pending')
    ]

    product_name = models.CharField(max_length=80)
    product_description = models.TextField()
    Store = models.ForeignKey(to=Store, on_delete=models.CASCADE)
    Category = models.ForeignKey(to=Category, on_delete=models.CASCADE)
    product_image = models.FileField(upload_to='images/product-images/', null=True)
    product_price = models.CharField(max_length=80)
    product_offer = models.CharField(max_length=80)
    product_new_price = models.CharField(max_length=80)
    product_status = models.CharField(max_length=1, choices=productStatus, default='p')

    objects = models.Manager

    def productImage(self):
        return format_html('<img src="/static/media/%s" width="150" />' % self.product_image)

    def __str__(self):
        return self.product_name

    class Meta:
        db_table = 'product'
        verbose_name = 'product'
        verbose_name_plural = 'product'