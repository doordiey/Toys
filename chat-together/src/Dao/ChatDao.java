package Dao;

import vo.ChatVo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ChatDao {
    private Connection conn = null;
    public void initConnection() throws Exception{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }
    public void speaking(ChatVo chatVo) throws Exception{
        initConnection();
        String sql = "insert into chatting(speaker,speaking,room) values(?,?,?)";
        Integer res = 0;
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,chatVo.getSpeaker());
        ps.setString(2,chatVo.getSpeaking());
        ps.setInt(3,chatVo.getRoom());
        res = ps.executeUpdate();
        conn.close();
    }
    public List<ChatVo> reading(String room) throws Exception{
        String sql = "select * from chatting where room=? limit 20";
        initConnection();
        List<ChatVo> res = new ArrayList<ChatVo>();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,room);
        ResultSet that = ps.executeQuery();
        while(that.next()){
            ChatVo it = new ChatVo();
            it.setSpeaker(that.getString("speaker"));
            it.setSpeaking(that.getString("speaking"));
            res.add(it);
        }
        conn.close();
        return res;
    }
    public void attending(String nickname,String room) throws Exception{
        initConnection();
        String sql = "insert into chatting(speaker,speaking,room) values(?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,nickname);
        ps.setString(2,nickname+" is attending");
        ps.setString(3,room);
        ps.executeUpdate();
        String sql1 = "update chatterroom set roomonline=roomonline+1 where id=?";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        ps1.setString(1,room);
        ps1.executeUpdate();
        conn.close();
    }
    public void exit(String nickname,String room) throws Exception{
        initConnection();
        String sql = "insert into chatting(speaker,speaking,room) values(?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,nickname);
        ps.setString(2,nickname+" is exit");
        ps.setString(3,room);
        ps.executeUpdate();
        String sql1 = "update chatterroom set roomonline=roomonline-1 where id=?";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        ps1.setString(1,room);
        ps1.executeUpdate();
        conn.close();
    }
}
