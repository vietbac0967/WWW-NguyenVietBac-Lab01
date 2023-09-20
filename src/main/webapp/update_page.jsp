<%@ page import="com.example.lab01.repositories.AccountRepository" %>
<%@ page import="com.example.lab01.repositories.ConnectDB" %>
<%@ page import="com.example.lab01.services.AccountService" %>
<%@ page import="com.example.lab01.entities.Account" %>
<%@ page import="java.util.Optional" %><%--
  Created by IntelliJ IDEA.
  User: bac
  Date: 17/09/2023
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="cdn.jsp"%>
</head>
<body>
<div class="container p-4">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-body">
                    <p class="fs-3 text-center">Edit Student</p>

                    <%
                        AccountRepository accountRepository = new AccountRepository(ConnectDB.getInstance());
                        AccountService accountService = new AccountService(accountRepository);
                        String id = request.getParameter("id");
                        Optional<Account> optionalAccount = accountService.getAccountById(id);
                        Account account = optionalAccount.orElse(null);
                        assert account != null;%>

                    <form action="update" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input
                                    type="email" class="form-control"
                                    value="<%= account.getEmail()%>" name="email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Full name</label>
                            <input name="name"
                                   type="text" class="form-control"
                                   value="<%=account.getFullName() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="text" name="password"
                                   class="form-control"
                                   value="<%= account.getPassword() %>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone</label>
                            <input name="phone"
                                   type="text" class="form-control"
                                   value="<%= account.getPhone() %>">
                        </div>
                        <input type="hidden" name="id" value="<%= account.getAccountId()%>">
                        <button type="submit" class="btn btn-primary col-md-12">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
