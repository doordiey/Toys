<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师主界面</title>
    <link rel="stylesheet" type="text/css" href="../../css/footer.css">
</head>
<script>
    function loading() {
        alert("很抱歉，该功能还在完善中。");
    }
    function test(){
        alert("当前暂无考试安排。");
    }
</script>
<body background="../../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<div id="center" style="position: relative;width: 60%;height: 30%;left: 30%;top: 35%">
    <a href="uploadstudy.jsp" style="margin-left: 100px"><img src="../../picture/uploadhomeword.png" title="上传学习资料"></a>
    <a onclick="loading()" style="margin-left: 100px"><img src="../../picture/deletework.png" title="删除学习资料"></a>
    <a onclick="test()" style="margin-left: 100px"><img src="../../picture/kaoshi.png" title="发布测试"></a>
    <a href="../../teacher/teacher.jsp" style="margin-left: 100px"><img src="../../picture/return.png" title="返回"></a>
</div>
<div class="user_info"  style="bottom: 0;line-height: 30px;position: fixed;">
    <a href="../login/login.jsp" ><img src="../../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
    <a href="showhomeworks.jsp"><img src="../../picture/students.png" style="margin-left:20px;height: 32px;width: 32px" title="查看学生上交作业情况"></a>
    <a href="sendtask.jsp"><img src="../../picture/sendtask.png" style="margin-left:20px;height: 32px;width: 32px" title="发布任务"></a>
    <a href="showtask.jsp"><img src="../../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="查看当前任务"></a>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
