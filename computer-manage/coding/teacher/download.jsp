<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>下载</title>
</head>
<body>
    <%
        String filename = request.getParameter("file");
        String stu = request.getParameter("name");
        response.setHeader("Content - Disposition","attachment;filename="+filename);
        response.setContentType("image/jpeg");
        RequestDispatcher rd = request.getRequestDispatcher("..\\study\\homework\\"+stu+"\\"+filename);
        rd.forward(request,response);
    %>
</body>
</html>
