<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>html学习资料上传</title>
    <link rel="stylesheet" type="text/css" href="../../css/footer.css">
</head>
<body background="../../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<div id="center" style="position: relative;width: 60%;height: 30%;left: 30%;top: 35%">
    <form method="post" action="uploading.jsp" enctype="multipart/form-data">
        选择文件进行上传：
        <input type="file" name="myFile">
        <input type="submit" value="上传">
        <button type="button" onclick="window.location.href='../../teacher/teacher.jsp'"  style="width: 50px">取消</button>
    </form>
    ${msg}
</div>
<div class="user_info"  style="bottom: 0;line-height: 30px;position: fixed;">
    <a href="../student/logout.jsp" ><img src="../../picture/exit.png" style="margin-left:20px;height: 32px;width: 32px" title="退出系统"></a>
    <a onclick="showinfo()"><img src="../../picture/user.png" style="margin-left:20px;height: 32px;width: 32px" title="查看用户信息"></a>
    <a onclick="loading()"><img src="../../picture/moreapps.png" style="margin-left:20px;height: 32px;width: 32px" title="添加新的功能"></a>
    <a onclick="loading()"><img src="../../picture/task.png" style="margin-left: 20px;height: 32px;width: 32px" title="当前任务"></a>
</div>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
