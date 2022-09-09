<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.09.2022
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add book</title>
</head>
<body>
<%
    List<Author> authors = (List<Author>) request.getAttribute("authors");
%>
Please input book's data
<form action="/books/add" method="post" enctype="multipart/form-data">
    <input type="text" name="title" placeholder="please input title"> <br>
    <input type="text" name="description" placeholder="please input description"> <br>
    <input type="number" name="price" placeholder="please input price"> <br>
    <input type="file" name="image"> <br>
    Author
    <select name="authorId" nonce="null" >
        <% for (Author author : authors){ %>
        <option value="<%=author.getId()%>"><%=author.getName()%></option>
        <% } %>
    </select> <br>
    <input type="submit" value="Register">
</form>
</body>
</html>
