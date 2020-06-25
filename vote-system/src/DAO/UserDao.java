package DAO;

import VO.UserVo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection conn = null;
    private UserVo user = new UserVo();
    public void initConnection() throws Exception{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }

    public UserVo findUserbyname(String name) throws Exception{
        String sql = "select * from user where user=?";
        ResultSet res = null;
        initConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,name);
        res = ps.executeQuery();
        while(res.next()){
            user.setPassword(res.getString("password"));
            user.setUser(res.getString("user"));
            user.setWho(res.getInt("who"));
        }
        conn.close();
        return user;
    }

}
