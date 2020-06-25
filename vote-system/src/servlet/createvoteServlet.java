package servlet;

import DAO.VotegroundDao;
import VO.VotegroundVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "createvoteServlet")
public class createvoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VotegroundVo votegroundVo = new VotegroundVo();
        VotegroundDao votegroundDao = new VotegroundDao();
        String votename = request.getParameter("votename");
        String detail = request.getParameter("detail");
        Integer checktype = Integer.parseInt(request.getParameter("checktype"));
        Integer elementnumber = Integer.parseInt(request.getParameter("number"));
        String element = "";
        Integer votes = 0;
        for(int i=1;i<elementnumber+1;i++){
            System.out.println(request.getParameter("element"+i));
            element += request.getParameter("element"+i)+",";
        }
        votegroundVo.setChecktype(checktype);
        votegroundVo.setDetail(detail);
        votegroundVo.setVotename(votename);
        votegroundVo.setVotes(votes);
        votegroundVo.setElement(element);
        votegroundVo.setElementnumber(elementnumber);
        try {
            votegroundDao.createvote(votegroundVo);
        }catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("voteground.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
