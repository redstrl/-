package cn.esweb.eswebstore.web.servlet.client;

import cn.esweb.eswebstore.domain.User;
import cn.esweb.eswebstore.exception.RegisterException;
import cn.esweb.eswebstore.service.UserService;
import cn.esweb.eswebstore.utils.ActiveCodeUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 将表单提交的数据封装到javaBean
        User user = new User();
        try {
            BeanUtils.populate(user, request.getParameterMap());
            // 封裝激活码
            user.setActiveCode(ActiveCodeUtils.createActiveCode());
            //封装注册时间
            Date date = new Date(System.currentTimeMillis());
            user.setRegistTime(date);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        // 调用service完成注册操作。
        UserService service = new UserService();
        try {
            service.register(user);
        } catch (RegisterException e) {
            e.printStackTrace();
            response.getWriter().write(e.getMessage());
            return;
        }
        // 注册成功，跳转到registersuccess.jsp
        response.sendRedirect(request.getContextPath() + "/registersuccess.jsp");
    }
}
