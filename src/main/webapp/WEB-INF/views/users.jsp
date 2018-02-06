<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<style>
    <%@include file="/resources/css/main.css"%>
</style>

<head>
    <title>Users Main Page</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<table border="1" cellpadding="3" class="main_css">
    <caption>
        <h3>
            Users List
        </h3>
    </caption>
    <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Password</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>View</th>
        <th>Update</th>
        <th>Remove</th>
    </tr>
    <c:forEach var="user" items="${usersList}">
        <tr>
            <td align="center">${user.id}</td>
            <td align="center">${user.email}</td>
            <td align="center">${user.password}</td>
            <td align="center">${user.firstName}</td>
            <td align="center">${user.lastName}</td>
            <td width="70" align="center"><a href= <c:url value="/users/${user.id}"/>>View</a></td>
            <td width="70" align="center"><a href= <c:url value="/users/update/${user.id}"/>>Update</a></td>
            <td width="70" align="center"><a href= <c:url value="/users/remove/${user.id}"/>>Remove</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<form:form modelAttribute="userForm" action="/javadevhm5/users" method="post" class="main_css">
    <c:if test="${!empty userForm.id}">
        <h3>Update User</h3>
    </c:if>
    <c:if test="${empty userForm.id}">
        <h3>Create User</h3>
    </c:if>
    <br>
    <c:if test="${!empty userForm.id}">
        <form:label path="id">ID:</form:label>
        <form:input path="id" readonly="true"/>
        <br>
    </c:if>
    <form:label path="email">Email:</form:label>
    <form:input path="email" placeholder="Some Email" required="true"/>
    <br>
    <form:label path="password">Password:</form:label>
    <form:input path="password" placeholder="Some Password" required="true"/>
    <br>
    <form:label path="firstName">First Name:</form:label>
    <form:input path="firstName" placeholder="Some First Name"/>
    <br>
    <form:label path="lastName">Last Name:</form:label>
    <form:input path="lastName" placeholder="Some Last Name"/>
    <br>
    Roles: <form:checkboxes path="roles" items="${rolesList}" itemValue="id" itemLabel="name"/>
    <br>
    <c:if test="${!empty userForm.id}">
        <form:button>Update User</form:button>
    </c:if>
    <c:if test="${empty userForm.id}">
        <form:button>Create User</form:button>
    </c:if>
</form:form>
</body>
</html>
