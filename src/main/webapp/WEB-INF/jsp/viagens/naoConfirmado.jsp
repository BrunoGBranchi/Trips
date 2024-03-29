<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Não Confirmado!</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
<br>
<div class="container">
	<div class="alert alert-danger">
			<h1 class="text-center text-white">Passageiro não encontrado! Tente escanear de novo ou confira a lista de passageiros.</h1>
	</div>
	<br>
	<a class="nav-link" href="<c:url value = "/viagens/lerQR"/>"><button class="btn btn-success">Escanear outro comprovante</button></a>
</div>
</body>
</html>