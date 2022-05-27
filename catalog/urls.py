from django.urls import path
from catalog import views

# 这个位置的代码定义的是 url 链接的映射
# 也就是 识别到 '' 内的串后的动作

urlpatterns = [
    # 如果检测到URL模式''，view.py中函数index() 将被调用
    path('', views.index, name='index'),
]
