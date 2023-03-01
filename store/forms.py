from django import forms
from .models import *

class StoreForm(forms.ModelForm):
    class Meta:

        model = Store
        fields = ['store_name', 'store_email', 'store_mobile', 'store_password', 'store_image', 'store_address', 'City']

        widgets = {
            'store_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg: D-Mart', 'data-rule-required':'true'}),
            'store_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Eg: merchant@dailydelivery.com'}),
            'store_mobile': forms.TextInput(attrs={'class': 'form-control',  'type':'number', 'placeholder': 'Eg: 91 9910000000 '}),
            'store_password': forms.TextInput(attrs={'class': 'form-control', 'type': 'password','placeholder': '* * * * * * * * * * * * * * * * * *'}),
            'store_image': forms.FileInput(attrs={'class': 'form-control', 'placeholder': '','data-rule-required': 'true'}),
            'store_address': forms.Textarea(attrs={'class': 'form-control', 'rows': '4', 'placeholder': 'Eg: D-Mart, 23-B Laurence Rd, Amritsar'}),
            'City': forms.Select(attrs={'class': 'form-control', 'placeholder': 'Select City'}),
        }

        labels = {
            'store_name': 'Enter Store Name ',
            'store_email': 'Enter Store Email ',
            'store_mobile': 'Enter Store Contact Info ',
            'store_password': 'Enter Store Password ',
            'store_image': "Enter Store Image ",
            'store_address': "Enter Store's Address ",
            'City': 'Select City ',
        }


class ProductForm(forms.ModelForm):
    class Meta:

        model = Product
        fields = ['product_name', 'product_description', 'Category', 'product_image', 'product_price', 'product_offer']

        widgets = {
            'product_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg: Parle G Biscuits', 'data-rule-required': 'true'}),
            'product_description': forms.Textarea(attrs={'class': 'form-control', 'data-rule-required': 'true', 'rows':'4'}),
            'Category': forms.Select(attrs={'class': 'form-control', 'data-rule-required': 'true'}),
            # 'Store': forms.Select(attrs={'class': 'form-control', 'data-rule-required': 'true'}),
            'product_image': forms.FileInput(attrs={'class': 'form-control', 'data-rule-required': 'true'}),
            'product_price': forms.NumberInput(attrs={'class': 'form-control', 'type':'number', 'placeholder': 'Eg: 500', 'data-rule-required': 'true'}),
            'product_offer': forms.NumberInput(attrs={'class': 'form-control', 'placeholder': 'Eg: 20%', 'data-rule-required': 'true', 'type':'number'}),
        }

        labels = {
            'product_name': 'Enter Product Name ',
            'product_description': 'Enter Product Description ',
            'Category': 'Choose product Category ',
            'product_image': 'Enter Product Image ',
            'product_price': "Enter Product MRP ",
            'product_offer': "Enter Product Discount ",
        }
