package cn.esweb.eswebstore.web.filter;
import cn.esweb.eswebstore.dao.LogoutLogDao;
import cn.esweb.eswebstore.domain.LogoutLog;
import cn.esweb.eswebstore.domain.User;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;

public class LogoutMessageFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    @Override
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        //获取用户
        User user = (User) request.getSession().getAttribute("user");
        filterChain.doFilter(request, servletResponse);
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
            LogoutLog logoutLog = new LogoutLog();
            logoutLog.setUserid(user.getId());
            logoutLog.setIpaddress(sourceIP);
            logoutLog.setDate(date);

            //写入数据库
            LogoutLogDao dao = new LogoutLogDao();
            try {
                dao.addLogoutDao(logoutLog);
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