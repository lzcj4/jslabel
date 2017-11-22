from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey, GenericRelation
from django.contrib.contenttypes.models import ContentType
from django.db import models

# Create your models here.
from django.db.models.signals import post_save
from django.dispatch import receiver


class UserInfo(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    department = models.CharField(max_length=100)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserInfo.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.userinfo.save()


class CarBrand(models.Model):
    name = models.CharField(max_length=100, verbose_name='car name', unique=True)
    index_char = models.CharField(max_length=10, blank=True, verbose_name='for quick location')


class CarModel(models.Model):
    brand = models.ForeignKey(CarBrand, on_delete=models.CASCADE, default=0)
    name = models.CharField(max_length=100, verbose_name='car model name')


class CarFeature(models.Model):
    model = models.ForeignKey(CarModel, on_delete=models.CASCADE)
    market_year = models.IntegerField(verbose_name='model create year', default=0)
    front = models.CharField(max_length=100, verbose_name='front feature', blank=True)
    front_photo = models.CharField(max_length=100, verbose_name='front photo', blank=True)
    back = models.CharField(max_length=100, verbose_name='back feature', blank=True)
    back_photo = models.CharField(max_length=100, verbose_name='back photo', blank=True)
