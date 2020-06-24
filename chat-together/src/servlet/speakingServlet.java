package servlet;

import Dao.ChatDao;
import vo.ChatVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "speakingServlet")
public class speakingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChatDao chatDao = new ChatDao();
        ChatVo chatVo = new ChatVo();
        HttpSession session = request.getSession();
        chatVo.setSpeaking(request.getParameter("speaking"));
        chatVo.setSpeaker(session.getAttribute("nickname").toString());
        chatVo.setRoom(Integer.parseInt(session.getAttribute("room").toString()));
        try{
            chatDao.speaking(chatVo);
        }catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("chatting.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
