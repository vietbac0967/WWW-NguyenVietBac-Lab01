package com.example.lab01.controllers;

import com.example.lab01.entities.Account;
import com.example.lab01.repositories.AccountRepository;
import com.example.lab01.repositories.ConnectDB;
import com.example.lab01.services.AccountService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(urlPatterns = {"/update"})
public class UpdateAccountServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String fullName = req.getParameter("name");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String id = req.getParameter("id");
        Account account = new Account(id,fullName,password,email,phone,(byte) 1);
        AccountRepository accountRepository =  new AccountRepository(ConnectDB.getInstance());
        AccountService accountService = new AccountService(accountRepository);
        boolean rs = accountService.updateAccount(account);
        HttpSession session = req.getSession();
        RequestDispatcher requestDispatcher = null;
        if(rs){
            session.setAttribute("success","Account update Complete");
            requestDispatcher = req.getRequestDispatcher("dashboard.jsp");
        }else {
            requestDispatcher = req.getRequestDispatcher("update_page.jsp");
        }
        requestDispatcher.forward(req,resp);
    }
}
