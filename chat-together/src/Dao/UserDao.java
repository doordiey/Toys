package Dao;

import vo.UserVo;

import java.sql.*;

public class UserDao {
    private UserVo user = new UserVo();
    public Connection initConnection() throws Exception{
        Connection conn = null;
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
        return conn;
    }

    public String setUser(UserVo user) throws Exception{
        String sql = "insert into chatter(client,password,nickname) values(?,?,?)";
        Connection conn = initConnection();
        String state = "failed";
        Integer res;
        res = 0;
        try {
            initConnection();
        }catch (Exception e){
            e.printStackTrace();
        }
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getClient());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getNickname());
            res = ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        if(res==1){
            state = "success";
        }
        try{
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return state;
    }

    public UserVo getUser(String client) throws Exception{
        String sql = "select * from chatter where client=?";
        ResultSet res = null;
        Connection conn = initConnection();
        try{
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,client);
            res = ps.executeQuery();
            while (res.next()){
                String c = res.getString("client");
                String n = res.getString("nickname");
                String p = res.getString("password");
                user.setClient(c);
                user.setNickname(n);
                user.setPassword(p);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            conn.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }


}
