# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-24 16:09
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0005_auto_20171124_1600'),
    ]

    operations = [
        migrations.AlterField(
            model_name='markfile',
            name='file_path',
            field=models.CharField(default='', max_length=500, verbose_name='文件服务器端相对路径'),
        ),
        migrations.AlterField(
            model_name='marktask',
            name='user_created',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='创建人'),
        ),
    ]
