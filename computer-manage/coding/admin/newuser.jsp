<%@ page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加信息处理中</title>
</head>
<body>
<%
    String account = request.getParameter("account");
    String pasw = request.getParameter("password");
    Integer who = Integer.parseInt(request.getParameter("type"));
    Connection conn = null;
    Statement stat = null;
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
            PreparedStatement prep = conn.prepareStatement("insert into user(user,password,who) values (?,?,?)");
            prep.setString(1, account);
            prep.setString(2, pasw);
            prep.setInt(3, who);
            res = prep.executeUpdate();
            if(who==2){
            String dirName = "D:\\IdeaPrograms\\workwork\\web\\wb\\study\\homework\\" + account;
            File dir = new File(dirName);
            if (dir.mkdir()) {
                System.out.println("创建目录" + dirName + "成功！");
            }else{
                System.out.println("创建目录"+dirName +"失败！");
            }
            }
        %>
            <script>
                    alert('用户添加成功。');
            window.location.href = "Register.jsp";
            </script>
        <%
        }else{
            %>
            <script>
                alert('用户已存在，无法添加。');
                window.location.href="Register.jsp";
            </script>
<%
        }
    }
    conn.close();
%>
</body>
</html>
