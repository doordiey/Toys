<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>html学习相关</title>
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
    function test(){
        alert("当前暂无考试安排。");
    }
</script>
<div id="center" style="position: relative;width: 60%;height: 30%;left: 30%;top: 35%">
    <a href="./uploadhtml.jsp" style="margin-left: 100px"><img src="../picture/uploadhomeword.png" title="上传作业"></a>
    <a href="./htmlmenu.jsp" style="margin-left: 100px"><img src="../picture/study.png" title="学习"></a>
    <a onclick="test()" style="margin-left: 100px"><img src="../picture/kaoshi.png" title="测试"></a>
    <a href="../student/normal.jsp" style="margin-left: 100px"><img src="../picture/return.png" title="返回"></a>
</div>
<div class="user_info"  style="bottom: 0;line-height: 30px;position: fixed;">
    <a href="../student/logout.jsp" ><img src="../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
    <a onclick="showinfo()"><img src="../picture/user.png" style="margin-left:20px;height: 32px;width: 32px" title="查看用户信息"></a>
    <a onclick="loading()"><img src="../picture/moreapps.png" style="margin-left:20px;height: 32px;width: 32px" title="添加新的功能"></a>
    <a onclick="loading()"><img src="../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="当前任务"></a>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>