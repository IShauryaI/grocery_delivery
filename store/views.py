from django.http import *
from django.shortcuts import *
from django.views.generic import View

from .forms import *
from .models import *
from client.models import *

from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
#______________________________________________________________________________________________________________________________________________________

# STORE RELATED

class Index(View):
    def get(self, request):
        store_form = StoreForm()
        product = []
        orderDetails = []
        if 'store_info' in request.session:
            product = Product.objects.filter(Store_id=request.session['store_info']['id'], product_status='a')
            orderDetails = OrderDetails.objects.filter(Store_id=request.session['store_info']['id'], order_delivery_status='d')
            print(orderDetails)
        return render(request, 'store/index.html', {'title': 'Index | Grocery Delivery Store ', 'store_form': store_form, 'product': product, 'orderDetails': orderDetails})


class StoreSignup(View):
    def post(self, request):
        StoreInfo = StoreForm(request.POST, request.FILES)

        if StoreInfo.is_valid():
            StoreInfo.save()
            return HttpResponse('success')

        else:
            return HttpResponse('fail')


class StoreLogin(View):
    def post(self, request):
        StoreEmail = request.POST['store_email']
        StorePassword = request.POST['store_password']
        StoreExists = Store.objects.filter(store_email=StoreEmail, store_password=StorePassword)

        if len(StoreExists) == 0:
            return HttpResponse('fail')

        else:
            StoreInfo = {
                'id': StoreExists[0].id,
                'name': StoreExists[0].store_name,
                'email': StoreExists[0].store_email,
                'status': StoreExists[0].store_status,
                'rating': StoreExists[0].store_rating,
            }
            request.session['store_info'] = StoreInfo
            return HttpResponse('success')


class StoreLogout(View):
    def get(self, request):
        del request.session['store_info']
        return redirect('Index')

#______________________________________________________________________________________________________________________________________________________

# PRODUCT RELATED

class ManageProducts(View):
    def get(self, request):
        if 'store_info' in request.session and request.session['store_info']['status'] == 'a':
            addProductForm = ProductForm()
            categories = Category.objects.all()
            return render(request, 'store/manageProducts.html', {'title': 'Store Products | Grocery Delivery Store', 'addProductForm':addProductForm, 'categories': categories})
        else:
            return redirect('Index')


class ViewStoreProduct(View):
    def get(self, request):
        storeProducts = Product.objects.filter(Store_id=request.session['store_info']['id'])
        # return JsonResponse(list(storeProducts.values()), safe=False)
        return JsonResponse(list(storeProducts.values()), safe=False)


class DeleteProduct(View):
    def get(self, request, *args, **kwargs):
        productId = kwargs['id']
        product = Product.objects.get(id=productId)
        product.delete()
        return HttpResponse('success')


class AddProduct(View):
    def post(self, request):
        addProductForm = ProductForm(request.POST, request.FILES)
        if addProductForm.is_valid():
            # Cleaned data returns object that contains form values
            mrp = int(addProductForm.cleaned_data['product_price'])
            offer = int(addProductForm.cleaned_data['product_offer'])

            # to add additional fileds like Store and New Price
            obj = addProductForm.save(commit=False)
            obj.Store_id = int(request.session['store_info']['id'])
            obj.product_new_price = mrp - (offer*mrp/100)
            obj.save()

            return HttpResponse('success')

        else:
            return HttpResponse('failure')


class updateProduct(View):
    def post(self, request):
        product_id = request.POST['id']
        updateObj = Product.objects.get(id=product_id)
        mrp = int(request.POST['product_price'])
        offer = int(request.POST['product_offer'])

        updateObj.product_name = request.POST['product_name']
        updateObj.product_description = request.POST['product_description']
        updateObj.Category_id = request.POST['Category']
        updateObj.product_price = mrp
        updateObj.product_offer = offer
        updateObj.product_new_price = mrp - (offer*mrp/100)
        if 'product_image' in request.FILES:
            updateObj.product_image = request.FILES['product_image']

        updateObj.save()
        return HttpResponse('success')

#______________________________________________________________________________________________________________________________________________________

class ManageOrders(View):
    def get(self, request):
        if 'store_info' in request.session and request.session['store_info']['status'] == 'a':
            DeliveredOrderItems = OrderDetails.objects.filter(Store_id=request.session['store_info']['id'], order_delivery_status='d')
            PendingOrderItems = OrderDetails.objects.filter(Store_id=request.session['store_info']['id'], order_delivery_status='p')

            return render(request, 'store/manageOrders.html', {'title': 'Store Orders | Grocery Delivery Store', 'PendingOrderItems':PendingOrderItems, 'DeliveredOrderItems':DeliveredOrderItems })
        else:
            return redirect('Index')

@method_decorator(csrf_exempt, name='dispatch')
class deliverProduct(View):
    def post(self, request):
        val = request.POST['order_delivery_status']
        id = request.POST['order_id']
        OrderDetailObj = OrderDetails.objects.get(id=id)
        OrderDetailObj.order_delivery_status = val
        OrderDetailObj.save()
        return HttpResponse('success')



#______________________________________________________________________________________________________________________________________________________



class ManageReviews(View):
    def get(self, request):
        if 'store_info' in request.session and request.session['store_info']['status'] == 'a':
            reviews = Reviews.objects.filter(Store_id=request.session['store_info']['id'])
            return render(request, 'store/manageReviews.html', {'title': 'Store Reviews | Grocery Delivery Store', 'reviews':reviews})
        else:
            return redirect('Index')

#______________________________________________________________________________________________________________________________________________________


class ManageStoreProfile(View):
    def get(self, request):
        if 'store_info' in request.session:
            storeInfo = Store.objects.get(id=request.session['store_info']['id'])
            return render(request, 'store/manageProfile.html', {'title': 'Store Profile | Grocery Delivery Store', 'storeInfo':storeInfo})
        else:
            return redirect('Index')

class UpdateStoreProfile(View):
    def post(self, request):
        storeInfo = Store.objects.get(id=request.session['store_info']['id'])

        storeInfo.store_email = request.POST['store_email']
        storeInfo.store_mobile = request.POST['store_mobile']

        if 'store_image' in request.FILES:
            storeInfo.store_image=request.FILES['store_image']
        storeInfo.save()
        return HttpResponse('success')


class UpdateStorePassword(View):
    def post(self, request):
        storeInfo = Store.objects.get(id=request.session['store_info']['id'])

        org_password = storeInfo.store_password
        old_password = request.POST['old_password']
        new_password = request.POST['new_password']
        confirm_password = request.POST['confirm_password']

        if new_password == confirm_password:
            if old_password == org_password:
                if old_password != new_password:
                    storeInfo.store_password = new_password
                    storeInfo.save()
                    return HttpResponse('success')
                else:
                    return HttpResponse('same')
            else:
                return HttpResponse('wrong')
        else:
            return HttpResponse('notSame')



