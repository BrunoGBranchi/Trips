<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sec:authorize access="isAuthenticated()">
    Olá, <sec:authentication property="id" />
	</sec:authorize>
	<label>"${usuario.id}"</label>
	<form action="/logout">
		<button type="submit">Sair</button>
	</form>
</body>
</html>