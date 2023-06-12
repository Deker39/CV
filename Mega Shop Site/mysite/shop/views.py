import re
from django.shortcuts import *
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.hashers import make_password
from .models import *
from django.db.models import Q
from django.contrib.auth.models import User
from django.core.mail import send_mail
from django.http import JsonResponse
import datetime

name_menu = ['personal data', 'basket', 'my orders', 'password change', 'exit', 'delete account']
url_menu = ['personal data', 'basket', 'history checkout', 'change password', 'logout', 'delete account']
global personal_list_info
personal_list_info = [[name, url] for name, url in zip(name_menu, url_menu)]


def cart_checkout(request):
    if request.user.is_authenticated:
        user_id = ShopUser.objects.get(email=request.user.username).id
        check_order_t = Order.objects.filter(user_id=user_id, complete=0, total_amount=0).first()
        check_order = Order.objects.filter(user_id=user_id, complete=0).first()
        return True if check_order_t or check_order_t is None and check_order is None else False
    return False


def creat_data_to_list_catalog():
    return CatalogProduct.objects.all()


def index(request):
    product_all = Product.objects.all()
    product_day = ProductsDay.objects.all()
    product_day_info = Product.objects.filter(id__in=product_day.values('product_id')).values_list('title', flat=True)
    product_dat_photo = ProductPhoto.objects.filter(products_id__in=product_day_info.values('id')).values_list('image', flat=True)
    kek1 = list(product_day_info)
    kek2 = list(product_dat_photo)
    prod_day = []

    for x in kek1:
        for y in kek2[kek1.index(x) * 3:kek1.index(x) * 3 + 3]:
            prod_day.append({'title': x, 'image': y})

    context = {
        'title': 'main page',
        'list_catalog': creat_data_to_list_catalog(),
        'list_product': product_all,
        'list_product_day': prod_day,
        'check_order': cart_checkout(request)
    }
    return render(request, 'main_page.html', context=context)


def search_prod(request, search_str):
    search_products = Product.objects.filter(title__icontains=search_str)

    context = {
        'title': 'search product',
        'list_catalog': creat_data_to_list_catalog(),
        'product': search_products,
        'world': search_str,
        'check_order': cart_checkout(request),
    }

    return render(request, 'search_product_page.html', context=context)


def basket(request):

    context = {
        'title': 'basket',
        'personal_list_info': personal_list_info,
        'check_order': cart_checkout(request)
    }

    user_id = ShopUser.objects.get(email=request.user.username).id
    check_order = Order.objects.filter(Q(user_id=user_id) & Q(complete=0)).first()
    if check_order:
        order = check_order
        list_order = OrdersList.objects.filter(order=order)
        if list_order:
            list_product = Product.objects.filter(id__in=list_order.values('product_id'))
            total_amount = sum([i.calculate_item_total() for i in list_order])
            order.total_amount = total_amount
            order.save()
            context['order'] = order
            context['list_order'] = list_order
            context['list_product'] = list_product
            context['checkOrder'] = True
    else:
        context['checkOrder'] = False

    return render(request, 'basket_page.html', context=context)


def delete_prod(request, prod_slug):

    user_id = ShopUser.objects.get(email=request.user.username).id
    check_order = Order.objects.filter(Q(user_id=user_id) & Q(complete=0)).first()
    prod = Product.objects.get(slug=prod_slug)
    del_prod = OrdersList.objects.get(order=check_order, product_id=prod.id)

    if check_order:
        del_prod.delete()
        list_order = OrdersList.objects.filter(order=check_order)
        total_amount = sum([i.calculate_item_total() for i in list_order])
        check_order.total_amount = total_amount
        check_order.save()

    return redirect(basket)


def history_checkout(request):
    user = ShopUser.objects.get(email=request.user.username)
    check_orders = Order.objects.filter(user=user, complete=True)
    old_list = []

    context = {
        'title': 'history checkout',
        'history_orders': check_orders,
        'orders_list': old_list,
        'check_order': cart_checkout(request),

    }

    if check_orders:
        for order in check_orders:
            order_data = {
                'id': order.id,
                'date_order': order.date_order,
                'total_amount': order.total_amount,
                'products': []
            }
            orders_list = OrdersList.objects.filter(order=order)
            for item in orders_list:
                prod = Product.objects.get(id=item.product_id)
                order_data['products'].append(prod)
            old_list.append(order_data)
    else:
        context['purchaseNoHistory'] = True

    return render(request, 'history_checkout_page.html', context=context)


def checkout(request):
    user_shop = ShopUser.objects.get(email=request.user.username)
    order = Order.objects.filter(Q(user_id=user_shop.id) & Q(complete=0)).first()
    if order:
        list_order = OrdersList.objects.filter(order=order)
        list_product = Product.objects.filter(id__in=list_order.values('product_id'))
        if request.method == "POST":
            for prod in list_product:
                prod_key = ProductKey()
                prod_key.order_id = order.id
                prod_key.products_id = prod.id
                prod_key.key = generate_rand_key()
                prod_key.save()
            return redirect(successful)

        context = {
            'title': 'checkout',
            'user': user_shop,
            'order': order,
            'list_product': list_product,


        }
        return render(request, 'checkout _page.html', context=context)
    else:
        return redirect(basket)


def list_catalog(request, cat_slug):
    catalog = creat_data_to_list_catalog()
    product_cat = Product.objects.filter(catalog_id=catalog.get(slug=cat_slug))
    context = {
        'title': f'list catalog {catalog.get(slug=cat_slug)}',
        'list_catalog': catalog,
        'product': product_cat,
        'check_order': cart_checkout(request)
    }
    return render(request, "catalog_product.html", context)


def product(request, cat_slug, prod_slug):

    catalog = creat_data_to_list_catalog()
    cat_product = CatalogProduct.objects.filter(slug=cat_slug).first()
    product_cat = Product.objects.filter(slug=prod_slug).first()
    product_photo = ProductPhoto.objects.filter(products_id=product_cat.id)
    product_info = ProductSystemRequirement.objects.filter(products_id=product_cat.id).first()
    also_product_cat = Product.objects.filter(catalog_id=catalog.get(slug=cat_slug)).exclude(slug=prod_slug)
    comments = CommentProduct.objects.filter(product_id=product_cat.id)
    authors = ShopUser.objects.all()

    if request.method == 'POST' and 'commentInput' in request.POST:
        new_comment = CommentProduct()
        new_comment.auth_id = ShopUser.objects.get(email=request.user.username).id
        new_comment.product_id = Product.objects.get(slug=prod_slug).id
        new_comment.content = request.POST.get('commentInput')
        False if new_comment.content == '' or new_comment.content == ' ' else new_comment.save()

    if request.method == 'POST' and 'product_id' in request.POST:
        user_id = ShopUser.objects.get(email=request.user.username).id
        check_order = Order.objects.filter(Q(user_id=user_id) & Q(complete=0)).first()

        if check_order:
            order = check_order
        else:
            order = Order()

        order.complete = False
        order.user_id = user_id
        order.save()
        product_id = request.POST.get('product_id')
        order_list = OrdersList()
        order_list.product_id = product_id
        order_list.order_id = order.id
        order_list.save()

        list_order = OrdersList.objects.filter(order=order)
        if list_order:
            total_amount = sum([i.calculate_item_total() for i in list_order])
            order.total_amount = total_amount
            order.save()

        return redirect('product', cat_slug=cat_slug, prod_slug=prod_slug)


    context = {
        'title': f'product {product_cat.title}',
        'list_catalog': catalog,
        'product': product_cat,
        'product_photo': product_photo,
        'product_info': product_info,
        'cat_product': cat_product,
        'comments': comments,
        'authors': authors,
        'also_product_cat': also_product_cat,
        'check_order': cart_checkout(request)

    }
    return render(request, "product_page.html", context)


def signin(request):
    context = {
        'title': 'sign in',
    }
    if request.user.is_authenticated:
        return redirect('/')
    else:
        if request.method == "POST":
            log_user = ShopUser()
            log_user.email = request.POST.get('emailAddressInput')
            log_user.password = request.POST.get('passwordInput')

            user = authenticate(username=log_user.email, password=log_user.password)
            if user is not None:
                login(request, user)
                context['user'] = False
                return redirect('index')
            else:
                if not ShopUser.objects.filter(email=log_user.email):
                    context['emailNotExists'] = f'{log_user.email}'
                else:
                    context['emailForNotCorrectPass'] = log_user.email

    return render(request, 'entrance_page.html', context=context)


def register(request):
    context = {
        'title': 'sign up',
    }

    if request.method == "POST":
        new_user = ShopUser()
        new_user.first_name = request.POST.get('firstNameInput')
        new_user.last_name = request.POST.get('lastNameInput')
        new_user.email = request.POST.get('emailAddressInput')
        new_user.password = request.POST.get('passwordInput')
        new_user.phone = request.POST.get('phoneInput')
        check_user = User.objects.filter(username=new_user.email)

        if check_user:
            context['emailToExists'] = f'{new_user.email}'
            return render(request, 'entrance_page.html', context=context)
        else:
            user = User.objects.create_user(username=new_user.email, password=new_user.password, email=new_user.email)
            user.save()
            new_user.save()
            login(request, user)
            return redirect('index', )

    return render(request, 'entrance_page.html', context=context)


def signout(request):
    context = {
        'title': 'sign out',
    }
    logout(request)
    return render(request, "status_page.html", context=context)


def delete_account(request):
    context = {
        'title': 'delete',
    }

    if request.user.is_authenticated:
        user_del = ShopUser.objects.get(email=request.user.email)
        user = User.objects.get(email=request.user.email)
        context['userDel'] = user_del
        user_del.delete()
        user.delete()

    return render(request, "status_page.html", context=context)


def successful(request):
    user = ShopUser.objects.get(email=request.user.username)
    order = Order.objects.filter(user_id=user.id, complete=False).last()
    list_order = OrdersList.objects.filter(order=order)
    prod_keys = ProductKey.objects.filter(order=order, products__in=list_order.values('product_id'))
    list_product = Product.objects.filter(id__in=list_order.values('product_id'))
    order.complete = True
    order.save()
    list_game_key = [[prod.title, prod_key.key] for prod, prod_key in zip(list_product, prod_keys)]
    split_lines = [f'Game: {prod.title} - > key: {prod_key.key}' for prod, prod_key in zip(list_product, prod_keys)]
    send_mail('Buy a game', split_lines[0], 'bigtigerlesha@gmail.com', (user.email,), fail_silently=False)
    context = {
        'title': 'successful',
        'list_game_key': list_game_key,
        'check_order': cart_checkout(request)
    }
    return render(request, "status_page.html", context=context)


def personal_info(request):
    context = {
        'personal_list': personal_list_info,
        'check_order': cart_checkout(request)

    }
    return render(request, 'personal_info_menu.html', context=context)


def change_personal_data(request):
    user = ShopUser.objects.get(email=request.user.username)
    if request.method == "POST":
        user.first_name = request.POST.get('firstNameInput')
        user.last_name = request.POST.get('lastNameInput')
        user.email = request.POST.get('emailInput')
        user.phone = request.POST.get('phoneInput')
        user.save()

    context = {
        'title': 'personal data',
        'user': user,
        'personal_list_info': personal_list_info,
        'check_order': cart_checkout(request)
    }
    return render(request, "personal_page.html", context=context)


def change_password(request):
    user_shop = ShopUser.objects.get(email=request.user.username)
    user = User.objects.get(username=request.user.username)
    if request.method == "POST":
        user_shop.password = request.POST.get('passwordInput')
        user.password = make_password(user_shop.password)
        user_shop.save()
        user.save()

        return redirect(successful_change_password)
    context = {
        'title': 'change password',
        'old_pass': user_shop.password,
        'check_order': cart_checkout(request)
    }
    return render(request, "entrance_page.html", context=context)


def successful_change_password(request):
    context = {
        'title': 'successful change password',
    }
    return render(request, "status_page.html", context=context)
