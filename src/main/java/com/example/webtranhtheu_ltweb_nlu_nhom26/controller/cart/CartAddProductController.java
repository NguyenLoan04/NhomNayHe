package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.cart;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.cart.Cart;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "CartAddProductController", value = "/session/add-product")
public class CartAddProductController extends HttpServlet {
    ProductService productService;

    public CartAddProductController() {
        productService =ProductService.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int productId = Integer.parseInt(request.getParameter("productId"));

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Cart cart = (Cart) session.getAttribute("Cart");
        if(cart == null) {
            cart = Cart.getInstance();
        }
        if(cart.getProduct(productId) != null) {
//            cart.update(productId, quantity);
        }
        else{
            Product product = productService.getProduct(productId);
            if(product != null) {cart.add(product);}
        }
        session.setAttribute("Cart", cart);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}