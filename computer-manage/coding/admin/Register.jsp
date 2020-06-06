<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息导入</title>
    <link rel="stylesheet" type="text/css" href="../css/functionbar.css">
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body>
<script>
    function ret() {
        window.location.href = "user.jsp";
    }
</script>
    <ul class="shape">
        <li  style="width: 25%;"><a href="admin.jsp">主页面</a></li>
        <li  style="width: 25%;"><a href="user.jsp" >用户信息管理</a></li>
        <li  style="width: 25%;"><a href="pc.jsp">电脑信息管理</a></li>
        <li  style="width: 25%;"><a href="../login/login.jsp">退出系统</a> </li>
    </ul>
    <div id="center" style="position:relative;left:30% ; width:40%;" >
        <form action="newuser.jsp" method="post" style="background:#FFE4E1;width:400px;" align="center">
            <br>
            <h4>请输入新用户信息</h4> <br>
            <h3>输入用户名：</h3>
            <input type="text" name="account">
            <h3>输入用户类型：</h3>
            <input type="radio" name="type" value="2">学生
            <input type="radio" name="type" value="3">老师
            <input type="radio" name="type" value="1">管理员<br>
            <br>
            <h3>设置密码：</h3>
            <input type="text" name="password"><br><br>
            <input type="submit" value="确认" style="width:50px;font-weight:bold;">
            <input type="button" onclick="ret()" value="返回" style="width: 50px;font-weight: bold;">
            <br><br>
        </form>
    </div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
