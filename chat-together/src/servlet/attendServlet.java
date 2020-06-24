package servlet;

import Dao.ChatDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "attendServlet")
public class attendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChatDao chatDao = new ChatDao();
        HttpSession session = request.getSession();
        try{
            chatDao.attending(session.getAttribute("nickname").toString(),session.getAttribute("room").toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("chatting.jsp");
    }
}
