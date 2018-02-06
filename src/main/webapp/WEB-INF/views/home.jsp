<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/resources/css/main.css"%>
</style>
<head>
    <title>Home Page</title>
</head>
<body>
<table class="main_css">
    <tr>
        <td><a href="<c:url value="/products"/>">Products Page</a></td>
    </tr>
    <tr>
        <td><a href="<c:url value="/manufacturers"/>">Manufacturers Page</a></td>
    </tr>
    <tr>
        <td><a href="<c:url value="/users"/>">Users Page</a></td>
    </tr>
    <tr>
        <td><a href="<c:url value="/roles"/>">Roles Page</a></td>
    </tr>
</table>
</body>
</html>
