# redis 配置

- [下载链接](https://github.com/tporadowski/redis/releases)

## 步骤

- 打开cmd窗口，启动服务，进入redis文件内，输入如下：

  ` redis-server.exe redis.windows.conf`

- 启动了就显示一个redis的图标了

- 别关了，然后再打开一个cmd，运行如下：

  ` redis-cli.exe -h 127.0.0.1 -p 6379`

- python连接

  ```python
  import redis
  
  conn = redis.Redis()
  ```

  