# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-11-22 22:00
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0007_auto_20171122_2159'),
    ]

    operations = [
        migrations.RenameField(
            model_name='markusertask',
            old_name='assigned_task',
            new_name='task',
        ),
        migrations.RenameField(
            model_name='markusertask',
            old_name='assigned_user',
            new_name='user',
        ),
    ]
