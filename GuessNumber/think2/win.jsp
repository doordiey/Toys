<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        ArrayList phsn=(ArrayList)application.getAttribute("phs");
        if(phsn==null){
            phsn = new ArrayList();
            application.setAttribute("phsn",phsn);
        }
        Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        if(cookies!=null){
            for(int i=0;i<cookies.length;i++){
                System.out.println(cookie.getName());
           if(cookie.getName().equals("phsn")){
               phsn.add(cookie.getValue());
           }
            }
        }
    %>
</body>
</html>
