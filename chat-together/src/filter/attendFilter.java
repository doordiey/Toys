package filter;

import Dao.ChatroomDao;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "attendFilter")
public class attendFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        ChatroomDao chatroomDao = new ChatroomDao();
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        Integer[] that = new Integer[2];
        try{
            that = chatroomDao.getroomnumber(session.getAttribute("room").toString());
        }catch (Exception e){
            e.printStackTrace();
        }
        if(that[0]>=that[1]+1){
            chain.doFilter(req,resp);
        }else{
            response.sendRedirect("chatrooms.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
