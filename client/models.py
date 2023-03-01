from django.db import models
from store.models import *

class Client(models.Model):
    client_name = models.CharField(max_length=100)
    client_mobile = models.CharField(max_length=20)
    client_email = models.EmailField()
    client_password = models.CharField(max_length=50)
    client_otp = models.CharField(max_length=10, null=True)
    client_address = models.TextField()
    City = models.ForeignKey(to=City, on_delete=models.CASCADE)

    def __str__(self):
        return self.client_name

    class Meta:
        db_table = 'client'
        verbose_name = 'client'
        verbose_name_plural = 'client'


class Cart(models.Model):
    Product = models.ForeignKey(to=Product, on_delete=models.CASCADE)
    Client = models.ForeignKey(to=Client, on_delete=models.CASCADE)
    Store = models.ForeignKey(to=Store, on_delete=models.CASCADE)
    cart_quantity = models.IntegerField()
    cart_total_price = models.CharField(max_length=50)

    def __str__(self):
        return self.Product

    class Meta:
        db_table = 'cart'
        verbose_name = 'cart'
        verbose_name_plural = 'cart'


class Order(models.Model):
    ordertype = [
        ('o', 'Online'),
        ('c', 'COD'),
    ]

    orderstatus = [
        ('p', 'Processing'),
        ('d', 'Delivered'),
    ]

    Client = models.ForeignKey(to=Client, on_delete=models.CASCADE)
    total_price = models.FloatField()
    order_date = models.DateField(null=True)
    payment_mtd = models.CharField(max_length=1, choices=ordertype, default='c')
    order_status = models.CharField(max_length=1, choices=orderstatus, default='p')

    def __str__(self):
        return self.total_price

    class Meta:
        db_table = 'order'
        verbose_name = 'order'
        verbose_name_plural = 'order'


class OrderDetails(models.Model):
    orderstatus = [
        ('p', 'Processing'),
        ('d', 'Delivered'),
    ]
    Order = models.ForeignKey(to=Order, on_delete=models.CASCADE)
    Product = models.ForeignKey(to=Product, on_delete=models.CASCADE)
    Store = models.ForeignKey(to=Store, on_delete=models.CASCADE)
    Client = models.ForeignKey(to=Client, on_delete=models.CASCADE)
    item_quantity = models.IntegerField()
    item_total_price = models.CharField(max_length=50)
    order_delivery_status = models.CharField(max_length=1, choices=orderstatus, default='p')

    def __str__(self):
        return self.order_delivery_status

    class Meta:
        db_table = 'orderDetails'
        verbose_name = 'orderDetails'
        verbose_name_plural = 'orderDetails'

class Reviews(models.Model):
    Store = models.ForeignKey(to=Store, on_delete=models.CASCADE)
    Client = models.ForeignKey(to=Client, on_delete=models.CASCADE)
    review_date = models.DateField(null=True)
    review_score = models.IntegerField()
    review_title = models.CharField(max_length=100, default='No Experience Shared')
    review_description = models.TextField(default='No Additional Information')


    def __str__(self):
        return self.review_title

    class Meta:
        db_table = 'review'
        verbose_name = 'review'
        verbose_name_plural = 'review'
