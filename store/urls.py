from django.urls import path

from .views import *

urlpatterns = [
    path('', Index.as_view(), name='Index'),
    path('StoreSignup', StoreSignup.as_view(), name='StoreSignup'),
    path('StoreLogin', StoreLogin.as_view(), name='StoreLogin'),
    path('StoreLogout', StoreLogout.as_view(), name='StoreLogout'),

    path('ManageProducts', ManageProducts.as_view(), name='ManageProducts'),
    path('AddProduct', AddProduct.as_view(), name='AddProduct'),
    path('ViewStoreProduct', ViewStoreProduct.as_view(), name='ViewStoreProduct'),
    path('updateProduct', updateProduct.as_view(), name='updateProduct'),
    path('DeleteProduct/<int:id>', DeleteProduct.as_view(), name='DeleteProduct'),

    path('ManageOrders', ManageOrders.as_view(), name='ManageOrders'),
    path('ManageReviews', ManageReviews.as_view(), name='ManageReviews'),

    path('ManageProfile', ManageStoreProfile.as_view(), name='ManageProfile'),
    path('UpdateProfile', UpdateStoreProfile.as_view(), name='UpdateProfile'),
    path('UpdatePassword', UpdateStorePassword.as_view(), name='UpdateProfile'),

    path('deliverProduct', deliverProduct.as_view(), name='deliverProduct'),

]
