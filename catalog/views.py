from django.shortcuts import render
from .models import News, Author, Kind, Tags

# Create your views here.

# 这个函数是给首页提供支持的

def index(request):

    # 这里是用来获取你希望在首页上显示的内容
        
    news = News.objects.all()
    top_news = '这里什么都没有'
    if news.count() != 0:
        top_news = news[0].title
   
    # 返回的这个 context 是个字典（变量集） 写 html 的时候会用里面的东西

    return render(
        request,
        'index.html',
        context={'test': top_news},
    )

# 使用 generic 也行，但感觉有点意义不明
# from django.views import generic

def news(request):
    news_list = News.objects.all()
    context = {'news_list': news_list}
    return render(request, 'news.html', context)

def news_detail(request, newsId):
    news = News.objects.get(newsId=newsId)
    return render(request, 'news_detail.html', context={'news': news})


