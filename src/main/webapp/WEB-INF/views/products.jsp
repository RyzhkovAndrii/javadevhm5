<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<style>
    <%@include file="/resources/css/main.css"%>
</style>

<head>
    <title>Products Main Page</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<table border="1" cellpadding="3" class="main_css">
    <caption>
        <h3>
            Products List
        </h3>
    </caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Manufacturer</th>
        <th>View</th>
        <th>Update</th>
        <th>Remove</th>
    </tr>
    <c:forEach var="product" items="${productsList}">
        <tr>
            <td align="center">${product.id}</td>
            <td align="center">${product.name}</td>
            <td align="center">${product.manufacturer.name}</td>
            <td width="70" align="center"><a href= <c:url value="/products/${product.id}"/>>View</a></td>
            <td width="70" align="center"><a href= <c:url value="/products/update/${product.id}"/>>Update</a></td>
            <td width="70" align="center"><a href= <c:url value="/products/remove/${product.id}"/>>Remove</a></td>
        </tr>
    </c:forEach>
</table>
<br>

<form:form modelAttribute="productForm" action="/javadevhm5/products" method="post" class="main_css">
    <c:if test="${!empty productForm.id}">
        <h3>Update Product</h3>
    </c:if>
    <c:if test="${empty productForm.id}">
        <h3>Create Product</h3>
    </c:if>
    <br>
    <c:if test="${!empty productForm.id}">
        <form:label path="id">ID:</form:label>
        <form:input path="id" readonly="true"/>
        <br>
    </c:if>
    <form:label path="name">Name:</form:label>
    <form:input path="name" placeholder="Some Name" required="true"/>
    <br>
    Manufacturers:
    <form:select path="manufacturer" required="true">
        <form:option value="NONE" label="---Select---" selected="true" disabled="true" />
        <form:options items="${manufacturersList}" itemValue="id" itemLabel="name"/>
    </form:select>
    <br>
    <c:if test="${!empty productForm.id}">
        <form:button>Update Product</form:button>
    </c:if>
    <c:if test="${empty productForm.id}">
        <form:button>Create Product</form:button>
    </c:if>
</form:form>
</body>
</html>
