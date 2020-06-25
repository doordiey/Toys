package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "loginFilter")
public class loginFilter implements Filter {
    String[] notneed = new String[]{"/login.jsp","/create.jsp","/login","/create","/validate.jsp","/picture/back.jpg",
            "/picture/sspeple.png","/css/footer.css"};
    public void destroy() {
    }

    public boolean need(String uri){
        for(String that:notneed){
            if(that.equals(uri)){
                return false;
            }
        }
        return true;
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        boolean need = need(uri);
        if(!need){
            chain.doFilter(req,resp);
        }else{
            if(session.getAttribute("user")!=null&&session!=null){
                chain.doFilter(req,resp);
            }else{
                String resqtype = request.getHeader("X-Requested-With");
                if (resqtype!=null && "XMLHttpRequest".equals(resqtype)){
                    chain.doFilter(req,resp);
                }else{
                    response.sendRedirect("login.jsp");
                }
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
