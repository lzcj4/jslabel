# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-12-14 19:44
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0008_auto_20171125_1000'),
    ]

    operations = [
        migrations.AlterField(
            model_name='marktask',
            name='user_created',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='创建人'),
        ),
    ]
