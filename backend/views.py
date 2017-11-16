import json
import time

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

from backend.utils import stop_watch

HTTP_GET = "GET"
HTTP_POST = "POST"


@stop_watch
@login_required
def index(request):
    if request.user.is_authenticated():
        return HttpResponse(json.dumps({"code": 200, 'msg': "current user:{0}".format(request.user.username)}))
        # else:
        #     return HttpResponseRedirect("login")
        # return render(request, "user_login.html")


@csrf_exempt
def user_login(request):
    if request.method == HTTP_POST:
        usr, pwd = request.POST['user'], request.POST['pwd']
        user = authenticate(username=usr, password=pwd)
        if user and user.is_authenticated():
            login(request, user)
            next_url = request.POST.get('next')
            if not next_url:
                next_url = request.GET.get('next')

            if next_url:
                return HttpResponseRedirect(next_url)
            else:
                return JsonResponse({"code": 200, 'msg': "login succeed,current user:{0}".format(user.username)})
        else:
            return JsonResponse({"code": 500, 'msg': "incorrect user or pwd"})
            # return HttpResponse(json.dumps({"code": 500, 'msg': "incorrect user or pwd"}))
    else:
        return render(request, "login.html")


@login_required
def user_change_pwd(request):
    logout(request)
    return HttpResponse(json.dumps({"code": 200, 'msg': "logout succeed"}))


@login_required
def user_logout(request):
    logout(request)
    return HttpResponse(json.dumps({"code": 200, 'msg': "logout succeed"}))
