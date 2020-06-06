<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看任务清单中</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<script>
    function showinfo() {
        var user = "<%=session.getAttribute("user").toString()%>";
        var pc = "<%=session.getAttribute("pc").toString()%>";
        var time = "<%=session.getAttribute("time").toString()%>";
        var date = new Date(time);
        var now = new Date();
        var show = Math.round((now.getTime()-date.getTime() - 12*60*60*1000)/1000);
        if(show>60){
            show = Math.round(show/60);
            alert("用户账号:" + user +
                "\n电脑编号:" + pc +
                "\n已使用时间:" +  show + " min");
        }else{
            alert("用户账号:" + user +
                "\n电脑编号:" + pc +
                "\n已使用时间:" +  show + "s");
        }
    }
    function loading() {
        alert("很抱歉，该功能还在完善中。");
    }
</script>
<div class="center" style="width: 60%;position: relative;top: 20%;left: 20%;">
    <table style="background:#ffffff;width: 100%">
        <form action="sending.jsp" method="post"  align="center">
            <tr>
                <td width="30%"><h1>任务清单</h1></td>
                <td width="20%"></td>
                <td width="10%"><a href="normal.jsp" title="关闭"><img src="../picture/return1.png" style="width: 32px;height: 32px;"></a></td>
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
    <a href="./logout.jsp" ><img src="../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
    <a onclick="showinfo()"><img src="../picture/user.png" style="margin-left:20px;height: 32px;width: 32px" title="查看用户信息"></a>
    <a onclick="loading()"><img src="../picture/moreapps.png" style="margin-left:20px;height: 32px;width: 32px" title="添加新的功能"></a>
    <a href="looktask.jsp"><img src="../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="当前任务"></a>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
