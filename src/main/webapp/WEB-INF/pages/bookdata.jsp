<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>Title</title>
    <style>
        table {

            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif, cursive;
            font-size: 14px;
            border-collapse: collapse;
            text-align: center;
        }
        th, td:first-child {
            background: #AFCDE7;
            color: white;
            padding: 10px 20px;
        }
        th, td {
            border-style: solid;
            border-width: 0 1px 1px 0;
            border-color: white;
        }
        td {
            background: #D8E6F3;
        }
        th:first-child, td:first-child {
            text-align: left;
        }
    </style>
</head>
<body>
<h1>Book details</h1>

<table>
    <tr>
        <th>Id</th>
        <th>Title</th>
        <th>Author</th>
        <th>Price</th>
        <th width="200">Description</th>
    </tr>
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.author}</td>
        <td>${book.price}</td>
        <td>${book.description}</td>
    </tr>
</table>

</body>
</html>
