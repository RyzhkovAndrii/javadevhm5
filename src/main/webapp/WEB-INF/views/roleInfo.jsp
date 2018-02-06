<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<style>
    <%@include file="/resources/css/main.css"%>
</style>
<head>
    <title>Role Info</title>
</head>
<body>
<jsp:include page="headerInclude.jsp"/>
<h3>Role Info</h3>
Name : ${role.name} <br>
ID : ${role.id} <br>
</body>
</html>