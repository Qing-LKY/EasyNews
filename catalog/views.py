from django.shortcuts import render
from .models import News, Kind, Tags
from django.contrib.auth.decorators import login_required
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.utils.translation import gettext_lazy as _
from django.core.exceptions import ValidationError
from django.db.models import F, Q
# from .models import Author
# Create your views here.
# 这个函数是给首页提供支持的

def index(request):
    # 这里是用来获取你希望在首页上显示的内容
    news = News.objects.all().order_by('-time')
    if news.count() != 0:
        top_news = news[0]
    else:
        top_news = None
    # 返回的这个 context 是个字典（变量集） 写 html 的时候会用里面的东西
    return render(
        request,
        'index.html',
        context={'top_news': top_news},
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

def tags(request):
    tags_list = Tags.objects.all().order_by('name')
    num_tags = tags_list.count()
    context = {'tags_list': tags_list, 'num_tags': num_tags}
    return render(request, 'tags.html', context=context)

def tags_detail(request, tagId):
    news_list = News.objects.filter(tags__tagId__icontains=tagId)
    tag = Tags.objects.get(tagId=tagId)
    context = {'news_list': news_list, 'tag': tag}
    return render(request, 'tags_detail.html', context=context)

@login_required
def mynews(request):
    # 也可以使用 request.user.is_authenticated
    news_list = News.objects.filter(author=request.user)
    news_cnt = news_list.count()
    context = { 'news_list': news_list, 'news_cnt': news_cnt }
    return render(request, 'my_news.html', context=context)

class NewsCreate(CreateView):
    model = News
    fields = ['title', 'tags', 'kind', 'text', 'image']
    def form_valid(self, form):
        if self.request.user.is_authenticated:
            form.instance.author = self.request.user
        else:
            raise ValidationError(_('Please login first'))
        return super(NewsCreate, self).form_valid(form)

class NewsUpdate(UpdateView):
    model = News
    fields = ['title', 'tags', 'kind', 'text', 'image']
    def form_valid(self, form):
        if self.request.user.is_authenticated:
            if form.instance.author != self.request.user:
                raise ValidationError(_('你只能更新自己的动态哦(⊙o⊙)？'))
        else:
            raise ValidationError(_('没登陆不能发帖的！快加入我们'))
        # form.instance.time = timezone.now
        return super(NewsUpdate, self).form_valid(form)

def search(request):
    s = request.GET.get('s', None)
    if s is None:
        return render(request, 'search.html')
    news_list = News.objects.filter(Q(title__contains=s) | Q(text__contains=s) | Q(kind__name__contains=s) | Q(author__username__contains=s)).distinct()
    context = {
        "news_list": news_list,
        "query": s
    }
    return render(request, 'search.html', context=context)