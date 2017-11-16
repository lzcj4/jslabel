from django import forms


class LoginForm(forms.Form):
    user = forms.CharField(label='user', max_length=100)
    pwd = forms.CharField(label='pwd', max_length=20)
