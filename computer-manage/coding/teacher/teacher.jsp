<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师主界面</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
    <div id="function">
        <div class="apps">
            <div class="app1">
                <a href="" onclick="loading()"><img src="../picture/QQ.png" style="height: 48px;width: 48px;" draggable="true" ondragstart="drag(event)" title="QQ聊天"></a>
            </div>
            <div class="app2">
                <a href="" onclick="loading()"><img src="../picture/Python.png" style="height: 48px;width: 48px" draggable="true" title="Python语言学习"></a>
            </div>
            <div class="app3">
                <a href="" onclick="loading()"><img src="../picture/java%20.png" style="height: 48px;width: 48px" draggable="true" title="Java语言学习"></a>
            </div>
            <div class="app4">
                <a href="" onclick="loading()"><img src="../picture/php.png" style="height: 48px;width: 48px" draggable="true" title="PHP语言学习"></a>
            </div>
            <div class="app5">
                <a href="../teach/html/html.jsp"><img src="../picture/html.png" style="height: 48px;width: 48px" title="html学习"></a>
            </div>
    </div>
    </div>
        <div class="user_info"  style="bottom: 0;line-height: 30px;position: fixed;">
            <a href="../login/login.jsp" ><img src="../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
            <a href="showhomeworks.jsp"><img src="../picture/students.png" style="margin-left:20px;height: 32px;width: 32px" title="查看学生上交作业情况"></a>
            <a href="sendtask.jsp"><img src="../picture/sendtask.png" style="margin-left:20px;height: 32px;width: 32px" title="发布任务"></a>
            <a href="showtask.jsp"><img src="../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="查看当前任务"></a>
        </div>
    <div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
    </div>
</body>
</html>
