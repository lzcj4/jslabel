from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm
from django import forms
from django.utils.translation import ugettext, ugettext_lazy as _


class MyAuthenticationForm(AuthenticationForm):
    """
    Base class for authenticating users. Extend this to get a form that accepts
    username/password logins.
    """

    def __init__(self, request, *args, **kwargs):
        super(MyAuthenticationForm, self).__init__(request, *args, **kwargs)
        self.fields['username'].label = '用户名'
        self.fields['password'].label = '密码'


class MyPasswordChangeForm(PasswordChangeForm):
    """
    Base class for authenticating users. Extend this to get a form that accepts
    username/password logins.
    """

    def __init__(self, user, *args, **kwargs):
        super(MyPasswordChangeForm, self).__init__(user, *args, **kwargs)
        self.fields['old_password'].label = '旧密码'
        self.fields['new_password1'].label = '新密码'
        self.fields['new_password2'].label = '确认新密码'


class MarkTaskCreateForm(forms.Form):
    """
      Mark task create form
    """
    name = forms.CharField(label=_("任务名"), max_length=50)
    file_path = forms.CharField(label=_("文件名"), max_length=250)

    def __init__(self, request, *args, **kwargs):
        super(MarkTaskCreateForm, self).__init__(request, *args, **kwargs)
