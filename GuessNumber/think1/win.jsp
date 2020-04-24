<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String user = null;
    if(session.getAttribute("user")!=null){
        user = session.getAttribute("user").toString();
        System.out.println(user);
    }
    Connection conn = null;
    Statement stat = null;
    Integer res = 0;
    String s = null;
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
                "set score=score+?,winnumber=winnumber+1," +
                "playnumber=playnumber+1 where nickname=?");
        Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        if(cookies!=null){
            for(int i=0;i<cookies.length;i++){
                cookie = cookies[i];
                if(cookie.getName().equals("score")){
                    prep.setString(1,cookie.getValue());
                }
            }
        }
        prep.setString(2,user);
        res = prep.executeUpdate();
    }
    response.sendRedirect("./play.jsp");
%>

</body>
</html>
