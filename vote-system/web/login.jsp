<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<script>
    function create() {
        window.location.href = "create.jsp";
    }
    function refresh() {
        Form.imgValidate.src = "validate.jsp?id="+Math.random();
    }
</script>
<body background="picture/back.jpg" style="background-size: cover;background-attachment: fixed;background-color: #cccccc">
<form name="Form" action="/login" method="post" >
    <table border="1" align="center" style="border-collapse: collapse;margin: 20% 0 0 45%; background-color: #ffffff" style="opacity: 0">
        <tr>
            <td colspan="2">投票系统登陆</td>
        </tr>
        <tr>
            <td>账号</td>
            <td><input type="text" name="user" style="border-radius: 3px"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" style="border-radius: 3px"></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td><input type="text" name="code" size="10"><img border="0" src="validate.jsp" onclick="refresh()"></td>
        </tr>
        <tr>
            <td></td>
            <td align="center">
                <input type="submit" value="登陆" style="border-radius: 3px;width: 40px">
                <input type="button" value="注册" style="border-radius: 3px;width: 40px" onclick="create()">
            </td>
        </tr>
    </table>
</form>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
