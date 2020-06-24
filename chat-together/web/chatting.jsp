<%@ page import="java.util.List" %>
<%@ page import="vo.ChatVo" %>
<%@ page import="Dao.ChatDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天室内</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <script>
        document.getElementsByName("room").value=sessionStorage.getItem("room");
        document.cookie = "room=" + sessionStorage.getItem("room");
        function exit() {
            window.location.href = "/exit";
        }
        function refresh() {
            window.location.href="chatting.jsp";
        }
    </script>
</head>
<body background="picture/logind.jpg" style="background-size: cover;background-attachment: fixed;background-color: #cccccc">
    <h1 align="center">聊天室</h1>
    <p id="room"></p>
    <button onclick="refresh()">刷新</button>
    <div style="width:80%;height:60% ">
        <table>
            <%
                ChatDao chatDao = new ChatDao();
                List<ChatVo> chatVos = chatDao.reading(session.getAttribute("room").toString());
                for(int i=0;i<chatVos.size();i++){
                    %>
            <tr>
                <td><%=chatVos.get(i).getSpeaker()+":"%></td>
                <td><%=chatVos.get(i).getSpeaking()%></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
    <div>
        <form action="/speaking" method="post">
            <input type="hidden" name="room">
            <input type="text" name="speaking" style="height: 10%;width: 80%">
            <input type="submit"style="height: 10%;width: 10%" value="发送">
            <input type="button" style="height: 10%;width: 5%" value="退出" onclick="exit()">
        </form>
    </div>
    <div id="footer" >
        coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
    </div>
</body>
</html>
