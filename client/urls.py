from django.urls import path

from .views import *

urlpatterns = [
    path('', Index.as_view(), name='index'),
    path('ClientLoginSignup', ClientLoginSignup.as_view(), name='ClientLoginSignup'),
    path('ClinetSignup', ClinetSignup.as_view(), name='ClinetSignup'),
    path('ClinetLogin', ClinetLogin.as_view(), name='ClinetLogin'),

    path('ClientDashboard', ClientDashboard.as_view(), name='ClientDashboard'),
    path('UpdateClientProfile', UpdateClientProfile.as_view(), name='UpdateClientProfile'),
    path('UpdateClientPassword', UpdateClientPassword.as_view(), name='UpdateClientPassword'),
    path('clientLogout', clientLogout.as_view(), name='clientLogout'),

    path('ShowProducts', ShowProducts.as_view(), name='ShowProducts'),
    path('ShowProductDetails/<int:id>', ShowProductDetails.as_view(), name='ShowProductDetails'),
    path('ShowProductsByCategory/<str:category>', ShowProductsByCategory.as_view(), name='ShowProductsByCategory'),
    path('ShowProductSearch/<str:search>', ShowProductSearch.as_view(), name='ShowProductSearch'),

    path('AllStores', AllStores.as_view(), name='AllStores'),
    path('ShowStoreDetails/<int:id>', ShowStoreDetails.as_view(), name='ShowStoreDetails'),
    path('ShowStoreDetails/<int:id>/<str:category>', ShowStoreDetails.as_view(), name='ShowStoreDetails'),
    path('ShowStoreSearch/<str:search>', ShowStoreSearch.as_view(), name='ShowStoreSearch'),
    path('viewStoreReviews/<int:id>', viewStoreReviews.as_view(), name='viewStoreReviews'),

    path('AddToCart/<int:id>', AddToCart.as_view(), name='AddToCart'),
    path('sendCartData', sendCartData.as_view(), name='sendCartData'),
    path('IncreaseCartQuantity/<int:id>', IncreaseCartQuantity.as_view(), name='IncreaseCartQuantity'),
    path('DecreaseCartQuantity/<int:id>', DecreaseCartQuantity.as_view(), name='DecreaseCartQuantity'),

    path('CheckoutPage', CheckoutPage.as_view(), name='CheckoutPage'),
    path('ConfirmOrder', ConfirmOrder.as_view(), name='ConfirmOrder'),
    path('orderSuccess', orderSuccess.as_view(), name='orderSuccess'),


    path('showOrderDetails/<int:id>', showOrderDetails.as_view(), name='showOrderDetails'),
    path('ReviewStore/<int:id>', ReviewStore.as_view(), name='ReviewStore'),
    path('ReviewStore', ReviewStore.as_view(), name='ReviewStore'),
]
