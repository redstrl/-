package cn.esweb.eswebstore.web.filter;
import cn.esweb.eswebstore.dao.LoginLogDao;
import cn.esweb.eswebstore.domain.LoginLog;
import cn.esweb.eswebstore.domain.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

public class LoginMessageFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        filterChain.doFilter(request, servletResponse);
        //获取用户
        User user = (User) request.getSession().getAttribute("user");
        if(user != null) {
            //获取ip
            String sourceIP = null;
            String ipAddresses = request.getHeader("x-forwarded-for");
            if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
                ipAddresses = request.getHeader("Proxy-Client-IP");
            }
            if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
                ipAddresses = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
                ipAddresses = request.getHeader("HTTP_CLIENT_IP");
            }
            if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
                ipAddresses = request.getHeader("HTTP_X_FORWARDED_FOR");
            }
            if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
                ipAddresses = request.getRemoteAddr();
            }
            if (!ipAddresses.isEmpty()) {
                sourceIP = ipAddresses.split(",")[0];
            }
            //登录时间
            Date date = new Date(System.currentTimeMillis());

            //封装日志数据
            LoginLog loginLog = new LoginLog();
            loginLog.setUserid(user.getId());
            loginLog.setIpaddress(sourceIP);
            loginLog.setDate(date);

            //写入数据库
            LoginLogDao dao = new LoginLogDao();
            try {
                dao.addLoginLog(loginLog);
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
