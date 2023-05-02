package cn.esweb.eswebstore.web.servlet.client;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import cn.esweb.eswebstore.exception.FindProductByIdException;
import cn.esweb.eswebstore.service.ProductService;
import cn.esweb.eswebstore.domain.Product;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

public class AddCartServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException,IOException {
        // 获得id，商品
        String id = request.getParameter("id");
        ProductService service = new ProductService();
        try {
            Product p = service.findProductById(id);
            //获得session对象
            HttpSession session = request.getSession();
            //获取cart对象
            Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
            //创建cart
            if (cart == null) {
                cart = new HashMap<Product, Integer>();
            }
            //添加商品,购物车内无物品，count返回null，执行插入操作，若已有该物品，返回原数量，覆盖物品数量
            Integer count = cart.put(p, 1);
            if (count != null) {
                cart.put(p, count + 1);
            }
            session.setAttribute("cart", cart);
            response.sendRedirect(request.getContextPath() + "/cart.jsp");
        } catch (FindProductByIdException e) {
            e.printStackTrace();
        }
    }
}
