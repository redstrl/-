package cn.esweb.eswebstore.web.servlet.client;
import cn.esweb.eswebstore.domain.Product;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

public class ChangeCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //获得id
        String id = request.getParameter("id");
        //获得修改数量
        int count = Integer.parseInt(request.getParameter("count"));
        //从session中获取cart
        HttpSession session = request.getSession();
        Map<Product, Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        Product p = new Product();
        p.setId(id);
        //修改操作
        if(count != 0) {
            cart.put(p, count);
        } else {
            cart.remove(p);
        }
        //重定向返回购物车界面
        response.sendRedirect(request.getContextPath()+"/cart.jsp");
    }
}
