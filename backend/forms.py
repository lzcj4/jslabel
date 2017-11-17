from django import forms
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _


# class LoginForm(forms.Form):
class LoginForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ('username', 'password')
        localized_fields = ('username', 'password')
        labels = {
            'username': _('用户名'),
            'password': _('密码'),
        }
        help_texts = {
            'name': _("")
            #     {
            #     'max_length': _("This writer's name is too long."),
            # },
        }
