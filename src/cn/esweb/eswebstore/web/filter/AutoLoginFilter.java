package cn.esweb.eswebstore.web.filter;
import java.io.IOException;
import javax.security.auth.login.LoginException;
import javax.servlet.*;
import javax.servlet.http.*;
import cn.esweb.eswebstore.domain.User;
import cn.esweb.eswebstore.service.UserService;

public class AutoLoginFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest res = (HttpServletRequest) request;
        //获得cookie
        Cookie[] cookies = res.getCookies();
        String autologin = null;
        for (int i = 0; cookies != null && i < cookies.length; i++) {
            if("autologin".equals(cookies[i].getName())) {
                //找到自动登录的cookie
                autologin = cookies[i].getValue();
                break;
            }
        }
        if (autologin != null) {
            //自动登录
            //获取用户名和密码
            String[] loginmsg = autologin.split("-");
            String username = loginmsg[0];
            String password = loginmsg[1];
            //登录
            UserService service = new UserService();
            try {
                User user = service.login(username, password);
                // 登录成功，将用户存储到session中.
                res.getSession().setAttribute("user", user);
            }catch (LoginException e) {
                // 如果出现问题，将错误信息存储到request范围，并跳转回登录页面显示错误信息
                e.printStackTrace();
                request.setAttribute("register_message", e.getMessage());
                request.getRequestDispatcher("/login.jsp").forward(res, response);
            }
        }
        chain.doFilter(res,response);
    }
    public void destroy() {
    }
}
