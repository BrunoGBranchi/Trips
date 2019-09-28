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
<div class="container">
    <div class="card">
        <div class="container-fliud">
            <div class="wrapper row">
                <div class="preview col-lg-6">
                    <div class="preview-pic tab-content">
                        <div class="tab-pane active" id="pic-1">
                      <c:forEach var="img" items="${detalhes.imagens}">
                            <img src="data:image/jpg;base64,${img.imagem}" width="300" height="169">
                       	</c:forEach>
                        </div>
                    </div>
                </div>
                <div class="details col-lg-6">
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-list-alt"></span>   Titulo</div>
                        <hr>
                         <h4>${detalhes.titulo}</h4>
                    </div>
                    <div class="card text-center">
                        <div class="rating">
                             <div class="card-title"><span class="glyphicon glyphicon-info-sign"></span>  Category</div>
                            <hr>
                             <h4>Basic</h4>
                        </div>
                    </div>
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-comment"></span>   Description</div>
                        <hr>
                         <h4>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget nibh at dui tincidunt lacinia imperdiet vel turpis. Donec nec felis ornare, porta diam quis, convallis odio. In tincidunt, dui euismod pharetra ultricies, purus purus cursus felis, vitae lacinia elit libero sed </h4>
                    </div>
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-credit-card"></span>  Money</div>
                        <hr>
                         <h2><font color="purple">50 &#x20BA;</font></h2> 
                    </div>
                    <div class="card text-center">
                         <div class="card-title"><span class="glyphicon glyphicon-scissors"></span>  Size</div>
                        <hr> <span class="input-group-addon"><select id="beden" name="beden" class="form-control">

                       <option>M</option>

                       <option>S</option>

                       <option>XL</option>



                    </select></span>
                        <br>
                    </div>
                    <div class="text-center">
                        <button class="add-to-cart btn btn-secondary" type="button"><span class="glyphicon glyphicon-gift"></span> Sepete Ekle</button>
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