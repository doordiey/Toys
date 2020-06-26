package DAO;

import VO.VotingVo;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class VotingDao {
    private Connection conn = null;
    private VotingVo votingVo = new VotingVo();
    public void initConnection() throws Exception{
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
        conn = DriverManager.getConnection("jdbc:odbc:what","root","test");
    }

    public void Voting(VotingVo votingVo) throws Exception{
        initConnection();
        String sql = "insert into voting(user,voting,which) values(?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1,votingVo.getUser());
        ps.setString(2,votingVo.getVoting());
        ps.setInt(3,votingVo.getWhich());
        ps.executeUpdate();
        String sql1 = "update voteground set votes=votes+1 where id=?";
        PreparedStatement ps1 = conn.prepareStatement(sql1);
        ps1.setInt(1,votingVo.getWhich());
        ps1.executeUpdate();
        conn.close();
    }

    public Integer[] findvotinginfo(Integer which) throws Exception{
        VotegroundDao votegroundDao = new VotegroundDao();
        Integer elementnumber = votegroundDao.getVotegroundVobyid(which).getElementnumber();
        String elementss = votegroundDao.getVotegroundVobyid(which).getElement();
        String[] elements = elementss.split(",");
        String that = "";
        Integer it = 0;
        Integer[] resi = new Integer[elementnumber];
        initConnection();
        String sql = "select voting,count(voting) number from voting where which=? group by voting ";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,which);
        ResultSet res = ps.executeQuery();
        for(int i=0;i<elements.length;i++){
            resi[i] = 0;
        }
        while(res.next()){
            that = res.getString("voting");
            for(int i=0;i<elements.length;i++){
                if(elements[i].equals(that)){
                    resi[i]=res.getInt("number");
                }
            }
        }
        conn.close();
        return resi;

    }

    public boolean findvotingstate(Integer which,String user) throws Exception{
        String sql = "select * from voting where which=? and user=?";
        initConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1,which);
        ps.setString(2,user);
        ResultSet res = ps.executeQuery();
        Integer i = 0;
        while(res.next()){
            i += 1;
        }
        return i == 0;
    }
}
