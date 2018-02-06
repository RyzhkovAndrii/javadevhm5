<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<c:if test="${not empty error}">
    ${error}
</c:if>
<c:if test="${not empty logout}">
    ${logout}
</c:if>
<form:form action="${pageContext.request.contextPath}/login" method="post">
    Email: <input type="text" name="loginUsername"/>
    <br>
    Password: <input type="text" name="loginPassword"/>
    <br>
    <input type="submit" value="Login"/>
</form:form>
</body>
</html>
