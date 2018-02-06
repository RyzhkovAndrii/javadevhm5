<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<header>
    <form:form id="logoutForm" action="/javadevhm5/logout" method="post">
    </form:form>
    <a href= <c:url value="/home"/>>Home page</a> | User : ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
</header>
