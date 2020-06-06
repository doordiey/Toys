<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HTML学习目录</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<body background="../picture/study.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
<%
    String path = "D:\\IdeaPrograms\\workwork\\web\\wb\\study\\html";
    ArrayList<String> files = new ArrayList<String>();
    ArrayList<String> filename = new ArrayList<String>();
    File file = new File(path);
    File[] fs = file.listFiles();
    for(File f:fs) {
        if (!f.isDirectory()) {
            String that = f.getName().substring(0,f.getName().lastIndexOf("."));
            files.add("./html/"+f.getName());
            filename.add(that);
        }
    }
%>
    <h1>HTML教程</h1>
    <ul>
        <%
            for(int x=0;x<files.size();x++){
        %>
        <li><a style="text-decoration: none" href=<%=files.get(x)%>><%=filename.get(x)%></a></li>
        <%
            }
        %>
        <li><a href="./htmlamenu.jsp" style="text-decoration: none"><img src="../picture/return.png" style="width: 16px;height: 16px;">返回主页面</a></li>
    </ul>
<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
