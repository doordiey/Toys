<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生主界面</title>
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
            <a href="../study/htmlamenu.jsp"><img src="../picture/html.png" style="height: 48px;width: 48px" title="html学习"></a>
        </div>
        <div class="moreapp">
        </div>
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
