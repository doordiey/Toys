<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中转一下</title>
</head>
<body>
    <%
    Connection conn = null;
    Statement stat = null;
    Integer res = 0;
    Integer res1 = 0;
    String s = null;
    Integer pc = 0;
    String user = null;
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
    pc = Integer.parseInt(request.getParameter("pc").toString());
    user = session.getAttribute("user").toString();
    session.setAttribute("pc",request.getParameter("pc"));
    System.out.println("pc:"+pc);
    if(conn!=null){
        PreparedStatement ps = conn.prepareStatement("update pc set status=1,belong=? where id=?");
        ps.setString(1,user);
        ps.setInt(2,pc);
        res = ps.executeUpdate();
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        PreparedStatement ps1 = conn.prepareStatement("insert into pc_info(pc_id,login,user_id) values(?,?,?)");
        ps1.setInt(1,pc);
        ps1.setString(2,ft.format(date));
        ps1.setString(3,user);
        session.setAttribute("time",ft.format(date));
        res1 = ps1.executeUpdate();
    }
    if(res==1){
        response.sendRedirect("../student/normal.jsp");
        %>
        <%--<jsp:forward page="../student/normal.jsp"></jsp:forward>--%>
    <%
    }else{
        response.sendRedirect("../student/choosepc.jsp");
    %>
        <%--<jsp:forward page="../student/choosepc.jsp"></jsp:forward>--%>
    <%
        }
    %>
</body>
</html>
