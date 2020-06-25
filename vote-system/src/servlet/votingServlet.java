package servlet;

import DAO.VotingDao;
import VO.VotingVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "votingServlet")
public class votingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VotingDao votingDao = new VotingDao();
        VotingVo votingVo = new VotingVo();
        HttpSession session = request.getSession();
        votingVo.setUser(session.getAttribute("user").toString());
        votingVo.setVoting(request.getParameter("element"));
        votingVo.setWhich(Integer.parseInt(session.getAttribute("votingroom").toString()));
        try{
            votingDao.Voting(votingVo);
        }catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("voteinfo.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("voting.jsp");
    }
}
