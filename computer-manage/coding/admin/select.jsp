<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title>你要找的人</title>
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
    <form action="select.jsp" method="post" style="position: relative;left: 35%;width: 40%">
        输入你要查询的用户名：<input type="text" name="account">
        <input type="submit" value="查询" style="width:50px;">
    </form>
    <div style="position:relative;left: 35%;width: 30%">
        <%
            Connection conn = null;
            ResultSet res = null;
            String s = null;
            String type = "查无此人";
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
            String that = request.getParameter("account");
            if(conn!=null) {
                PreparedStatement prep = conn.prepareStatement("select * from user where user=?");
                prep.setString(1, that);
                res = prep.executeQuery();
                if (res != null) {
                    while (res.next()) {
                        Integer who = res.getInt("who");
                        if (who == 1) {
                            type = "管理员";
                        } else {
                            if (who == 2) {
                                type = "学生";
                            } else {
                                type = "老师";
                            }
                        }
                    }
                }
            }
            conn.close();
        %>
        <table>
            <tr>
                <td style="width: 15%">用户账号</td>
                <td style="width: 15%">用户身份</td>
            </tr>
            <tr>
                <td style="width: 15%"><%=that%></td>
                <td style="width: 15%"><%=type%></td>
            </tr>
        </table>
    </div>
    <div id="footer" >
        coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
    </div>
  </body>
</html>
