<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>游戏界面</title>
  </head>
  <script >
    var random=Math.floor(Math.random()*50);
    document.write(random);
    document.cookie="score:"+"0";
    var time=1;
    function check(){
        var answers=document.Form.number.value;
        if(random!=answers&&answers!=null){
            if(random>answers){
                alert("你所猜的数比实际的数小");time=time+1;
            }else {alert("你所猜的数比实际的数大");time=time+1; }
        }else{
            var times = time.toString();
            document.cookie = "score="+(times);
    <% 
    ArrayList users=(ArrayList)session.getAttribute("users");
    String username=(String)users.get(users.size()-1);    
    String ph=username;
    ArrayList phsn = (ArrayList)application.getAttribute("phsn");
    ArrayList phs=(ArrayList)application.getAttribute("phs");
    if(phs==null){
    	phs=new ArrayList();
    	application.setAttribute("phs",phs);
    }
    if(phsn==null){
        phsn=new ArrayList();
        application.setAttribute("phsn",phsn);
    }
    Cookie cookie = null;
    Cookie[] cookies = null;
    cookies = request.getCookies();
    if(cookies!=null){
        for(int i=0;i<cookies.length;i++){
            cookie = cookies[i];
           if(cookie.getName().equals("score")&&!cookie.getValue().equals("0")){
                   phsn.add(cookie.getValue());
                   phs.add(ph);
                   cookie.setValue("0");
           }
        }
    }
      %>
            alert("恭喜你！猜对了"+time);location.href='game.jsp';
        }

        if(time>=7){
            alert("游戏失败");location.href='game.jsp';
        }
    }
</script>
  <body>
  <div align="center">
  <%
      request.setCharacterEncoding("UTF-8");

  %>
    <form name="Form" action="" method="post">
    	<table border="1" align="center">
    	    <tr>
    			<td colspan="2" align="center">系统已产生了一个0~50之间的整数
    			</td>
    		</tr>
    		<tr>
    			<td>请输入你猜的数字：</td>
    			<td><input name="number" type="text" ></td>
    		</tr>
    		<tr>
    			<td colspan="2" align="center"><input type="button" value="提交" onclick=" check()">
    			<input type="reset" value="清空"></td>
    		</tr>
    	</table>
    
    </form>
    <br>
    <input type="button" value="退出当前用户" onClick="location.href='in.jsp'"><br>
    <input type="button" value="查看排行榜" onClick="location.href='p.jsp'"><br>
    </div>
  </body>
  
</html>
