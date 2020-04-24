<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>猜数字游戏排行榜</title>
</head>
<body>
<table>
    <tr>
        <td>用户</td>
        <td>分数</td>
        <td>游戏局数</td>
        <td>胜利局数</td>
    </tr>
<%
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
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
    if(conn!=null){
        request.setCharacterEncoding("utf-8");
        try {
            stat = conn.createStatement();
            String sql = "select * from player order by score DESC";
            res = stat.executeQuery(sql);
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    if (res==null){
        out.print("暂无记录，快来挑战");
    }else{
    while(res.next()){
        out.print("<tr>");
        String nickname = res.getString("nickname");
        Integer score = res.getInt("score");
        Integer playnumber = res.getInt("playnumber")/3;
        Integer winnumber = res.getInt("winnumber");
        out.print("<td>"+nickname+"</td>");
        out.print("<td>"+score+"</td>");
        out.print("<td>"+playnumber+"</td>");
        out.print("<td>"+playnumber+"</td>");
    }
    }
%>
    <tr>
        <td colspan="2"><a href="login.jsp">返回登陆界面</a></td>
    </tr>
</table>
</body>
</html>
