import json

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

from backend.forms import LoginForm
from backend.utils import log_time
from models import CarFeature

HTTP_GET = "GET"
HTTP_POST = "POST"


def email_check(user):
    return False


@log_time
@login_required
def index(request):
    if request.user.is_authenticated():
        return HttpResponse(json.dumps({"code": 200, 'msg': "current user:{0}".format(request.user.username)}))
        # else:
        #     return HttpResponseRedirect("login")
        # return render(request, "user_login.html")


def add_perm(user):
    content_type = ContentType.objects.get_for_model(CarFeature)
    permission = Permission.objects.create(codename='can_list_car_feature',
                                           name='Can Publish Posts',
                                           content_type=content_type)
    user.user_permissions.add(permission)
    user.save()


@csrf_exempt
def user_login(request):
    if request.method == HTTP_POST:
        # form = LoginForm(request.POST)
        # iv = form.is_valid()
        # if not iv:
        #     return render(request, "login.html", {'form': form})
        usr, pwd = request.POST['user'], request.POST['pwd']
        user = authenticate(username=usr, password=pwd)
        if user and user.is_authenticated():
            login(request, user)
            next_url = request.POST.get('next')
            if not next_url:
                next_url = request.GET.get('next')

            add_perm(user)
            if next_url:
                return HttpResponseRedirect(next_url)
            else:
                return JsonResponse({"code": 200, 'msg': "login succeed,current user:{0}".format(user.username)})
        else:
            return JsonResponse({"code": 500, 'msg': "incorrect user or pwd"})
            # return HttpResponse(json.dumps({"code": 500, 'msg': "incorrect user or pwd"}))
    else:
        form = LoginForm()
        return render(request, "login.html", {'form': form})


@login_required
def user_change_pwd(request):
    logout(request)
    return HttpResponse(json.dumps({"code": 200, 'msg': "logout succeed"}))


@permission_required('backend.logout')
# @user_passes_test(email_check, redirect_field_name=None)
@login_required
def user_logout(request):
    logout(request)
    return HttpResponse(json.dumps({"code": 200, 'msg': "logout succeed"}))
