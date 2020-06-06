<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除中……</title>
</head>
<body>
    <%
        Connection conn = null;
        Integer res = 0;
        String s = null;
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
            PreparedStatement prep = conn.prepareStatement("delete from user where user=?");
            prep.setString(1, that);
            res = prep.executeUpdate();
        }
        if(res==0){
            %>
            <script>
                alert("未找到该用户");
                window.location.href = "Deleteuser.jsp";
            </script>
    <%
        }
        else {
        %>
            <script>
                alert("删除成功");
                window.location.href = "Deleteuser.jsp";
            </script>

    <%
        }
    %>
</body>
</html>
