package Dao;

import vo.ChartroomVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatroomDao {
    private ChartroomVo chartroomVo = new ChartroomVo();
    public Connection initConnection() throws Exception{
        Connection conn = null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
        return conn;
    }

    public void setChartroomVo(ChartroomVo chartroomVo) throws Exception{
        Connection conn = initConnection();
        String sql = "insert into chatterroom(roomname,roomhost,roomnumber,content,roomonline) values(?,?,?,?,0)";
        Integer that = 0;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,chartroomVo.getRoomname());
            ps.setString(2,chartroomVo.getRoomhost());
            ps.setInt(3,chartroomVo.getRoomnumber());
            ps.setString(4,chartroomVo.getContent());
            that = ps.executeUpdate();
            conn.close();
    }

    public List<ChartroomVo> getChartroomVo() throws Exception{
        Connection conn = initConnection();
        String sql = "select * from chatterroom";
        List<ChartroomVo> res = new ArrayList<ChartroomVo>();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet that = ps.executeQuery();
        int i =0;
        while(that.next()){
            ChartroomVo it = new ChartroomVo();
            it.setRoomnumber(that.getInt("roomnumber"));
            it.setRoomname(that.getString("roomname"));
            it.setContent(that.getString("content"));
            it.setRoomhost(that.getString("roomhost"));
            it.setRoomonline(that.getInt("roomonline"));
            res.add(it);
            i++;
        }
        conn.close();
        return res;
    }

    public int getchatroomnumbers() throws Exception{
        Connection conn = initConnection();
        String sql = "select count(*) number from chatterroom";
        Integer that = 0;
        try {
            initConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet res = ps.executeQuery();
            while (res.next()) {
                that = res.getInt("number");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        conn.close();
        return that;
    }

    public Integer[] getroomnumber(String room) throws Exception{
        Connection conn = initConnection();
        String sql = "select roomonline,roomnumber from chatterroom where id=?";
        Integer[] numbers = new Integer[2];
        Integer number = 0;
        Integer online = 0;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,room);
        ResultSet res = ps.executeQuery();
        while ((res.next())){
            numbers[0] = res.getInt("roomnumber");
            numbers[1] = res.getInt("roomonline");
        }
        conn.close();
        return numbers;
    }
}
