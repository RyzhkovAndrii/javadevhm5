<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/resources/css/main.css"%>
</style>
<head>
    <title>Product Info</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<h3>Product Info</h3>
ID : ${product.id} <br>
Name : ${product.name} <br>
Manufacturer : ${product.manufacturer.name} <br>
</body>
</html>