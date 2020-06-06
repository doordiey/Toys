<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection conn = null;
    Integer res = 0;
    String cont = null;
    String send = null;
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
    cont = request.getParameter("content");
    send = session.getAttribute("user").toString();
    Date dt = new Date();
    SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    if(conn!=null){
        PreparedStatement ps = conn.prepareStatement("insert into task(content,send,sendtime) values(?,?,?)");
        ps.setString(1,cont);
        ps.setString(2,send);
        ps.setString(3,ft.format(dt));
        res = ps.executeUpdate();
    }
    if(res==1){
%>
<script>
    alert("发布任务成功");
    window.location.href='sendtask.jsp';
</script>
<%
}else{
%>
<script>
    alert("任务发布失败，请重试");
    window.location.href = 'sendtask.jsp';
</script>
<%
    }
    conn.close();
%>
</body>
</html>
