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
<link href="<c:url value="/resources/css/detalhes.css"/>" rel="stylesheet"
	type="text/css">
<title>Detalhes viagem</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
<div class="container">
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-lg-6">
                    <div class="preview-pic tab-content">
                        <div class="tab-pane active" id="pic-1">
                      <c:forEach var="img" items="${detalhes.imagens}">
                            <img class="img-responsive" src="data:image/jpg;base64,${img.imagem}" width="300" height="200" style="margin-bottom: 50px;">
                       	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="details col-lg-6">
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-list-alt"></span>   Pacote</div>
                        <hr>
                         <h4>${detalhes.titulo}</h4>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Data e hora de saida</div>
                            <hr>
                             <h4>${detalhes.data_saida} | ${detalhes.hora_saida}h</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Origem</div>
                            <hr>
                             <h4>${detalhes.origem}</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Destino</div>
                            <hr>
                             <h4>${detalhes.destino}</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Data e hora de retorno</div>
                            <hr>
                             <h4>${detalhes.data_retorno} | ${detalhes.hora_retorno}h</h4>
                             <h4>Chegada por volta das: ${detalhes.hora_chegada}h</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Local de embarque</div>
                            <hr>
                             <h4>${detalhes.embarque}</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-comment"></span>   Lugares visitados</div>
                        <hr>
                         <h4>${detalhes.visitacoes}</h4>
                    </div>
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-credit-card"></span>  Valor:</div>
                        <hr>
                         <h2><font color="#4287f5">R$ ${detalhes.valor}</font></h2> 
                    </div>
                    <div class="text-center">
                        <a href="<c:url value = "/viagens/adicionaPassageiro/${detalhes.id}"/>">
                        	<button class="add-to-cart btn btn-success" type="button" style="margin-top: 20px;"><i class="fas fa-cart-plus"></i> Comprar</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<br>
</body>
</html>