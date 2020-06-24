<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body background="picture/logind.jpg" style="background-size: cover;background-attachment: fixed;background-color: #cccccc">
<form name="Form" action="/create" method="post">
    <table border="1" align="center" style="border-collapse: collapse;margin: 20% 0 0 45%; background-color: #ffffff">
        <tr>
            <td colspan="2">新用户信息录入</td>
        </tr>
        <tr>
            <td>账号</td>
            <td><input type="text" name="client" style="border-radius: 3px"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="password" name="password" style="border-radius: 3px"></td>
        </tr>
        <tr>
            <td>昵称</td>
            <td><input type="text" name="nickname" style="border-radius: 3px"></td>
        </tr>
        <tr>
            <td></td>
            <td align="center">
                <input type="submit" value="确认" style="border-radius: 3px;width: 40px">
                <input type="reset" value="重置表单" style="border-radius: 3px;width: 80px">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
