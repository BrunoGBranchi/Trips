<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1.0">

<link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet"
	type="text/css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">


<link href="<c:url value="/webjars/bootstrap/4.3.1/css/bootstrap.css"/>"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="<c:url value="/webjars/jquery/1.9.1/jquery.min.js"/>"></script>
<title>Cadastro Usuarios</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">

				<h2>Cadastrar Usuario</h2>
				<br>
				<form class="form-horizontal"
					action='<c:url value="/usuarios/enviar"></c:url>' method="post">

					<div class="form-group">
						<label class="col-sm-2 control-label">Nome: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="nome"
								placeholder="Nome Completo" required />
						</div>
					</div>
					<br>


					<div class="form-group">
						<label class="col-sm-2 control-label">E-mail: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="email"
								placeholder="exemplo@exemplo.com.br" required />
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Usuario: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="login"
								placeholder="Usuario para login" required />
						</div>
					</div>

					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="senha"
								placeholder="Senha" required />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Confrimar senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="confirmaSenha"
								placeholder="Confirmar senha" required />
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">CPF: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="cpf"
								placeholder="000.000.000-00" required />
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">RG/Identidade: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="rg"
								placeholder="0.000.000" required />
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Endereço: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="endereco"
								placeholder="Av. Brasil" required />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Numero: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="numero"
								placeholder="100" required />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Complemento: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="complemento"
								placeholder="Casa/Ap 101" required />
						</div>
					</div>
					<br> 
					
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<button class="btn btn-success" type="submit">Cadastrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
</html>