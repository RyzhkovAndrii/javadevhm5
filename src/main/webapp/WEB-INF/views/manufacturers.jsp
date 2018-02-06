<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<style>
    <%@include file="/resources/css/main.css"%>
</style>

<head>
    <title>Manufacturers Main Page</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<table border="1" cellpadding="3" class="main_css">
    <caption>
        <h3>
            Manufacturers List
        </h3>
    </caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>View</th>
        <th>Update</th>
        <th>Remove</th>
    </tr>
    <c:forEach var="manufacturer" items="${manufacturersList}">
        <tr>
            <td align="center">${manufacturer.id}</td>
            <td align="center">${manufacturer.name}</td>
            <td width="70" align="center"><a href= <c:url value="/manufacturers/${manufacturer.id}"/>>View</a></td>
            <td width="70" align="center"><a href= <c:url value="/manufacturers/update/${manufacturer.id}"/>>Update</a>
            </td>
            <td width="70" align="center"><a href= <c:url value="/manufacturers/remove/${manufacturer.id}"/>>Remove</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br>

<form:form modelAttribute="manufacturerForm" action="/javadevhm5/manufacturers" method="post" class="main_css">
    <c:if test="${!empty manufacturerForm.id}">
        <h3>Update Manufacturer</h3>
    </c:if>
    <c:if test="${empty manufacturerForm.id}">
        <h3>Create Manufacturer</h3>
    </c:if>
    <br>
    <c:if test="${!empty manufacturerForm.id}">
        <form:label path="id">ID:</form:label>
        <form:input path="id" readonly="true"/>
        <br>
    </c:if>
    <form:label path="name">Name:</form:label>
    <form:input path="name" placeholder="Some Name" required="true"/>
    <br>
    <c:if test="${!empty manufacturerForm.id}">
        <form:button>Update Manufacturer</form:button>
    </c:if>
    <c:if test="${empty manufacturerForm.id}">
        <form:button>Create Manufacturer</form:button>
    </c:if>
</form:form>
</body>
</html>
