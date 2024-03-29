<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Confirmado!</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
<br>
<div class="container">
	<div class="alert alert-success">
			<h1 class="text-center text-white">Confirmado! Passageiro presente na lista.</h1>
	</div>
	<div class="card">
		<h5 class="card-title"><strong>Pacote: </strong>${viagem.titulo}</h5> 
		<h5 class="card-title"><strong>Nome: </strong>${passageiro.nome} </h5>
		<h5 class="card-title"><strong>RG: </strong>${passageiro.rg}</h5>
		<h5 class="card-title"><strong>CPF: </strong>${passageiro.cpf}</h5>
		<h5 class="card-title"><strong>Situação: </strong>Autorizado para viajar</h5>
	</div>
	<br>
	<a class="nav-link" href="<c:url value = "/viagens/lerQR"/>"><button class="btn btn-success">Escanear outro comprovante</button></a>
</div>
</body>
</html>