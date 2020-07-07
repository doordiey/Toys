# python-redis

- 使用python操作redis
- 安装redis及启动（windows环境)
- 代码见coding内

## 一些实现

- vote-redis.py    实现投票：简单的进行交互



## 一些问题

### zadd函数

- python 的 zadd函数，若redis的版本>3后，调用该方法要传参的时候要用mapping形式，改写如下

原格式：

``` python
conn.zadd('score:',"article:1",89.0)
```

改变后：

```python
mapping = {
    "article:" : 89.0
}
conn.zadd('score:', mapping)
```

具体原因：

- 查看源码zadd函数

