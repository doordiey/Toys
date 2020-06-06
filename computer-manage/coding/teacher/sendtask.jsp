<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发送信息</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<div class="center" style="width: 30%;position: relative;top: 20%;left: 40%;">
    <table style="background:#ffffff;width: 100%">
    <form action="sending.jsp" method="post"  align="center">
        <tr>
            <td><h1>任务发布卡</h1></td>
        </tr>
        <tr>
            <td>任务内容</td>
        </tr>
        <tr>
            <td>
                <textarea required="true" rows="3" cols="30" name="content" id="content"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="发布" style="width:50px;font-weight:bold;">
                <input type="button" onclick="window.location.href='teacher.jsp';" value="返回" style="width: 50px;font-weight: bold;">
            </td>
        </tr>
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
