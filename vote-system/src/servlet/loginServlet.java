package servlet;

import DAO.UserDao;
import VO.UserVo;

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
        HttpSession session = request.getSession();
        UserDao userDao = new UserDao();
        String code = request.getParameter("code");
        String randStr = (String)session.getAttribute("randStr");
        String that = request.getParameter("user");
        UserVo userVo = null;
        try{
            userVo = userDao.findUserbyname(that);
        }catch (Exception e){
            e.printStackTrace();
        }
        if(userVo.getPassword()==null){
            response.sendRedirect("login.jsp");
        }
        if(userVo.getPassword().equals(request.getParameter("password"))&&code.equals(randStr)){
            session.setAttribute("user",userVo.getUser());
            session.setAttribute("type",userVo.getWho());
            response.sendRedirect("voteground.jsp");
        }else{
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
