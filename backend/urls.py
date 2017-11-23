from django.conf.urls import url

from backend import views
from backend.views_car import CarListView
from backend.views_my import MyLoginView, MyLogoutView, MyPasswordChangeView, MarkTaskCreateView, MarkTaskListView

app_name = "backend"
urlpatterns = [
    url(r'^$', views.index, name="index"),
    # url(r'login/$', views.user_login, name="login"),
    # url(r'logout/$', views.user_logout, name="logout"),
    # url(r'car/$', views_car.list_car, name="list_car"),


    url(r'login/$', MyLoginView.as_view(), name="login"),
    url(r'logout/$', MyLogoutView.as_view(), name="logout"),
    url(r'password/change/$', MyPasswordChangeView.as_view(), name="password_change"),
    url(r'car/list/$', CarListView.as_view(), name="list_car"),

    url(r'task/list/', MarkTaskListView.as_view(), name="task_list"),
    url(r'task/create/$', MarkTaskCreateView.as_view(), name="task_create"),
]
