from django.contrib.auth import login
from django.contrib.auth.views import LoginView, LogoutView, PasswordChangeView
from django.http import HttpResponseRedirect, JsonResponse
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import FormView, ListView

from backend.forms import MyAuthenticationForm, MyPasswordChangeForm, MarkTaskCreateForm
from backend.models import MarkTask, MarkFile, MarkUserTask


def add_test_user(user):
    pass
    # user = User.objects.create_user('test', 'test@icare.com', 'test')
    # if not user:
    #     user.set_password("admin")
    #     user.save()


def add_test_task(user):
    get_items = MarkUserTask.objects.filter(user=user)
    # get_items = MarkUserTask.objects.filter(user__id=user.id)
    u_t = get_items[0] if get_items and len(get_items) > 0 else None
    if u_t:
        print("user:{0},task:{1}".format(u_t.user.id, u_t.task.id))
    task = MarkTask(name="task1")
    task.save()

    file = MarkFile(file_path='c:/test.jpg')
    file.task = task
    file.save()

    user_task = MarkUserTask(task=task, user=user)
    user_task.save()
    file2 = MarkFile(file_path='c:/test2.jpg')
    file2.task = task
    file2.save()

    print("task:{0},file:{1},task.files:{2}".format(task.id, file.id, task.files.count()))


class MyLoginView(LoginView):
    """
        Login with MyAuthenticationForm
    """
    form_class = MyAuthenticationForm
    template_name = "login.html"

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        if self.redirect_authenticated_user and self.request.user.is_authenticated:
            redirect_to = self.get_success_url()
            if redirect_to == self.request.path:
                raise ValueError(
                    "Redirection loop for authenticated user detected. Check that "
                    "your LOGIN_REDIRECT_URL doesn't point to a login page."
                )
            return HttpResponseRedirect(redirect_to)
        return super(LoginView, self).dispatch(request, *args, **kwargs)

    #     return super(MyLoginView, self).dispatch(request, *args, **kwargs)

    def form_valid(self, form):
        """Security check complete. Log the user in."""
        user = form.get_user()
        # add_test_task(user)
        # add_test_user(user)
        login(self.request, user)
        return JsonResponse(
            {"code": 200, 'msg': "login view succeed,current user:{0}".format(user.username)})
        # return HttpResponseRedirect(self.get_success_url())


class MyLogoutView(LogoutView):
    next_page = 'backend:index'


class MyPasswordChangeView(PasswordChangeView):
    template_name = 'password_change.html'
    success_url = reverse_lazy('backend:index')
    form_class = MyPasswordChangeForm


class MarkTaskCreateView(FormView):
    template_name = 'task_create.html'
    success_url = reverse_lazy('backend:task_list')
    form_class = MarkTaskCreateForm

    def form_valid(self, form):
        """Security check complete. Log the user in."""
        task = self.create_task(form)
        print("create mark task:{0} succeed".format(task.id))
        return HttpResponseRedirect(self.get_success_url())
        # return JsonResponse({"code": 200, 'msg': "create mark task:{0} succeed".format(task.id)})

    def create_task(self, form):
        user = self.request.user
        task_name = form.cleaned_data['name']
        file_path = form.cleaned_data['file_path']

        task = MarkTask(name=task_name, user_created=user)
        task.save()

        file = MarkFile(file_path=file_path)
        file.task = task
        file.save()

        user_task = MarkUserTask(task=task, user=user)
        user_task.save()

        print("task:{0},file:{1},task.files:{2}".format(task.id, file.id, task.files.count()))
        return task


class MarkTaskListView(ListView):
    template_name = 'task_list.html'
    context_object_name = "tasks"

    def get_queryset(self):
        return MarkTask.objects.filter(user_created=self.request.user)
