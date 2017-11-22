from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm


class MyAuthenticationForm(AuthenticationForm):
    """
    Base class for authenticating users. Extend this to get a form that accepts
    username/password logins.
    """

    def __init__(self, request, *args, **kwargs):
        super(MyAuthenticationForm, self).__init__(request, *args, **kwargs)
        self.fields['username'].label = '用户名'
        self.fields['password'].label = '密码'


# class LoginForm(forms.ModelForm):
#     class Meta:
#         model = User
#         fields = ('username', 'password')
#         localized_fields = ('username', 'password')
#         labels = {
#             'username': _('用户名'),
#             'password': _('密码'),
#         }
#         help_texts = {
#             'name': _("")
#             #     {
#             #     'max_length': _("This writer's name is too long."),
#             # },
#         }

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
