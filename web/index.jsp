<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 04.09.2022
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Library</title>
</head>
<%
    User user = (User) session.getAttribute("user");
%>

<body>
<div style="width: 1024px; margin: 0 auto" >
<div>
    <img src="/image/3133228.jpg" width="1000" height="400">
    <h1 style="color: darkgreen" >Welcome to My Library</h1>

    <br>

    <%
        if (user!=null){
    %>
    <a href="/books/add">Add book</a>
    <a href="/authors/add">Add author</a>
    <a style="color: darkgreen" href="/books">Show all books</a>
    <a href="/authors">Show all authors</a>
    <a href="/logout">Logout</a>
    <%
        }else {
    %>
    <a href="/users/add">Register</a>
    <a href="/login">Login</a>

    <%
        }
    %>
</div>
</div>

</body>
</html>
