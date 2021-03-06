# Generated by Django 4.0.4 on 2022-05-28 14:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('catalog', '0002_alter_news_author_delete_author'),
    ]

    operations = [
        migrations.AddField(
            model_name='news',
            name='image',
            field=models.ImageField(blank=True, default='default.gif', upload_to='news'),
        ),
        migrations.AddField(
            model_name='tags',
            name='image',
            field=models.ImageField(blank=True, default='default.gif', upload_to='tags'),
        ),
        migrations.AlterField(
            model_name='news',
            name='time',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
