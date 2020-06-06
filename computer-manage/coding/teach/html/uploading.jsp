<%@ page import="com.jspsmart.upload.SmartUploadException" %>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传中</title>
</head>
<body>
    <%
        SmartUpload smartUpload = new SmartUpload();
        ServletConfig config1 = this.getServletConfig();
        smartUpload.initialize(config1,request,response);
        try{
            smartUpload.upload();
            File smartfile = smartUpload.getFiles().getFile(0);
            smartfile.saveAs(""+smartfile.getFileName(),smartUpload.SAVE_PHYSICAL);
        }catch (SmartUploadException e){
            e.printStackTrace();
        }
        String msg = "upload success";
        request.setAttribute("msg",msg);
    %>
    <script>
        alert("upload success");
        window.location.href='./uploadstudy.jsp';
    </script>
</body>
</html>
