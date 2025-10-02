from datetime import datetime

from django.db.models import Count
from django.http import *
from django.shortcuts import *
from django.views.generic import View

import mailDemo
from .forms import *


class Index(View):
    def get(self, request):
        category = Category.objects.all()
        Cities = City.objects.all()

        if 'client_info' in request.session:
            randomProducts = Product.objects.filter(product_status='a',
                                                    Store__City_id=request.session['client_info']['city']).order_by(
                "?")[:8]
            randomStores = Store.objects.filter(store_status='a',
                                                City_id=request.session['client_info']['city']).order_by("?")[:4]
        else:
            randomProducts = Product.objects.filter(product_status='a').order_by("?")[:8]
            randomStores = Store.objects.filter(store_status='a').order_by("?")[:4]

        return render(request, 'client/index.html',
                      {'title': 'Welcome to Daily Delivery', 'category': category, 'randomProducts': randomProducts,
                       'Cities': Cities, 'randomStores': randomStores})


class ClientLoginSignup(View):
    def get(self, request):
        if "client_info" not in request.session:
            category = Category.objects.all()
            clientRegisterForm = ClientForm()
            return render(request, 'client/clientloginSignup.html',
                          {'title': 'Login & Register', 'clientRegisterForm': clientRegisterForm, 'category': category})
        else:
            return redirect('ClientDashboard')


class ClinetLogin(View):
    def post(self, request):
        email = request.POST['email']
        password = request.POST['password']
        data = Client.objects.filter(client_email=email, client_password=password)
        print(data)
        if len(data) > 0:
            dict = {
                'id': data[0].id,
                'name': data[0].client_name,
                'email': data[0].client_email,
                'mobile': data[0].client_mobile,
                'city': data[0].City_id
            }
            request.session['client_info'] = dict
            return HttpResponse('success')
        else:
            return HttpResponse('fail')


class ClinetSignup(View):
    def post(self, request):
        clientRegisterForm = ClientForm(request.POST)

        if clientRegisterForm.is_valid():
            clientRegisterForm.save()
            return HttpResponse('success')


class ClientDashboard(View):
    def get(self, request):
        if "client_info" in request.session:
            clinetInfo = Client.objects.get(id=request.session['client_info']['id'])
            cities = City.objects.all()
            category = Category.objects.all()
            orders = Order.objects.filter(Client_id=request.session['client_info']['id']).order_by('-order_date')
            reviewStore = (OrderDetails.objects.filter(Client_id=request.session['client_info']['id']).values('Store',
                                                                                                              'Store__store_name',
                                                                                                              'Store__store_image',
                                                                                                              'Store__store_rating')
                           .annotate(itemCount=Count('Store'))
                           .order_by())
            # reviewedStores = Reviews.objects.filter(Client_id=request.session['client_info']['id'])
            print(reviewStore)
            # print(reviewedStores)
            return render(request, 'client/clinetDashboard.html',
                          {'title': 'Client Dashboard', 'clinetInfo': clinetInfo, 'cities': cities,
                           'category': category, 'orders': orders, 'reviewStore': reviewStore, })
        else:
            return redirect('ClientLoginSignup')


class clientLogout(View):
    def get(self, request):
        del request.session['client_info']
        return redirect('ClientLoginSignup')


class UpdateClientProfile(View):
    def post(self, request):
        clinetInfo = Client.objects.get(id=request.session['client_info']['id'])
        clinetInfo.client_address = request.POST['client_address']
        clinetInfo.client_email = request.POST['client_email']
        clinetInfo.client_mobile = request.POST['client_mobile']
        clinetInfo.City_id = request.POST['client_city']
        clinetInfo.save()

        del request.session['client_info']
        dict = {
            'id': clinetInfo.id,
            'name': clinetInfo.client_name,
            'email': clinetInfo.client_email,
            'city': clinetInfo.City_id
        }
        request.session['client_info'] = dict
        return HttpResponse('success')


class UpdateClientPassword(View):
    def post(self, request):
        clinetInfo = Client.objects.get(id=request.session['client_info']['id'])

        org_password = clinetInfo.client_password
        old_password = request.POST['old_password']
        new_password = request.POST['new_password']
        confirm_password = request.POST['confirm_password']

        if new_password == confirm_password:
            if old_password == org_password:
                if old_password != new_password:
                    clinetInfo.client_password = new_password
                    clinetInfo.save()
                    return HttpResponse('success')
                else:
                    return HttpResponse('same')
            else:
                return HttpResponse('wrong')
        else:
            return HttpResponse('notSame')


# ______________________________________________________________________________________________________________________________________________________

class ShowProducts(View):
    def get(self, request):
        if 'client_info' in request.session:
            productList = Product.objects.filter(Store__City_id=request.session['client_info']['city'],
                                                 product_status='a').order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (
                Product.objects.filter(Store__City_id=request.session['client_info']['city'], product_status='a')
                .values('Category')
                .annotate(itemCount=Count('Category'))
                .order_by())
        else:
            productList = Product.objects.filter(product_status='a').order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (Product.objects.filter(product_status='a')
                                      .values('Category')
                                      .annotate(itemCount=Count('Category'))
                                      .order_by())
        category = Category.objects.all()
        return render(request, 'client/Products.html', {'title': 'All Products', 'productList': productList,
                                                        'StoreProductCategories': StoreProductCategories,
                                                        'current': 'All Products', 'category': category})


class ShowProductDetails(View):
    def get(self, request, *args, **kwargs):
        productId = kwargs['id']
        productInfo = Product.objects.get(id=productId)
        category = Category.objects.all()
        return render(request, 'client/ProductDetails.html',
                      {'title': 'All Products', 'productInfo': productInfo, 'category': category})


class ShowProductsByCategory(View):
    def get(self, request, *args, **kwargs):
        Category_id = kwargs['category']
        category = Category.objects.all()
        if 'client_info' in request.session:
            productList = Product.objects.filter(Store__City_id=request.session['client_info']['city'],
                                                 product_status='a', Category_id=Category_id).order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (
                Product.objects.filter(Store__City_id=request.session['client_info']['city'], product_status='a')
                .values('Category')
                .annotate(itemCount=Count('Category'))
                .order_by())
        else:
            productList = Product.objects.filter(product_status='a', Category_id=Category_id).order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (Product.objects.filter(product_status='a')
                                      .values('Category')
                                      .annotate(itemCount=Count('Category'))
                                      .order_by())
        return render(request, 'client/Products.html', {'title': 'All Products', 'productList': productList,
                                                        'StoreProductCategories': StoreProductCategories,
                                                        'current': Category, 'category': category})


class ShowProductSearch(View):
    def get(self, request, *args, **kwargs):
        search = kwargs['search']
        search = search.capitalize()
        category = Category.objects.all()
        if 'client_info' in request.session:
            productList = Product.objects.filter(Store__City_id=request.session['client_info']['city'],
                                                 product_status='a', product_name__contains=search).order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (
                Product.objects.filter(Store__City_id=request.session['client_info']['city'], product_status='a')
                .values('Category')
                .annotate(itemCount=Count('Category'))
                .order_by())
        else:
            productList = Product.objects.filter(product_status='a', product_name__contains=search).order_by('?')
            # get group by of all categories that have been listed by the store
            StoreProductCategories = (Product.objects.filter(product_status='a')
                                      .values('Category')
                                      .annotate(itemCount=Count('Category'))
                                      .order_by())
        return render(request, 'client/Products.html', {'title': 'All Products', 'productList': productList,
                                                        'StoreProductCategories': StoreProductCategories,
                                                        'current': Category, 'category': category})


# ______________________________________________________________________________________________________________________________________________________

class AllStores(View):
    def get(self, request):
        category = Category.objects.all()
        if 'client_info' in request.session:
            storeList = Store.objects.filter(City_id=request.session['client_info']['city'])
        else:
            storeList = Store.objects.all()
        return render(request, 'client/stores.html',
                      {'title': 'DailyDelivery Stores', 'category': category, 'storeList': storeList})


class ShowStoreSearch(View):
    def get(self, request, *args, **kwargs):
        search = kwargs['search']
        search = search.capitalize()
        category = Category.objects.all()
        if 'client_info' in request.session:
            storeList = Store.objects.filter(City_id=request.session['client_info']['city'],
                                             store_status='a', store_name__contains=search).order_by('?')
            # get group by of all categories that have been listed by the store
        else:
            storeList = Store.objects.filter(store_status='a', store_name__contains=search).order_by('?')

        return render(request, 'client/stores.html',
                      {'title': 'DailyDelivery Stores', 'category': category, 'storeList': storeList})


class ShowStoreDetails(View):
    def get(self, request, *args, **kwargs):
        storeId = kwargs['id']
        storeInfo = Store.objects.get(id=storeId)
        category = Category.objects.all()
        if 'category' in kwargs:
            categoryId = kwargs['category']
            StoreProducts = Product.objects.filter(Store_id=storeId, Category=categoryId, product_status='a')
            current = categoryId

        else:
            StoreProducts = Product.objects.filter(Store_id=storeId, product_status='a')
            current = 'All Products'

        # get group by of all categories that have been listed by the store
        StoreProductCategories = (Product.objects.filter(Store_id=storeId, product_status='a')
                                  .values('Category')
                                  .annotate(itemCount=Count('Category'))
                                  .order_by())

        return render(request, 'client/storeDetails.html',
                      {'title': f"{storeInfo.store_name}'s Details", 'storeInfo': storeInfo,
                       'StoreProducts': StoreProducts, 'StoreProductCategories': StoreProductCategories,
                       'current': current, 'category': category, })


class viewStoreReviews(View):
    def get(self, request, *args, **kwargs):
        storeId = kwargs['id']
        storeInfo = Store.objects.get(id=storeId)
        reviews = Reviews.objects.filter(Store_id=storeId)

        StoreProductCategories = (Product.objects.filter(Store_id=storeId, product_status='a')
                                  .values('Category')
                                  .annotate(itemCount=Count('Category'))
                                  .order_by())
        print(reviews)

        return render(request, 'client/clientStoreReviews.html',
                      {'title': f"{storeInfo.store_name}'s Details", 'storeInfo': storeInfo,
                       'StoreProductCategories': StoreProductCategories,
                       'reviews': reviews, })


# ______________________________________________________________________________________________________________________________________________________


class AddToCart(View):
    def get(self, request, *args, **kwargs):
        if 'client_info' in request.session:
            productId = kwargs['id']
            productInfo = Product.objects.get(id=productId)

            cartCheck = Cart.objects.filter(Client_id=request.session['client_info']['id'], Product_id=productId)
            if len(cartCheck) == 0:
                cartObj = Cart()
                cartObj.Client_id = request.session['client_info']['id']
                cartObj.Product_id = productId
                cartObj.Store_id = productInfo.Store_id
                cartObj.cart_quantity = 1
                cartObj.cart_total_price = float(productInfo.product_new_price)
                cartObj.save()
            else:
                cartCheck[0].cart_quantity += 1
                cartCheck[0].cart_total_price = round(
                    float(productInfo.product_new_price) + float(cartCheck[0].cart_total_price), 2)
                cartCheck[0].save()
            return HttpResponse('success')
        else:
            return HttpResponse('noSession')


class sendCartData(View):
    def get(self, request):
        if 'client_info' in request.session:
            cartItems = Cart.objects.filter(Client_id=request.session['client_info']['id'])
            cartList = []
            cartTotal = 0
            for row in cartItems:
                cartTotal += round(float(row.cart_total_price), 2)
                cartList.append({'id': row.id,
                                 'Product': row.Product.product_name,
                                 'Store': row.Store.store_name,
                                 'cart_quantity': row.cart_quantity,
                                 'cart_total_price': row.cart_total_price})

            return JsonResponse(cartList, safe=False)
        else:
            return JsonResponse([], safe=False)


class DecreaseCartQuantity(View):
    def get(self, request, *args, **kwargs):
        if 'client_info' in request.session:
            cartId = kwargs['id']
            cartObj = Cart.objects.get(id=cartId)
            cartObj.cart_quantity -= 1
            cartObj.cart_total_price = round(
                (float(cartObj.cart_total_price) - float(cartObj.Product.product_new_price)), 2)
            if cartObj.cart_quantity == 0:
                cartObj.delete()
            else:
                cartObj.save()
            return HttpResponse('success')
        else:
            return HttpResponse('noSession')


class IncreaseCartQuantity(View):
    def get(self, request, *args, **kwargs):
        if 'client_info' in request.session:
            cartId = kwargs['id']
            cartObj = Cart.objects.get(id=cartId)
            cartObj.cart_quantity += 1
            cartObj.cart_total_price = round(
                (float(cartObj.cart_total_price) + float(cartObj.Product.product_new_price)), 2)
            cartObj.save()
            return HttpResponse('success')
        else:
            return HttpResponse('noSession')


# ______________________________________________________________________________________________________________________________________________________


class CheckoutPage(View):
    def get(self, request):
        if 'client_info' in request.session:
            category = Category.objects.all()
            return render(request, 'client/checkoutPage.html', {'title': 'Checkout Order', 'category': category})
        else:
            return redirect('ClientLoginSignup')


class ConfirmOrder(View):
    def post(self, request):
        paymentMtd = request.POST['payment_mtd']
        if (paymentMtd == 'cod'):
            paymentMtd = 'c'
        else:
            paymentMtd = 'o'
        totalAmount = request.POST['amount']
        userCart = Cart.objects.filter(Client_id=request.session['client_info']['id'])

        # get present date
        present = datetime.now()
        present_day = present.date()

        orderObj = Order()
        orderObj.order_date = present_day
        orderObj.total_price = float(totalAmount)
        orderObj.payment_mtd = paymentMtd
        orderObj.Client_id = request.session['client_info']['id']
        orderObj.save()

        for rows in userCart:
            orderDetailObj = OrderDetails(
                Order_id=orderObj.id,
                Product_id=rows.Product_id,
                Store_id=rows.Store_id,
                Client_id=request.session['client_info']['id'],
                item_total_price=rows.cart_total_price,
                item_quantity=rows.cart_quantity
            )
            orderDetailObj.save()
            rows.delete()

        to = request.session['client_info']['email']
        subject = "Congratulations! Your Order has been Placed Successfully..."
        message = f"""Congratulations! Your Order has been Placed Successfully
        
        Dear {request.session['client_info']['name']}, Your Total Amount is {orderObj.total_price}.
        
        Your Order ID is {orderObj.id}
            
        """
        obj = mailDemo.sendEmail(to, subject, message)
        return HttpResponse('success')


class orderSuccess(View):
    def get(self, request):
        if 'client_info' in request.session:
            return render(request, 'client/orderSuccess.html', {'title': 'order Successful'})
        else:
            return redirect('ClientLoginSignup')


# ______________________________________________________________________________________________________________________________________________________


class showOrderDetails(View):
    def get(self, request, *args, **kwargs):
        orderId = kwargs['id']
        orderDetails = OrderDetails.objects.filter(Order_id=orderId)
        orderDetailsList = []
        for rows in orderDetails:
            orderDetailsList.append({
                'id': rows.id,
                'store_name': rows.Store.store_name,
                'product_name': rows.Product.product_name,
                'product_image': str(rows.Product.product_image),
                'product_price': rows.Product.product_new_price,
                'total_price': rows.item_total_price,
                'product_quantity': rows.item_quantity,
                'product_delivery_status': rows.order_delivery_status
            })
        print(orderDetailsList)
        return JsonResponse(orderDetailsList, safe=False)


# ______________________________________________________________________________________________________________________________________________________


class ReviewStore(View):
    def get(self, request, *args, **kwargs):
        reviewId = kwargs['id']
        reviewStore = Store.objects.get(id=reviewId)
        return render(request, 'client/clientReviewStore.html',
                      {'title': f'Review {reviewId}', 'reviewStore': reviewStore})

    def post(self, request):
        clientId = request.session['client_info']['id']
        storeId = request.POST['Store_id']
        reviewScore = float(request.POST['review_score'])
        reviewFlag = Reviews.objects.filter(Store_id=storeId, Client_id=clientId)

        if len(reviewFlag) == 0:
            reviewStoreObj = Reviews()
            reviewStoreObj.Store_id = storeId
            reviewStoreObj.review_score = reviewScore
            reviewStoreObj.review_title = request.POST['review_title']
            reviewStoreObj.review_description = request.POST['review_description']
            reviewStoreObj.review_date = (datetime.now()).date()
            reviewStoreObj.Client_id = clientId
            reviewStoreObj.save()

        else:
            reviewFlag[0].review_score = request.POST['review_score']
            reviewFlag[0].review_title = request.POST['review_title']
            reviewFlag[0].review_description = request.POST['review_description']
            reviewFlag[0].review_date = (datetime.now()).date()
            reviewFlag[0].save()

        StoreObj = Store.objects.get(id=storeId)
        OldRating = float(StoreObj.store_rating)
        if OldRating == -1:
            newRev = reviewScore
        else:
            totalStoreReviews = len(Reviews.objects.filter(Store_id=storeId)) + 1
            newRev = (OldRating + reviewScore) / totalStoreReviews
        StoreObj.store_rating = newRev
        StoreObj.save()

        return redirect('ClientDashboard')
