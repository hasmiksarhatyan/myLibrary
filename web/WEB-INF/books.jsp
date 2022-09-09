<%@ page import="java.util.List" %>
<%@ page import="model.Book" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.09.2022
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books page</title>
</head>
<body>
<%
    List<Book> books = (List<Book>) request.getAttribute("books");
%>
<table border="1">
    <tr>
        <th>image</th>
        <th>id</th>
        <th>title</th>
        <th>description</th>
        <th>price</th>
        <th>author</th>
        <th>action</th>

    </tr>
    <% for (Book book : books) {%>
    <tr>
        <td>
            <% if (book.getImage() == null || book.getImage().length() == 0) { %>
            <img src="/image/book.png" width="100"/>
            <% } else { %>
            <img src="/getImage?image=<%=book.getImage()%>" width="100" />
            <% } %>

        </td>
        <td><%=book.getId()%>
        </td>
        <td><%=book.getTitle()%>
        </td>
        <td><%=book.getDescription()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td>
            <%if (book.getAuthor()!=null){%>
            <%=book.getAuthor().getName()%> <%=book.getAuthor().getSurname()%>
            <%}else{%>
            <span style="color: red">there is no author</span>
            <%}%>
        </td>
        <td>
            <a href="/books/remove?bookId=<%=book.getId()%>">Remove</a> |
            <a href="/books/edit?bookId=<%=book.getId()%>">Edit</a>

        </td>

    </tr>
    <%} %>
</table>
</body>
</html>
