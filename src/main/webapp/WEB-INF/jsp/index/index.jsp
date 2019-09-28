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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet"
	type="text/css">

<title>Trips - Bem-Vindo!</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
<div style="margin-top: 50px;" class="container">
    <c:forEach var="viagem" items="${viagens}">
	    <div class="row">
	        <div class="list-group">
	            <div class="list-group-item clearfix">
	                <div class="profile-teaser-left">
	                    <div class="profile-img">
	                        <img src="data:image/jpg;base64,${imgviagem}">
	                    </div>
	                </div>
	                <div class="profile-teaser-main">
	                     <h2 class="profile-name">${viagem.titulo}</h2>
	                    <div class="profile-info">
	                        <div class="info"><span class="">Data de saida:</span> ${viagem.data_saida}</div>
	                        <div class="info"><span class="">Saida de:</span> ${viagem.origem}</div>
	                        <div class="info"><span class="">Valores inclusos:</span> ${viagem.inclusos}</div>
	                        <div class="info"><span class="">Preco por pessoa:</span> ${viagem.valor}</div>
	                        <div class="position-fixed"><a href="<c:url value = "/viagens/detalhes/${viagem.id}"/>"><button class="btn btn-success btn-lg btn-block"><i class="fas fa-plus"></i> VER MAIS</button></a></div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    </c:forEach>
</div>
</body>

</html>