<%@ page import="DAO.VotegroundDao" %>
<%@ page import="VO.VotegroundVo" %>
<%@ page import="java.util.Scanner" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>投票</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<%
    VotegroundDao votegroundDao = new VotegroundDao();
    Integer which = Integer.parseInt(session.getAttribute("votingroom").toString());
    System.out.println(which);
    VotegroundVo votegroundVo = votegroundDao.getVotegroundVobyid(which);
%>
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
<div id="voting">
    <div id="voteinfo">
        <h1><%=votegroundVo.getVotename()%></h1>
        <p>
            <%=votegroundVo.getDetail()%>
        </p>
    </div>
    <form action="/voting" method="post">
        <table>
            <tbody>
            <tr>
            <td>选项名称</td>
            <td>选择状态</td>
            </tr>
            </tbody>

            <tbody>
            <%
                String elementss = votegroundVo.getElement();
                String[] elements = elementss.split(",");
                String ty = "";
                if(votegroundVo.getChecktype()==1){
                    ty = "radio";
                }else {
                    ty = "checkbox";
                }
                for(int i=0;i<elements.length;i++){
                    %>
            <tr>
                <td><%=elements[i]%></td>
                <td><input type='<%=ty%>' value='<%=elements[i]%>' name="element"></td>
            </tr>
            <%
                }
            %>
            </tbody>
            <tbody>
            <tr>
                <td><input type="submit" value="确认"></td>
                <td><input type="reset" value="重置"></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>

<div id="footer" >
    coding by <a href="https://github.com/doordiey" target="_blank"><img src="picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
</div>
</body>
</html>
