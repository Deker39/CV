# Generated by Django 4.1.4 on 2023-05-17 17:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='CommentProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('content', models.CharField(max_length=100)),
                ('date', models.DateTimeField(auto_now=True)),
                ('auth', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='auth', to='shop.user')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='products', to='shop.product')),
            ],
        ),
    ]
