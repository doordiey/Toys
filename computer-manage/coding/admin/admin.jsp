<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
      <title>主页面</title>
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
  <div id="pc" style="position: relative;left: 35%;width: 30%">
    <table style="width: 100%">
      <tr>
          <td>电脑编号</td>
          <td>使用状态</td>
          <td>占用者</td>
      </tr>
      <%
          Connection conn = null;
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
              PreparedStatement prep = conn.prepareStatement("select * from pc");
              res = prep.executeQuery();
              if(res!=null){
                  while(res.next()){
                      Integer pc = res.getInt("id");
                      Integer status = res.getInt("status");
                      String user = res.getString("belong");
                      %>
                        <tr>
                            <td><%=pc%></td>
                            <td><%=status%></td>
                            <td><%=user%></td>
                        </tr>
      <%
                  }
              }
          }
          conn.close();
      %>
  </table>
  </div>
  <div id="footer" >
      coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
  </div>
  </body>

</html>

