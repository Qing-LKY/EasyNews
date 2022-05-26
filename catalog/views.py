from django.shortcuts import render
from .models import News, Author, Kind, Tags

# Create your views here.

# 这个函数是给首页提供支持的

def index(request):

    # 这里是用来获取你希望在首页上显示的内容
        
    title_news = News.objects.all().__str__()
   
    # 返回的这个 context 是个字典（变量集） 写 html 的时候会用里面的东西

    return render(
        request,
        'index.html',
        context={'test': title_news},
    )

