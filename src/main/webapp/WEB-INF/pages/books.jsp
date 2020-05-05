<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>Books</title>
    <style>
        .table_blur {
            background: #f5ffff;
            border-collapse: collapse;
            text-align: left;
        }
        .table_blur th {
            border-top: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
            background: linear-gradient(#9595b6, #5a567f);
            color: white;
            padding: 10px 15px;
            position: relative;
        }
        .table_blur th:after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            top: 25%;
            height: 25%;
            width: 100%;
            background: linear-gradient(rgba(255, 255, 255, 0), rgba(255,255,255,.08));
        }
        .table_blur tr:nth-child(odd) {
            background: #ebf3f9;
        }
        .table_blur th:first-child {
            border-left: 1px solid #777777;
            border-bottom:  1px solid #777777;
            box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }
        .table_blur th:last-child {
            border-right: 1px solid #777777;
            border-bottom:  1px solid #777777;
            box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }
        .table_blur td {
            border: 1px solid #e3eef7;
            padding: 10px 15px;
            position: relative;
            transition: all 0.5s ease;
        }
        .table_blur tbody:hover td {
            color: transparent;
            text-shadow: 0 0 3px #a09f9d;
        }
        .table_blur tbody:hover tr:hover td {
            color: #444444;
            text-shadow: none;
        }
    </style>
</head>
<body>
<br/>
<br/>

<c:if test="${!empty listBooks}">
    <table class="table_blur">
        <tr>
            <th>Id</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="<c:url value="/bookdata/${book.id}"/>" target="_blank">${book.title}</a></td>
                <td>${book.author}</td>
                <td>${book.price}</td>
                <td><a href="<c:url value="/edit/${book.id}"/>">edit</a></td>
                <td><a href="<c:url value="/remove/${book.id}"/>">delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add a book</h1>

<c:url var="addAction" value="/add"/>
    <form:form action="${addAction}" modelAttribute="book">
        <table>
            <c:if test="${!empty book.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="id"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="author">
                        <spring:message text="author"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="author"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="price">
                        <spring:message text="price"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="price"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty book.title}">
                        <input type="submit" value="<spring:message text="edit book"/>"/>
                    </c:if>
                    <c:if test="${empty book.title}">
                        <input type="submit" value="<spring:message text="add book"/>"/>
                    </c:if>
                </td>
            </tr>
        </table>
    </form:form>

</body>
</html>
