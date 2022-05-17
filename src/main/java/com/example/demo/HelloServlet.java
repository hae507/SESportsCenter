package com.example.demo;

import persistence.DAO.MemberDAO;
import persistence.MyBatisConnectionFactory;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;
    private String s;

    public void init() {
        message = "Hello World!!!!!!!!!!!!!!!!!!!!!!!!!!";
        MemberDAO test = new MemberDAO(MyBatisConnectionFactory.getSqlSessionFactory());
//        String s = "";
        s = test.getAllMember().get(0).toString();
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + "12312312212" + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}