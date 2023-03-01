from django import forms
from .models import *

class ClientForm(forms.ModelForm):
    class Meta:

        model = Client
        fields = ['client_name', 'client_mobile', 'client_email', 'client_address', 'City', 'client_password']

        widgets = {
            'client_name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Eg: Jhon Doe', 'data-rule-required':'true'}),
            'client_mobile': forms.TextInput(attrs={'class': 'form-control', 'type': 'number', 'placeholder': 'Eg: 9915XXXXXX', 'data-rule-required':'true'}),
            'client_email': forms.EmailInput(attrs={'class': 'form-control', 'placeholder': 'Eg: jhondoe@developer.com', 'data-rule-required':'true'}),
            'client_address': forms.Textarea(attrs={'class': 'form-control', 'rows': '4', 'placeholder': 'Eg: Jhon Doe House, 123, City:ABC', 'data-rule-required':'true'}),
            'City': forms.Select(attrs={'class': 'form-control', 'placeholder': 'Select City', 'data-rule-required':'true'}),
            'client_password': forms.TextInput(attrs={'class': 'form-control', 'type': 'password', 'placeholder': ' *  *  *  *  *  *  *  *  *  *', 'data-rule-required':'true'})
        }

        labels = {
            'client_name': "Enter Your Name",
            'client_mobile': "Enter Your Contact Info",
            'client_email': "Enter Your Email",
            'client_address': "Enter Your Address",
            'City': "Enter your City",
            'client_password': "Enter your Password"
        }