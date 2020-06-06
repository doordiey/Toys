<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息管理</title>
    <link rel="stylesheet" type="text/css" href="../css/functionbar.css">
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body>
<ul class="shape">
    <li  style="width: 25%;"><a href="admin.jsp">主页面</a></li>
    <li  style="width: 25%;"><a href="user.jsp" >用户信息管理</a></li>
    <li  style="width: 25%;"><a href="pc.jsp">电脑信息管理</a></li>
    <li  style="width: 25%;"><a href="../login/login.jsp">退出系统</a> </li>
</ul>
<div id="center" style="position:relative;left:30% ; width:40%;" >
    <form action="newpc.jsp" method="post" style="background:#FFE4E1;width:400px;" align="center">
        <br>
        <h4>请输入新设备信息</h4> <br>
        <h3>输入设备类型：</h3>
        <input type="radio" name="rank" value="2">高级配置
        <input type="radio" name="rank" value="3">中等配置
        <input type="radio" name="rank" value="1">低配置<br>
        <br>
        <input type="submit" value="确认" style="width:50px;font-weight:bold;">
        <input type="button" onclick="window.location.href='pc.jsp';" value="返回" style="width: 50px;font-weight: bold;">
        <br><br>
    </form>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
