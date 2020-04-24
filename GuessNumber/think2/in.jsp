<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登陆界面</title>
  </head>
  
  <body>
  <script>
	  document.cookie="score=0";
  </script>
    <form name="Form" action="checkin.jsp" method="post">
    	<table border="1" align="center">
    		<tr>
    			<td>请输入你的昵称：</td>
    			<td><input name="account" type="text" ></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center"><input type="submit" value="登录">
    			<input type="reset" value="清空"></td>
    		</tr>
    	</table>
    
    </form>
  </body>
</html>
