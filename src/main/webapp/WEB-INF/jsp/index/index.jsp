<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">

<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">


<title>Trips - Bem-Vindo!</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
<div style="margin-top: 30px;" class="container">
	<p>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="name" />
	</sec:authorize>
	</p>
	<p>"${IDusuario.id}"</p>
	<form action="/logout">
		<button style="margin-top: 50px;" type="submit">Sair</button>
	</form>
	<form action="/delete/${IDusuario.id}">
		<input type="hidden" name="id" value="${IDusuario.id}">
		<button type="submit">Excluir usuario</button>
	</form>
</div>
</body>

</html>