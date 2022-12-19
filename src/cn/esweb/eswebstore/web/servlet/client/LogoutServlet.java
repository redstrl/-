package cn.esweb.eswebstore.web.servlet.client;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取session对象.
        HttpSession session = request.getSession();
        // 销毁session
        session.invalidate();
        // flag标识
        String flag = request.getParameter("flag");
        //销毁cookie
        Cookie[] cookies = request.getCookies();
        for (int i = 0; cookies != null && i < cookies.length; i++) {
            if("autologin".equals(cookies[i].getName())) {
                Cookie cookie = new Cookie("autologin", "");
                cookie.setMaxAge(0);
                //覆盖cookie
                response.addCookie(cookie);
            }
        }
        if (flag == null || flag.trim().isEmpty()) {
            // 重定向到首页
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}
