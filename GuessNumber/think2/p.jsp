<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>排行榜</title>
  </head>
  <body>
  <table>
      排行榜
      <tr>
          <td>昵称</td>
          <td>猜对所用次数</td>
      </tr>
    <%
    request.setCharacterEncoding("UTF-8");
    ArrayList phs=(ArrayList)application.getAttribute("phs");
    ArrayList phsn=(ArrayList)application.getAttribute("phsn");
    for(int i=0;i<phsn.size();i++){
			if(phs.get(i)!=null){
    		String a=(String)phs.get(i);
            String b = phsn.get(i).toString();
    %>
      <tr>
          <td><%=a%></td>
          <td><%=b%></td>
      </tr>

    	<%
    	}
    }%>
  </table>
    <input type="button" value="开始新的游戏" onClick="location.href='in.jsp'"><br>
  </body>
</html>
