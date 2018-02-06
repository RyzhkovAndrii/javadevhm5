<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/resources/css/main.css"%>
</style>
<head>
    <title>User Info</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<h3>User Info</h3>
ID : ${user.id} <br>
Email : ${user.email} <br>
Password : ${user.password} <br>
First Name : ${user.firstName} <br>
Last Name : ${user.lastName} <br>
Roles:
<c:forEach var="role" items="${user.roles}">
    ${role.name},
</c:forEach>
</body>
</html>