<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link href="<c:url value="/resources/css/header.css"/>" rel="stylesheet" type="text/css">

<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="navbar navbar-light bg-light fixed-top navbar-expand-md"
		role="navigation">
		<div class="container">
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target=".navbar-collapse">&#x2630;</button>
			<a target="_blank" href="#" class="navbar-brand">Trips.</a>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="nav-item"><a href="#" class="nav-link">Inicio</a></li>
				</ul>
				<ul class="nav navbar-nav ml-auto">
					<li class="dropdown nav-item"><a href="#"
						class="dropdown-toggle nav-link" data-toggle="dropdown"> <span
							class="glyphicon glyphicon-user"></span>&#xA0; <strong>Perfil</strong>

							<span class="glyphicon glyphicon-chevron-down"></span>

					</a>
						<ul class="dropdown-menu bg-light">
							<li class="dropdown-item">
								<div class="navbar-login">
									<div class="row">
										<div class="offset-xl-3 col-xl-12">
											<img src="https://via.placeholder.com/110"
												class="img-responsive rounded-circle img-thumbnail">
											</p>
										</div>
										<div class="col-xl-12">
											<p class="text-center">
												<strong>${IDusuario.nome}</strong>
											</p>
											<p class="text-center small"><sec:authorize access="isAuthenticated()">
														<sec:authentication property="name" />
													</sec:authorize></p>
											</p>
										</div>
									</div>
								</div>
							</li>
							<li class="divider dropdown-item"></li>
							<li class="dropdown-item">
								<div class="navbar-login navbar-login-session">
									<div class="row mx-md-n5">
										<div class="col px-md-5">
											<p class="text-center">
												<a href="#" class="btn btn-light btn-outline-dark"><i
													class="fas fa-cog"></i></a>
										</div>
										<div class="col px-md-5">
											<form action="/logout">
											<p>
												<button class="btn btn-danger"><i
													class="fas fa-sign-out-alt"></i></button>
											</p>
											</form>
										</div>
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>