<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
	<head>
		<title>机房管理系统</title>
        <link rel="stylesheet" type="text/css" href="../css/footer.css">
	</head>
    <% //登陆信息反馈
        Cookie[] cookies = request.getCookies();
        Cookie cookie = null;
        String status;
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                cookie = cookies[i];
                if (cookie.getName().equals("login-status")) {
                    status = cookie.getValue();
                    if (status.equals("-1")) {
                        out.print("<script>alert('密码错误！')</script>");
                    }
                    if (status.equals("-2")) {
                        out.print("<script>alert('用户名不存在!')</script>");
                    }
                }
            }
        }
    %>
    <style type="text/css">
   		input{		
   			border:0px solid #c00;
   		}
    </style></head>
    <body background="../picture/login.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
        <form name="Form" action="check.jsp" method="post" >
          <div class="row" style="padding: 0px 20px">
          </div>
          <table border="1" align="center" style="border-collapse: collapse;margin: 20% 0 0 45%;background-color: #ffffff">
              <tr>
                  <td colspan="2">欢迎登陆本系统</td>
              </tr>
              <tr>
                    <td>账号：</td>
                    <td><input name="user" type="text" style="border-radius: 3px"></td>
                </tr>
                <tr>
                    <td>密码：</td>
                    <td><input name="psd" type="password" style="border-radius: 3px"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="登录" onclick="check()" style="border-radius: 3px;width: 100px"></td>
                </tr>
            </table>
      </form>
        <div id="footer" >
            coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
        </div>    </body>
</html>
