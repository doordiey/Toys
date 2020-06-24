package servlet;

import Dao.UserDao;
import vo.UserVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("有人登陆中");
        HttpSession session = request.getSession();
        UserDao userDao = new UserDao();
        String code = request.getParameter("code");
        String randStr = (String)session.getAttribute("randStr");
        String that = request.getParameter("client");
        UserVo userVo = userDao.getUser(that);
        System.out.println(userVo.getPassword());
        if(userVo.getPassword()==null){
            response.sendRedirect("login.jsp");
        }
        if(userVo.getPassword().equals(request.getParameter("password"))&&code.equals(randStr)){
            session.setAttribute("client",userVo.getClient());
            session.setAttribute("nickname",userVo.getNickname());
            response.sendRedirect("chatrooms.jsp");
        }else{
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
