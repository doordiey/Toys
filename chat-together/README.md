# 在线聊天系统

## 大概介绍

- 就是一个在线聊天平台。

## 不足

- 很丑
- 数据库连接部分conn的反复定义可以考虑代码进一步精简化
- 还有很多待发现待改进的地方

## 主要文件说明

### 显示界面：

#### Chatrooms.jsp

聊天室广场界面

#### Chatting.jsp

聊天室内部界面

#### Create.jsp

用户注册界面

#### Createroom.jsp

聊天室创建界面

#### Login.jsp

登陆界面

#### Valiidate.jsp

随机生成验证码图片

 

### Servlet：

#### attendServlet

:对用户参与聊天室进行处理

#### createroomServlet

:创建聊天室内部逻辑

#### createServlet

:用户注册内部逻辑

#### exitServlet

:用户退出聊天室内部逻辑

#### loginServlet

:用户登陆和验证码验证逻辑

#### speakingServlet

:用户聊天室发言内部逻辑

 

### filter:

#### attendfilter

参与聊天室的人数检查，不会超过限制的跳转到用户参与聊天室内部逻辑，不然就跳转到聊天室广场界面

#### encodeingfilter

对所有文件统一编码

#### loginfilter

登陆保护，未登陆者无法访问内部文件

 

### DAO：

#### Userdao

用户相关数据库操作，包括用户登陆、注册

#### Chatdao

聊天相关数据库操作，包括用户发言，上线提醒，下线提醒,聊天内容查询

#### ChatroomDao

聊天室相关数据库操作，包括查看所有聊天室信息，查看指定聊天室指定信息，创建聊天室。

### VO：

#### chatVo

聊天相关数据

#### userVo

用户相关数据

#### chartroomvo

聊天室相关数据

 

### sql:

#### chatter.sql

表chatter创建脚本

#### chatting.sql

表chatting创建脚本

#### chatterroom.sql

表chatterroom创建脚本