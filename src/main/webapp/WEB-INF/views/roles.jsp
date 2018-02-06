<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<style>
    <%@include file="/resources/css/main.css"%>
</style>

<head>
    <title>Roles Main Page</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<table border="1" cellpadding="3" class="main_css">
    <caption>
        <h3>
            Roles List
        </h3>
    </caption>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>View</th>
        <th>Update</th>
        <th>Remove</th>
    </tr>
    <c:forEach var="role" items="${rolesList}">
        <tr>
            <td align="center">${role.id}</td>
            <td align="center">${role.name}</td>
            <td width="70" align="center"><a href= <c:url value="/roles/${role.id}"/>>View</a></td>
            <td width="70" align="center"><a href= <c:url value="/roles/update/${role.id}"/>>Update</a></td>
            <td width="70" align="center"><a href= <c:url value="/roles/remove/${role.id}"/>>Remove</a></td>
        </tr>
    </c:forEach>
</table>
<br>

<form:form modelAttribute="roleForm" action="/javadevhm5/roles" method="post" class="main_css">
    <c:if test="${!empty roleForm.id}">
        <h3>Update Role</h3>
    </c:if>
    <c:if test="${empty roleForm.id}">
        <h3>Create Role</h3>
    </c:if>
    <br>
    <c:if test="${!empty roleForm.id}">
        <form:label path="id">ID:</form:label>
        <form:input path="id" readonly="true"/>
        <br>
    </c:if>
    <form:label path="name">Name:</form:label>
    <form:input path="name" placeholder="Some Name" required="true"/>
    <br>
    <c:if test="${!empty roleForm.id}">
        <form:button>Update Role</form:button>
    </c:if>
    <c:if test="${empty roleForm.id}">
        <form:button>Create Role</form:button>
    </c:if>
</form:form>
</body>
</html>
