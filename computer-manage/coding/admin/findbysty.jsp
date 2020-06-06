<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询指定用户的使用</title>
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
<form action="findbysty.jsp" method="post" style="position: relative;left: 35%;width: 40%">
    输入你要查找的用户名：<input type="text" name="account">
    <input type="submit" value="确认" style="width:50px;">
    <input type="button" value="返回" style="width: 50px" onclick="window.location.href = 'used.jsp';">
</form>
<div style="position:relative;left: 25%;width: 50%">
    <h1>使用情况如下</h1>
    <table>
        <tr>
            <td style="width: 10%">设备编号</td>
            <td style="width: 15%">登陆时间</td>
            <td style="width: 15%">登出时间</td>
            <td style="width:10% ">使用者账号</td>
        </tr>
        <%
            Connection conn = null;
            ResultSet res = null;
            String that = null;
            String login = null;
            String logout = null;
            String user = null;
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
            user = request.getParameter("account");
            if(conn!=null){
                PreparedStatement ps = conn.prepareStatement("select * from pc_info where user_id=? ");
                ps.setString(1,user);
                res = ps.executeQuery();
                if(res!=null){
                    while(res.next()){
                        that = res.getString("pc_id");
                        login = res.getString("login");
                        logout = res.getString("logout");
                        user = res.getString("user_id");
        %>
        <tr>
            <td style="width: 10%"><%=that%></td>
            <td style="width: 15%"><%=login%></td>
            <td style="width: 15%"><%=logout%></td>
            <td style="width: 10%"><%=user%></td>
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
