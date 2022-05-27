from django.contrib import admin
from .models import News, Author, Kind, Tags

# Register your models here.

# 新添加的模型需要在这里注册到管理系统里
# 这里可以定义自己的管理界面 不过又不用验收这个 谁管他妈的

admin.site.register(News)
admin.site.register(Author)
admin.site.register(Kind)
admin.site.register(Tags)