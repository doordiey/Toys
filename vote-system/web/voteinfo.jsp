<%@ page import="DAO.VotegroundDao" %>
<%@ page import="VO.VotegroundVo" %>
<%@ page import="DAO.VotingDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>投票情况</title>
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <%
        VotegroundDao votegroundDao = new VotegroundDao();
        Integer which = Integer.parseInt(session.getAttribute("votingroom").toString());
        System.out.println(which);
        VotegroundVo votegroundVo = votegroundDao.getVotegroundVobyid(which);
        VotingDao votingDao = new VotingDao();
    %>
</head>
<script>
    function refresh() {
        window.location.href = "voteinfo.jsp";
    }
    function back() {
        window.location.href = "voteground.jsp";
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
<div id="voting">
    <div id="voteinfo">
        <h1>投票名称：<%=votegroundVo.getVotename()%></h1>
        <p>
            投票详细描述：<%=votegroundVo.getDetail()%>
        </p>
    </div>
    <div id="voteresult">
        <table>
            <tr>
                <td>名称</td>
                <td>得票情况</td>
            </tr>
            <%
                Integer[] result = votingDao.findvotinginfo(which);
                String elementss = votegroundDao.getVotegroundVobyid(which).getElement();
                String[] elements = elementss.split(",");
                for(int i=0;i<elements.length;i++){
                    %>
            <tr>
                <td><%=elements[i]%></td>
                <td><img src="picture/color.png" width="<%=result[i]*10%>" height="10"><%=result[i]%> </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td><button onclick="refresh()">刷新</button></td>
                <td><button onclick="back()">返回</button></td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
