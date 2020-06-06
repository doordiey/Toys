<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
      <title>电脑使用情况</title>
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
      <div id="info" style="position:relative;left: 30%;width: 50%">
          <table style="align-content: center">
              <tr>
                  <td colspan="4" style="font-size: x-large" align="center">当前在线电脑情况</td>
              </tr>
              <tr>
                  <td style="width: 10%">
                      <a href="pc.jsp"><img src="../picture/refresh.png" style="width: 32px;height: 32px;" title="刷新"></a>
                  </td>
                  <td style="width: 10%">
                      <a href="addpc.jsp"><img src="../picture/addpc.png" style="height: 32px;width: 32px;" title="添加设备"></a>
                  </td>
                  <td style="width: 10%">
                      <a href="used.jsp"><img src="../picture/useing.png" style="width: 32px;height: 32px;" title="查看使用记录"></a>
                  </td>
                  <td style="width: 10%">
                      <a href="deletepc.jsp"><img src="../picture/deletepc.png" style="width: 32px;height: 32px;" title="删除设备"></a>
                  </td>
              </tr>
              <tr>
                  <td style="width: 10%">电脑编号</td>
                  <td style="width: 10%">占用状态</td>
                  <td style="width: 10%">占用者</td>
                  <td style="width: 20%">上机时间</td>
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
                  PreparedStatement prep = conn.prepareStatement("select * from pc,pc_info where pc.id=pc_info.pc_id and pc.belong=pc_info.user_id and logout is null");
                  res = prep.executeQuery();
                  if(res!=null){
                      while(res.next()) {
                          Integer pc = res.getInt("pc_id");
                          Integer status = res.getInt("status");
                          String belong = res.getString("belong");
                          String login = res.getString("login");
                          out.print("<tr>" +
                           "<td style=\"width: 10%\">" + pc + "</td>" +
                            "<td style=\"width: 10%\">"+ status +"</td>"+
                            "<td style=\"width: 10%\">"+ belong +"</td>"+
                                  "<td style=\"width: 20%\">" + login + "</td>"+
                            "</tr>");
                      }
                  }
              }
              conn.close();
          %>
          <tr>
              <td><a><img ></a></td>
          </tr>
          </table>
      </div>
      <div id="footer" >
          coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
      </div>
  </body>
</html>
