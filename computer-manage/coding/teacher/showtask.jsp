<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务清单</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<div class="center" style="width: 60%;position: relative;top: 20%;left: 20%;">
    <table style="background:#ffffff;width: 100%">
        <form action="sending.jsp" method="post"  align="center">
            <tr>
                <td width="30%"><h1>任务清单</h1></td>
                <td width="20%"></td>
                <td width="10%"><a href="teacher.jsp" title="关闭"><img src="../picture/return1.png" style="width: 32px;height: 32px;"></a></td>
            </tr>
            <tr>
                <td width="30%">任务内容</td>
                <td width="20%">任务发布时间</td>
                <td width="10%">任务发布者</td>
            </tr>
            <%
                Connection conn = null;
                ResultSet res = null;
                String s = null;
                Integer that = -2;
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
                if(conn!=null){
                    PreparedStatement prep = conn.prepareStatement("select * from task");
                    res = prep.executeQuery();
                    if(res!=null){
                        while(res.next()) {
                            String content = res.getString("content");
                            String send = res.getString("send");
                            String sendt = res.getString("sendtime");
            %>
                            <tr>
                                <td width="30%"><%=content%></td>
                                <td width="20%"><%=sendt%></td>
                                <td width="10%"><%=send%></td>
                            </tr>
            <%
                }
                }
                }
                conn.close();
            %>
        </form>
    </table>

</div>
<div class="user_info"  style="bottom: 0;line-height: 30px;position: fixed;">
    <a href="../login/login.jsp" ><img src="../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
    <a onclick=""><img src="../picture/students.png" style="margin-left:20px;height: 32px;width: 32px" title="查看学生上交作业情况"></a>
    <a onclick=""><img src="../picture/sendtask.png" style="margin-left:20px;height: 32px;width: 32px" title="发布任务"></a>
    <a onclick=""><img src="../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="查看当前任务"></a>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
