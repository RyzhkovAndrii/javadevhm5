<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/resources/css/main.css"%>
</style>
<head>
    <title>Manufacturer Info</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<h3>Manufacturer Info</h3>
Name : ${manufacturer.name} <br>
ID : ${manufacturer.id} <br>
Products:
<c:forEach var="product" items="${manufacturer.products}">
    ${product.name},
</c:forEach>
</body>
</html>