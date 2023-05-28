from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),


    path('successful/', views.successful, name='successful'),
    path('successful change password/', views.successful_change_password, name='successful change password'),
    path('delete account/', views.delete_account, name='delete account'),
    path('personal page/', views.personal_info, name='personal page'),
    path("personal data/", views.change_personal_data, name="personal data"),
    path("change password/", views.change_password, name="change password"),
    path('checkout/', views.checkout, name='checkout'),
    path('basket/', views.basket, name='basket'),
    path('basket/<slug:prod_slug>', views.delete_prod, name='delete prod'),
    path("register/", views.register, name="register"),
    path("login/", views.signin, name="login"),
    path("logout/", views.signout, name="logout"),
    # path('<slug:search_str>', views.search_prod, name='search prod'),
    path('search prod/<str:search_str>', views.search_prod, name='search prod'),
    path('<slug:cat_slug>/', views.list_catalog, name='list catalog'),
    path('<slug:cat_slug>/<slug:prod_slug>', views.product, name='product'),


]