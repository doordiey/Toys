<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除设备中</title>
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
        String that = request.getParameter("pc");
        if(conn!=null) {
            PreparedStatement prep = conn.prepareStatement("delete from pc where id=?");
            prep.setString(1, that);
            res = prep.executeUpdate();
        }
        if(res==0){
            %>
        <script>
            alert("删除失败，设备编号不存在");
            window.location.href = "deletepc.jsp";
        </script>
<%
        }else{
            %>
        <script>
            alert("删除成功");
            window.location.href = "deletepc.jsp";
        </script>
<%
        }
%>
</body>
</html>
