package cn.esweb.eswebstore.web.servlet.client;
import cn.esweb.eswebstore.domain.Product;
import cn.esweb.eswebstore.domain.User;
import cn.esweb.eswebstore.utils.MailUtils;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CreateOrderServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            //获取表单信息
            String receiverAddress = request.getParameter("receiverAddress");
            String receiverName = request.getParameter("receiverName");
            String receiverPhone = request.getParameter("receiverPhone");
            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("user");
            Map<Product, Integer> cart = (Map<Product, Integer>)session.getAttribute("cart");
            String emailstr = user.getUsername()+",感谢购买！"+"请确认订单信息。<br />" +
                    "收件人："+receiverName+"<br />收货地址："+receiverAddress
                    +"<br />联系电话："+receiverPhone;
            int count = 1;
            for(Product p: cart.keySet()) {
                String id = p.getId();
                String name = p.getName();
                double price = p.getPrice();
                emailstr = emailstr + "<br />序号："+ count +
                        "<br />商品id："+ id + "</a>商品名：" + name +
                        "</a>单价：" + price;
                count ++;
            }
            //发送邮件
            MailUtils.sendMail(user.getEmail(),emailstr);
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/ordersuccess.jsp");
    }
}
