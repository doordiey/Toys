<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教师主界面</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<div class="students">
    <%
        File dirfile = new File("D:\\IdeaPrograms\\workwork\\web\\wb\\study\\homework");
        if(dirfile.exists()){
            File[] files = dirfile.listFiles();
            if(files!=null){
                for(File that:files){
                    %>
                <div>
                <a href="detail.jsp?student=<%=that.getName()%>" style="margin-top: 20px;text-decoration: none"><img src="../picture/homework.png" style="width: 32px;height: 32px;"><br><%=that.getName()%></a>
                </div>
    <%
                }
            }
        }
    %>
    <a href="teacher.jsp" style="margin-top: 20px;text-decoration: none"><img src="../picture/return.png" style="width: 32px;height: 32px;" title="返回"><br></a>
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
