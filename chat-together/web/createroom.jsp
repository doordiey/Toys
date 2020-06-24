<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>创建聊天室</title>
</head>
<body>
    <form action="/createroom" method="post">
        <table>
            <tr>
                <td>聊天室名称</td>
                <td><input type="text" name="roomname"></td>
            </tr>
            <tr>
                <td>聊天室创建者</td>
                <td><input type="text" name="roomhost"></td>
            </tr>
            <tr>
                <td>人数上限</td>
                <td><input type="number" name="roomnumber"></td>
            </tr>
            <tr>
                <td>聊天室简介</td>
                <td><input type="text" name="content"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" value="确认">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
