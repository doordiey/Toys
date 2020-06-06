<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新设备信息导入</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stat = null;
    Integer res = 0;
    Integer type = 0;
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
    type = Integer.parseInt(request.getParameter("rank"));
    if(conn!=null){
        PreparedStatement ps = conn.prepareStatement("insert into pc(pc_rank) value(?)");
        ps.setInt(1,type);
        res = ps.executeUpdate();
    }
    if(res==1){
        %>
            <script>
                alert("添加设备成功");
                window.location.href='pc.jsp';
            </script>
<%
    }else{
%>
     <script>
         alert("设备添加失败，请重试");
         window.location.href = 'addpc.jsp';
     </script>
<%
    }
    conn.close();
%>
</body>
</html>
