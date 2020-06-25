package DAO;

import VO.VotegroundVo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VotegroundDao {
    private Connection conn = null;
    private VotegroundVo votegroundVo = new VotegroundVo();
    public void initConnection() throws Exception{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }
    public Integer getvotegroundnumber() throws Exception{
        initConnection();
        String sql = "select count(*) number from voteground";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet res = ps.executeQuery();
        Integer that=0;
        while(res.next()){
            that = res.getInt("number");
        }
        conn.close();
        return that;
    }

    public void createvote(VotegroundVo votegroundVo) throws Exception{
        initConnection();
        String sql = "insert into voteground(votename,detail,votes,element,elementnumber,checktype) values(?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,votegroundVo.getVotename());
        ps.setString(2,votegroundVo.getDetail());
        ps.setInt(3,votegroundVo.getVotes());
        ps.setString(4,votegroundVo.getElement());
        ps.setInt(5,votegroundVo.getElementnumber());
        ps.setInt(6,votegroundVo.getChecktype());
        Integer res = ps.executeUpdate();
        conn.close();
    }

    public List<VotegroundVo> getVotegroundVos() throws Exception{
        initConnection();
        String sql = "select * from voteground";
        List<VotegroundVo> votegroundVos = new ArrayList<VotegroundVo>();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet res = ps.executeQuery();
        while(res.next()){
            VotegroundVo that = new VotegroundVo();
            that.setChecktype(res.getInt("checktype"));
            that.setDetail(res.getString("detail"));
            that.setVotename(res.getString("votename"));
            that.setVotes(res.getInt("votes"));
            that.setElement(res.getString("element"));
            that.setElementnumber(res.getInt("elementnumber"));
            that.setId(res.getInt("id"));
            votegroundVos.add(that);
        }
        conn.close();
        return votegroundVos;
    }

    public VotegroundVo getVotegroundVobyid(Integer which) throws Exception{
        VotegroundVo that = new VotegroundVo();
        initConnection();
        String sql = "select * from voteground where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,which);
        ResultSet res = ps.executeQuery();
        while(res.next()){
            that.setChecktype(res.getInt("checktype"));
            that.setDetail(res.getString("detail"));
            that.setVotename(res.getString("votename"));
            that.setVotes(res.getInt("votes"));
            that.setElement(res.getString("element"));
            that.setElementnumber(res.getInt("elementnumber"));
            that.setId(res.getInt("id"));
        }
        System.out.println(that.getChecktype());
        conn.close();
        return that;
    }
}
