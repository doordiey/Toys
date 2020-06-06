<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>My JSP 'check.jsp' starting page</title>
  </head>
  
  <body>
<%
    String password = request.getParameter("psd");
    String user = request.getParameter("user");
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
    String s = null;
    Integer that = -2;
    try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }catch (SQLException e){
        e.printStackTrace();
    }
    if(conn!=null){
        PreparedStatement prep = conn.prepareStatement("select * from user where user=?");
        prep.setString(1,user);
        res = prep.executeQuery();
        if(res!=null){
            while(res.next()) {
                String pasw = res.getString("password");
                Integer who = res.getInt("who");
                System.out.print(pasw==null);

                if (pasw.equals(password)) {
                    System.out.println("who:" + who);
                    that = who;
                }else {
                    that = -1;
                }
            }
        }
    }
    session.setAttribute("login-status",that.toString());
    session.setAttribute("user",user);
    if(that<=0){
        response.sendRedirect("login.jsp");
    }else if(that == 1){
        response.sendRedirect("../admin/admin.jsp");
    }else if(that == 2){
        response.sendRedirect("../student/choosepc.jsp");
    }else {
        response.sendRedirect("../teacher/teacher.jsp");
    }
    conn.close();
%>
  </body>
</html>
