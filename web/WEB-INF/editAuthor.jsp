<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.09.2022
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit author</title>
</head>
<body>
<%
    Author author = (Author) request.getAttribute("author");
%>
Please update author's data
<form action="/authors/edit" method="post">
    <input type="hidden" name="authorId" value="<%=author.getId()%>">
    <input type="text" name="name" value="<%=author.getName()%>"/> <br>
    <input type="text" name="surname" value="<%=author.getSurname()%>"/> <br>
    <input type="email" name="email" value="<%=author.getEmail()%>"/> <br>
    <input type="number" name="age" value="<%=author.getAge()%>"/> <br>
    <input type="submit" value="Edit">
</form>
</body>
</html>
