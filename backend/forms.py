from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm


class MyAuthenticationForm(AuthenticationForm):
    """
    Base class for authenticating users. Extend this to get a form that accepts
    username/password logins.
    """

    def __init__(self, request, *args, **kwargs):
        super(MyAuthenticationForm, self).__init__(request, *args, **kwargs)
        MyAuthenticationForm.declared_fields['username'].label = '用户名'
        MyAuthenticationForm.declared_fields['password'].label = '密码'


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

    # old_password = forms.CharField(
    #     label=_("旧密码"),
    #     strip=False,
    #     widget=forms.PasswordInput,
    # )
    # new_password1 = forms.CharField(
    #     label=_("新密码"),
    #     strip=False,
    #     widget=forms.PasswordInput,
    # )
    #
    # new_password2 = forms.CharField(
    #     label=_("确认新密码"),
    #     strip=False,
    #     widget=forms.PasswordInput,
    # )

    def __init__(self, user, *args, **kwargs):
        super(MyPasswordChangeForm, self).__init__(user, *args, **kwargs)
        PasswordChangeForm.declared_fields['old_password'].label = '旧密码'
        PasswordChangeForm.declared_fields['new_password1'].label = '新密码'
        PasswordChangeForm.declared_fields['new_password2'].label = '确认新密码'
