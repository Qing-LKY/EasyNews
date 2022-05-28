"""EasyNews URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic import RedirectView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    # 把带有 catalog/ 的请求转发到模块 /catalog/urls.py
    path('catalog/', include('catalog.urls')),
    # 将根 URL 重定向到 /catalog
    path('', RedirectView.as_view(url='/catalog/')),
]

# Use static() to add url mapping to serve static files during development (only)
# 开启静态文件服务
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
# 开启媒体文件服务
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

#Add Django site authentication urls (for login, logout, password management)
urlpatterns += [
    path('accounts/', include('django.contrib.auth.urls')),
]