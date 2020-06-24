<%@ page import="Dao.ChatroomDao" %>
<%@ page import="vo.ChartroomVo" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>聊天室广场</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <%
        ChatroomDao chatroomDao = new ChatroomDao();
    %>
</head>
<script>
    function create() {
        var xmlhttp = false;
        if(window.XMLHttpRequest){
            xmlhttp = new XMLHttpRequest();
        }
        xmlhttp.open("GET","createroom.jsp",true);
        xmlhttp.onreadystatechange = function (ev) {
            if(xmlhttp.readyState==4){
                info.innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.send();
    }
    function refresh() {
        window.location.href = "chatrooms.jsp";
    }
    function work() {
        alert("暂未完成");
    }
    function attend() {
        var btn = document.getElementsByTagName("button");
        var id;
        document.body.onclick = function (ev) {
            id = ev.target.id;
            sessionStorage.setItem("room",id);
            document.cookie = "room="+id;
        }
        <%
        Cookie cookie = null;
        Cookie[] cookies = null;
        cookies = request.getCookies();
        String room = "";
        if(cookies!=null){
            for(int i=0;i<cookies.length;i++){
                cookie = cookies[i];
                if(cookie.getName().equals("room")){
                    room = cookie.getValue();
                }
            }
        }
        session.setAttribute("room",room);
    %>
        window.location.href = "/attend";
    }
    function logout() {
        window.location.href="login.jsp";
    }
</script>
<body background="picture/logind.jpg" style="background-size: cover;background-attachment: fixed;background-color: #cccccc">
    <div style="width: 400px;height: 100px;">
        <table>
            <tr>
                <td>用户名</td>
                <td><%=session.getAttribute("client")%></td>
                <td><input type="button" value="退出系统" style="border-radius: 3px;width: 70px" onclick="logout()"></td>
            </tr>
            <tr>
                <td>用户昵称</td>
                <td><%=session.getAttribute("nickname")%></td>
                <td><input type="button" value="修改昵称" style="border-radius: 3px;width: 70px" onclick="work()"></td>
            </tr>
            <tr>
                <td>聊天室数目</td>
                <td><%=chatroomDao.getchatroomnumbers()%></td>
                <td><input type="button" value="刷新" style="border-radius: 3px;width: 40px" onclick="refresh()">
                    <input type="button" value="创建聊天室" style="border-radius: 3px;width: 120px" onclick="create()"></td>
            </tr>
        </table>
    </div>
    <hr style="border:  2px solid black">
    <div id="info">
        <table>
            <tr>
                <td>聊天室名称</td>
                <td>聊天室创建者</td>
                <td>人数上限</td>
                <td>聊天室内当前人数</td>
                <td>聊天室简介</td>
                <td></td>
            </tr>
                <%
                    List<ChartroomVo> they = chatroomDao.getChartroomVo();
                    for(int i=0;i<they.size();i++){
                        %>
                <tr>
                    <td><%=they.get(i).getRoomname()%></td>
                    <td><%=they.get(i).getRoomhost()%></td>
                    <td><%=they.get(i).getRoomnumber()%></td>
                    <td><%=they.get(i).getRoomonline()%></td>
                    <td><%=they.get(i).getContent()%></td>
                    <td><button onclick="attend()" id=<%=1+i%>>加入</button></td>
                </tr>
                <%
                    }
                %>
        </table>
    </div>
    <div id="footer" >
        coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
    </div>
</body>
</html>
