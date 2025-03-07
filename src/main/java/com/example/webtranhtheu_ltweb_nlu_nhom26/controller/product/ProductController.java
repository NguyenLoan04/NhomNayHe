package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.product;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.product.Product;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.User;
import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.user.history.ViewedHistory;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.CategoryService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.ProductService;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.product.ConcreteProductDetail;
import com.example.webtranhtheu_ltweb_nlu_nhom26.services.product.DisplayFullProduct;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String productId = request.getParameter("id");
        try {
            int id = Integer.parseInt(productId);
            DisplayFullProduct service = new DisplayFullProduct(new ConcreteProductDetail());
            Product product = service.getFullProductInfo(id);
            if (product == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            String width = request.getParameter("width");
            String height = request.getParameter("height");
            if (width != null && height != null) {
                if (product.getSelectedPrice(Integer.parseInt(width), Integer.parseInt(height)) == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
            }
            if ((width == null) == (height != null)) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }

            HttpSession session = request.getSession();
            if (session.getAttribute("listCategory") == null) {
                session.setAttribute("listCategory", CategoryService.getNameAndPatternCategory());
            }
            if(session.getAttribute("viewedHistory")==null){
                session.setAttribute("viewedHistory", ViewedHistory.getInstance());
            }
            ViewedHistory viewedHistory = (ViewedHistory) session.getAttribute("viewedHistory");
            viewedHistory.addProduct(product);
            session.setAttribute("viewedHistory", viewedHistory);

            Object account = session.getAttribute("account");
            String location = "Chưa chọn";
            if (account != null) {
                location = ((User) account).getDefaultLocation().getLocation();
            }

            request.setAttribute("product", product);
            request.setAttribute("countReview", ProductService.countReviews(product.getId()));
            request.setAttribute("avgRating", ProductService.getProductRating(product.getId()));
            request.setAttribute("similarProduct", service.getSimilarProduct(product));
            request.setAttribute("listCategory", CategoryService.getNameAndPatternCategory());
            request.setAttribute("location", location);
            request.getRequestDispatcher("/layout/product.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND); //Ném trang 404
        }
    }

    //Khi người dùng gửi comment lên
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=utf-8");
        //Kiểm tra session
        HttpSession session = request.getSession();
        JsonObject jsonResult = new JsonObject();
        if (session.getAttribute("user") != null) {
            //Insert review vào db

            //Kết quả thực hiện
            jsonResult.addProperty("result", true);
        } else {
            jsonResult.addProperty("result", false);
        }
        response.getWriter().write(jsonResult.toString());
    }
}