package servlet;

import DAO.VotingDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "attendvotingServlet")
public class attendvotingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        VotingDao votingDao = new VotingDao();
        Integer which = Integer.parseInt(request.getParameter("which"));
        String user = session.getAttribute("user").toString();
        session.setAttribute("votingroom",request.getParameter("which"));
        boolean state = false;
        try{
            state = votingDao.findvotingstate(which,user);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(state){
            response.sendRedirect("voting.jsp");
        }else{
            response.sendRedirect("voteinfo.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("voteground.jsp");
    }
}
