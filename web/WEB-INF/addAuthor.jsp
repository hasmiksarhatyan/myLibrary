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
    <title>add author</title>
</head>
<body>
Please input author's data
<form action="/authors/add" method="post" enctype="multipart/form-data">
    <input type="text" name="name" placeholder="please input name"> <br>
    <input type="text" name="surname" placeholder="please input surname"> <br>
    <input type="email" name="email" placeholder="please input email"> <br>
    <input type="number" name="age" placeholder="please input age"> <br>
    <input type="file" name="image"> <br>
    <input type="submit" value="Register">
</form>
</body>
</html>
