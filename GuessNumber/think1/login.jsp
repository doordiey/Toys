<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>猜数字游戏登陆界面</title>
</head>
<body background="other/number.jpg" style="width: 838px;">
<div style="border-radius: 3px;position: relative;left: 50%;top: 50%;">
    <table style="background-color: skyblue;">
        <form method="post" action="">
            <tr>
                <td colspan="2">用户登陆</td>
            </tr>
            <tr>
                <td>用户:</td>
                <td><input type="text" name="nickname"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="确认" style="width: 200px"></td>
            </tr>
            <tr>
                <td colspan="2"><a href="rank.jsp">排行榜</a></td>
            </tr>
        </form>
    </table>
</div>
<%
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
    int ress = 0;
    try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    }catch (ClassNotFoundException e){
    e.printStackTrace();
    }
    try{
    conn = DriverManager.getConnection("jdbc:odbc:what","root",yourpassword);
    }catch (SQLException e){
    e.printStackTrace();
    }
    if(conn!=null&&request.getParameter("nickname")!=null){
        request.setCharacterEncoding("utf-8");
        try {
            PreparedStatement prep = conn.prepareStatement("select * from player where nickname=?");
            prep.setString(1, request.getParameter("nickname"));
            res = prep.executeQuery();
        }catch (SQLException e){
            e.printStackTrace();
        }
        if (res.next()){
            String name = res.getString("nickname");
        }else{
            try {
                PreparedStatement prep = conn.prepareStatement("insert into player(nickname) values(?)");
                prep.setString(1, request.getParameter("nickname"));
                ress = prep.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
%>
<%
    if(request.getParameter("nickname")!=null){
        session.setAttribute("login-status",1);
        session.setAttribute("user",request.getParameter("nickname"));
    %>
    <jsp:forward page="play.jsp"></jsp:forward>
<%
    }
%>
</body>
</html>
