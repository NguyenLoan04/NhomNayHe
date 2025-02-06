package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.user.order.order_form;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.Order;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.order.OrderProduct;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.OrderService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GetCancelFormController", value = "/user/get-cancel-form")
public class GetCancelFormController extends HttpServlet {
    public OrderService orderService = new OrderService();
    public ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User account = (User) session.getAttribute("account");
        String orderId= request.getParameter("orderId");
        Order order= orderService.getOrderById(account.getId(),Integer.parseInt(orderId));
        List<OrderProduct> orderProducts= OrderService.getListOrderProductByOrderId(Integer.parseInt(orderId));
        orderProducts.forEach(orderProduct->{
            Product product = productService.getProduct(orderProduct.getId());
            product.setListImageUrls(productService.getListImageUrls(product.getId()));
            orderProduct.setThumbnail(product.getThumbnail());
        });
        order.setProducts(orderProducts);
        request.setAttribute("order", order);
        session.setAttribute("account", account);
        request.getRequestDispatcher("/layout/user/orders/order-form/read-cancel-order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}