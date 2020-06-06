<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设备最近使用记录</title>
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
<div style="position:relative;left: 30%;width: 40%">
    <h1>设备使用记录部分显示</h1>
    <table>
        <tr>
            <td>
                <a href="used.jsp"><img src="../picture/refresh.png" style="width: 32px;height: 32px;" title="刷新"></a>
            </td>
            <td>
                <a href="findbyuser.jsp"><img src="../picture/findbyuser.png" style="width: 32px;height: 32px" title="按使用者查询"></a>
            </td>

            <td>

            </td>
            <td>

            </td>
        </tr>
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
    if(conn!=null){
        PreparedStatement ps = conn.prepareStatement("select * from pc_info order by id desc limit 15");
        res = ps.executeQuery();
        if(res!=null){
            while(res.next()){
                that = res.getString("pc_id");
                login = res.getString("login");
                logout = res.getString("logout");
                user = res.getString("user_id");
                %>
        <tr>
            <td><%=that%></td>
            <td><%=login%></td>
            <td><%=logout%></td>
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
