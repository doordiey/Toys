<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.logging.SimpleFormatter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pc选择</title>
    <link rel="stylesheet" type="text/css" href="../css/footer.css">
</head>
<%
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
    String s = null;
    Integer pc = 0;
    List<Integer> whichcan = new ArrayList<Integer>();
    try{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    }catch (ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }catch (SQLException e){
        e.printStackTrace();
    }
    if(conn!=null){
        PreparedStatement ps = conn.prepareStatement("select * from pc where status=0");
        res = ps.executeQuery();
        while(res.next()){
            whichcan.add(res.getInt(1));
        }
    }
%>
<body background="../picture/desktop.jpg" style="background-size: cover;background-attachment: fixed;background-color: #CCCCCC">
    <table align="center">
        <form method="get" action="../student/schooltime.jsp">
            <tr>
                <td colspan="2">当前空闲pc机号如下：</td>
            </tr>
            <%
                for(int x=0;x<whichcan.size();x++){
            %>
                <tr>
                    <td><%=whichcan.get(x)%></td>
                    <td><input type="radio" name="pc" value=<%=whichcan.get(x)%>></td>
                </tr>
            <%
                }
            %>
            <tr>
                <td colspan="2"><input type="submit" style="border-radius: 3px" name="submit"></td>
            </tr>
        </form>
    </table>
    <div id="footer" >
        coding by <a href="https://github.com/doordiey" target="_blank"><img src="../picture/sspeople.png" title="寻找开发者" style="width: 20px;height: 16px"></a>
    </div>
</body>
</html>
