package servlet;

import Dao.ChatroomDao;
import vo.ChartroomVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "createroomServlet")
public class createroomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ChatroomDao chatroomDao = new ChatroomDao();
        ChartroomVo chartroomVo = new ChartroomVo();
        String state = "failed";
        chartroomVo.setContent(request.getParameter("content"));
        chartroomVo.setRoomhost(request.getParameter("roomhost"));
        chartroomVo.setRoomname(request.getParameter("roomname"));
        chartroomVo.setRoomnumber(Integer.parseInt(request.getParameter("roomnumber")));
        chatroomDao.setChartroomVo(chartroomVo);
        response.sendRedirect("chatrooms.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
