<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link href="<c:url value="/resources/css/header.css"/>" rel="stylesheet"
	type="text/css">

<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
    </ul>
    <ul class="navbar-nav">
    <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${IDusuario.nome}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <div class="row justify-content-center">
          <c:forEach var="img" items="${IDusuario.imgPerfil}">
          	<img src="data:image/jpg;base64,${img.imagem}" class="img-responsive rounded-circle img-thumbnail" width="100" height="100">
          	</c:forEach>
          	</div>
          <div class="dropdown-divider"></div>
          <strong class="dropdown-item">${IDusuario.nome}</strong>
          <strong class="dropdown-item">${IDusuario.idade} anos</strong>
          <p class="text-center small">
          	<sec:authorize access="isAuthenticated()">
				<sec:authentication property="name" />
			</sec:authorize>
			</p>
			<p class="text-center">
			<a class="btn btn-light btn-outline-dark" href="#">	
          		<i class="fas fa-cog"></i>
          		Configurações
          </a>
          </p>
          <form action="/logout">
	          <p class="text-center">
				<a class="btn btn-outline-danger" type="submit">	
	          		<i class="fas fa-sign-out-alt"></i>
	          		Sair
	          </a>
	          </p>
	       	</form>
        </div>
      </li>
    </ul>
    <!-- 
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
     -->
  </div>
</nav>
</body>
</html>