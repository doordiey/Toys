<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出</title>
</head>
<body>
    <%
        Connection conn = null;
        Integer res = 0;

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
        PreparedStatement ps = conn.prepareStatement("update pc_info set logout=? where user_id=? and logout is NULL and pc_id=?");
        Date ndate = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        ps.setString(1,df.format(ndate));
        ps.setString(2,session.getAttribute("user").toString());
        ps.setInt(3,Integer.parseInt(session.getAttribute("pc").toString()));
        res = ps.executeUpdate();
        PreparedStatement ps1 = conn.prepareStatement("update pc set status=0,belong=null where id=?");
        ps1.setInt(1,Integer.parseInt(session.getAttribute("pc").toString()));
        ps1.executeUpdate();
        response.sendRedirect("../login/login.jsp");
    %>

</body>
</html>
