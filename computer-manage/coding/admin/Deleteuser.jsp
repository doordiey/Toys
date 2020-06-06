<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除用户信息</title>
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
<form action="deletesty.jsp" method="post" style="position: relative;left: 35%;width: 40%">
    输入你要删除的用户名：<input type="text" name="account">
    <input type="submit" value="确认" style="width:50px;">
    <input type="button" value="返回" style="width: 50px" onclick="window.location.href = 'user.jsp';">
</form>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
