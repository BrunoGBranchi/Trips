<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/css/login.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<title>Trips - Entrar</title>
</head>
<body>

	<c:if test="${not empty errorMessge}">
		<div style="color: red; font-weight: bold; margin: 30px 0px;">${errorMessge}</div>
	</c:if>

	<div class="login-popup-wrap new_login_popup">
		<div class="login-popup-heading text-center">
			<h4>
				<i class="fa fa-lock" aria-hidden="true"></i> Entrar
			</h4>
		</div>
		<!--<form accept-charset="utf-8" method="post" action="">-->
		<form name='login' action="/login" method="POST">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="exemplo@exemplo.com.br"
					name="username" autofocus required value="branchibruno@gmail.com">
			</div>
			<div class="form-group">
				<input type="password" class="form-control" placeholder="Senha"
					name="password" required value="123456">
			</div>
			<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
			<button type="submit" class="btn btn-default login-popup-btn"
				name="submit" value="1">Entrar</button>
		</form>
		<div class="form-group text-center">
			<a class="pwd-forget" href="javascript:void(0)"
				id="open_forgotPassword">Esqueci a senha</a>
		</div>
		<div class="text-center">
			Sou novo aqui<a href='<c:url value="usuarios/cadastro"></c:url>' > Registrar</a>
		</div>
	</div>

</body>
<script type="text/javascript" src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.js"/>"></script>
<script type="text/javascript" src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
</html>