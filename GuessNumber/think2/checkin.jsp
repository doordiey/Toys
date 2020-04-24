<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>检测昵称</title>
  </head>
  
  <body>
    <div align="center">
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("account");
    ArrayList users=(ArrayList)session.getAttribute("users");
    if(users==null){
    	users=new ArrayList();
    	session.setAttribute("users",users);
    }
    if(username!=null){
			for(int j=0;j<users.size();j++){
     		String user=(String)users.get(j);
     		if(username.equals(user)){
     			out.print("<script type='text/javascript'>alert('用户名重复！');</script>");  %>
			<input type="button" value="重新输入" onClick="location.href='./look/in.jsp'"><br>
<%      return; }
      }

         users.add(username);
		response.sendRedirect("game.jsp");

      
	}

    	
      



%>
  </div>
  </body>
</html>
