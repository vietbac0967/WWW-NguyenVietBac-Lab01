<%@ page import="java.util.Optional" %>
<%@ page import="com.example.lab01.entities.Account" %>
<%@ page import="com.example.lab01.services.AccountService" %>
<%@ page import="com.example.lab01.repositories.AccountRepository" %>
<%@ page import="com.example.lab01.repositories.ConnectDB" %><%--
  Created by IntelliJ IDEA.
  User: bac
  Date: 17/09/2023
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%@include file="cdn.jsp" %>
    <style>
        /* Custom CSS to position the dropdown menu to the right */
        .dropdown-menu-custom {
            right: 0;
            left: auto;
        }

    </style>
<body>
<nav class="navbar navbar-expand-lg bg-light row">
    <div class="col-10"></div>
    <div class="col-2">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <%=session.getAttribute("email")%>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container p-5">
    <div class="card">
        <table class="table">
            <thead>
            <tr>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
            </tr>
            </thead>
            <tbody>
            <%
                AccountRepository accountRepository = new AccountRepository(ConnectDB.getInstance());
                AccountService accountService = new AccountService(accountRepository);
                String id = session.getAttribute("id").toString();
                Optional<Account> op = accountService.getAccountById(id);
                Account account = op.orElse(null);
                assert account != null;%>
                <tr>
                    <td><%=account.getFullName()%></td>
                    <td><%= account.getEmail()%></td>
                    <td><%= account.getPhone()%></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
