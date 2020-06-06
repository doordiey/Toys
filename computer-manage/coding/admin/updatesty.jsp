<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户处理中</title>
</head>
<body>
<%
    String account = request.getParameter("account");
    String pasw = request.getParameter("password");
    Integer who = Integer.parseInt(request.getParameter("type"));
    Connection conn = null;
    Integer res = 0;
    ResultSet resn = null;
    Integer num = 0;
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
    if(conn!=null) {
        PreparedStatement pre = conn.prepareStatement("select * from user where user=?");
        pre.setString(1, account);
        resn = pre.executeQuery();
        if (resn != null) {
            while (resn.next()) {
                num += 1;
            }
        }
        if (num == 0) {
    %>
    <script>
        alert('该用户不存在，已为您跳转至创建用户界面');
        window.location.href = "Register.jsp";
    </script>
    <%
}else{
            PreparedStatement ps1 = conn.prepareStatement("update user set password=?,who=? where user=?");
            ps1.setString(1,pasw);
            ps1.setInt(2,who);
            ps1.setString(3,account);
            res = ps1.executeUpdate();
%>
<script>
    alert('用户信息更新完毕');
    window.location.href="user.jsp";
</script>
<%
        }
    }
    conn.close();
%>
</body>
</html>
