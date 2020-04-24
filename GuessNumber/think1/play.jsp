<%@ page import="java.util.Random" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>猜猜那个数</title>
</head>
<body bgcolor="#a9a9a9">
<%
    if(session.getAttribute("login-status") == null){
        %>
        <script>alert("抱歉你没有权力来猜，请先登陆游戏")</script>
<%
        response.sendRedirect("./login.jsp");
    }
    String user = null;
    if(session.getAttribute("user")!=null){
        user = session.getAttribute("user").toString();
    }
%>
<div>
    <marquee behavior="scroll" direction="right">
        游戏随机产生一个0-50之间的整数，若6次以内猜出来则胜利，否则就算游戏失败。
    </marquee>
    <table align="center">
        <tr>
            <td colspan="2">
                积分规则：猜对加1分，不然不计分。
            </td>
        </tr>
        <form name="My">
        <tr>
            <td>你觉得会是多少呢？</td>
            <td><input name="gue"></td>
        </tr>
        <tr>
            <td colspan="2"><button type="button" onclick="guess()">蒙一下</button></td>
        </tr>
            <tr>
                <td colspan="2"><a href="rank.jsp">排行榜</a></td>
            </tr>
        </form>
    </table>
</div>
<script>
    var x = 34;
    var guesstimes = 0;
    var user = "<%=user%>";
    function guess() {
    var it;
    it = document.forms['My']['gue'].value;
    if (guesstimes<6) {
        if (it == x) {
            var fen = 6 - guesstimes;
            document.cookie="score="+fen;
            alert("恭喜你猜对了，本次得分"+(String)(fen));
            window.location.href="./win.jsp";
        } else {
            guesstimes += 1;
            if (it > x) {
                alert(user+"用户你猜的数太大了");
            } else {
                alert(user+"用户你猜得数太小了");
            }
        }
    }
    else{
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
        conn = DriverManager.getConnection("jdbc:odbc:what","root",,yourpassword);
        }catch (SQLException e){
        e.printStackTrace();
        }
        if(conn!=null){
            PreparedStatement prep = conn.prepareStatement("update player " +
             "set playnumber=playnumber+1 " +
              "where nickname=?");
            prep.setString(1,user);
            prep.executeUpdate();
        }
        %>
        if(confirm("游戏失败,是否重新开始游戏？")) {
            restart();
        }else {
            alert("游戏结束");
        }
    }
}
    function restart() {
        x = Math.floor(Math.random()*51);
        guesstimes = 0;
    }
</script>
</body>
</html>
