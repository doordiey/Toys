package servlet;

import Dao.UserDao;
import vo.UserVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "createServlet")
public class createServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("有人正在注册");
        UserDao userDao = new UserDao();
        UserVo userVo = new UserVo();
        String state = "failed";
        userVo.setPassword(request.getParameter("password"));
        userVo.setClient(request.getParameter("client"));
        userVo.setNickname(request.getParameter("nickname"));
        state = userDao.setUser(userVo);
        System.out.println(state);
        if(state.equals("failed")){
            response.sendRedirect("create.jsp");
        }else{
            response.sendRedirect("login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
