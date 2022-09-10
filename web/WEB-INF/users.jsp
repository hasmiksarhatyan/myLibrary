<%@ page import="java.util.List" %>
<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.09.2022
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users page</title>
</head>
<body>
<%
    List<User> users = (List<User>) request.getAttribute("users");
%>
<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>name</th>
        <th>surname</th>
        <th>email</th>
        <th>action</th>

    </tr>
    <% for (User user : users) {%>
    <tr>
        <td>
            <% if (user.getImage() == null || user.getImage().length()==0) { %>
            <img src="/image/user.png" width="100"/>
            <% } else { %>
            <img src="/getImage?image=<%=user.getImage()%>" width="100" />
            <% } %>

        </td>
        <td><%=user.getId()%>
        </td>
        <td><%=user.getName()%>
        </td>
        <td><%=user.getSurname()%>
        </td>
        <td><%=user.getEmail()%>
        </td>
        <td>
            <a href="/users/remove?authorId=<%=user.getId()%>">Remove</a> |
            <a href="/users/edit?authorId=<%=user.getId()%>">Edit</a>
        </td>

    </tr>
    <%} %>
</table>
</body>
</html>
