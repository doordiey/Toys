<%@ page import="DAO.VotegroundDao" %>
<%@ page import="java.util.List" %>
<%@ page import="VO.VotegroundVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>投票广场</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <%
        VotegroundDao votegroundDao = new VotegroundDao();
    %>
</head>
<script>
    function create() {
        // var xmlhttp = false;
        // if(window.XMLHttpRequest){
        //     xmlhttp = new XMLHttpRequest();
        // }
        // xmlhttp.open("GET","createvote.jsp",true);
        // xmlhttp.onreadystatechange = function (ev) {
        //     if(xmlhttp.readyState==4){
        //         info.innerHTML = xmlhttp.responseText;
        //     }
        // }
        // xmlhttp.send();
        window.location.href="createvote.jsp";
    }
    function refresh() {
        window.location.href = "voteground.jsp";
    }
    function logout() {
        window.location.href="login.jsp";
    }
    function voting(){
        var btn = document.getElementsByTagName("button");
        var id;
        document.body.onclick = function (ev) {
            id = ev.target.id;
            document.getElementById("which").value = id;
            document.getElementById("Myform").submit();
        }
    }
</script>
<body background="picture/back.jpg" style="background-size: cover;background-attachment: fixed;background-color: #cccccc">
<div style="width: 400px;height: 100px;">
    <table>
        <tr>
            <td>用户名</td>
            <td><%=session.getAttribute("user")%></td>
            <td><input type="button" value="退出系统" style="border-radius: 3px;width: 70px" onclick="logout()"></td>
        </tr>
        <tr>
            <td>可参与投票项目</td>
            <td><%=votegroundDao.getvotegroundnumber()%></td>
            <td><input type="button" value="刷新" style="border-radius: 3px;width: 40px" onclick="refresh()">
                <input type="button" value="发起投票" style="border-radius: 3px;width: 120px" onclick="create()"></td>
        </tr>
    </table>
</div>
<hr style="border:  2px solid black">
<div id="info">
    <form id="Myform" action="/attendvoting" method="post">
    <table>
        <tr>
            <td>投票名称</td>
            <td>投票介绍</td>
            <td>当前投票人数</td>
            <td><input type="hidden" name="which" id="which"></td>
        </tr>
        <%
            List<VotegroundVo> votegroundVos = votegroundDao.getVotegroundVos();
            for(int i=0;i<votegroundVos.size();i++){
        %>
            <tr>
                <td><%=votegroundVos.get(i).getVotename()%></td>
                <td><%=votegroundVos.get(i).getDetail()%></td>
                <td><%=votegroundVos.get(i).getVotes()%></td>
                <td><button onclick="voting()" id=<%=votegroundVos.get(i).getId()%>>参与投票</button></td>
            </tr>
        <%
            }
        %>
    </table>
    </form>
</div>

<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
