package com.example.webtranhtheu_ltweb_nlu_nhom26.controller.admin.policy;

import com.example.webtranhtheu_ltweb_nlu_nhom26.bean.admin.PolicyDTO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetPolicyDataController", value = "/admin/policy-management/get-policy")
public class GetPolicyDataController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        //chưa xử lý service
        List<PolicyDTO> policies = new ArrayList<>();
        policies.add(new PolicyDTO(1, "Chính sách 1", 1200, new Timestamp(System.currentTimeMillis())));

        Gson gson = new Gson();
        response.getWriter().print(gson.toJson(policies));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}