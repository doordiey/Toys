<%@ page import="DAO.VotegroundDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建投票</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<%
    VotegroundDao votegroundDao = new VotegroundDao();
%>
<script>
    var number=0;
    function create() {
        window.location.href="createvote.jsp";
    }
    function refresh() {
        window.location.href = "voteground.jsp";
    }
    function logout() {
        window.location.href="login.jsp";
    }
    function more() {
        var now = number + 1;
        document.getElementById("elements").innerHTML += "<tr id='element" + now.toString()+ "'>" +
            "<td>选项名称</td>" +
            "<td><input type='text' name='element"+ now.toString() +"'></td>" +
            "</tr>";
        number +=1;
        document.getElementById("number").value = number;
    }
    function less() {
        if (number <= 0){
            alert("没有可删除的内容");
        }
        else{
            var tr = document.getElementById("element" + number.toString());
            tr.parentNode.removeChild(tr);
            number -= 1;
            alert("删除完成.");
        }
        document.getElementById("number").value = number;
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
<form action="/createvote" method="post">
    <table>
        <tbody>
        <tr>
            <td>投票名称</td>
            <td><input type="text" name="votename"></td>
        </tr>
        <tr>
            <td>投票相关描述</td>
            <td><input type="text" name="detail"></td>
        </tr>
        <tr>
            <td>选项类型</td>
            <td><input type="radio" name="checktype" value="1">单选
                <input type="radio" name="checktype" value="2">多选</td>
        </tr>
        <tr>
            <td><input type="button" onclick="more()" value="添加选项"></td>
            <td><input type="button" onclick="less()" value="删除选项"></td>
        </tr>
        </tbody>
        <tbody id="elements">

        </tbody>
        <tbody>
        <tr>
            <td><input type="hidden" id="number" name="number"></td>
        </tr>
        <tr>
            <td>
                <input type="submit" value="确认">
                <input type="reset" value="重置">
            </td>
        </tr>
        </tbody>

    </table>
</form>
        <div id="footer" >
        coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
        </div>
</body>
</html>
