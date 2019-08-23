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
				<form name="f1" id="f1" class="form-horizontal"
					action='<c:url value="/usuarios/enviar"></c:url>' method="post">

					<div class="form-group">
						<label class="col-sm-2 control-label">E-mail: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="login"
								onblur="validacaoEmail(f1.email)"
								placeholder="exemplo@exemplo.com.br" required  autofocus/>
							<div id="msgemail"></div>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="senha"
								placeholder="Senha" required onClick="verificaSenha()" />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Confrimar senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="confirmaSenha"
								placeholder="Confirmar senha" required onClick="verificaSenha()" />
							<div id="msgsenha"></div>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Nome: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="nome"
								placeholder="Nome Completo" required />
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
						<label class="col-sm-2 control-label">Orgão emissor: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="emissor"
								placeholder="SSPSC" required />
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Estado: </label>
						<div class="col-sm-10">
							<select class="form-control" type="text" name="uf" required></select>
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Cidade: </label>
						<div class="col-sm-10">
							<select class="form-control" type="text" name="cidade" required></select>
						</div>
					</div>
					<br>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">CEP: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="cep"
								placeholder="Av. Brasil" required />
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
					<br> <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<button class="btn btn-success" type="submit">Cadastrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script language="Javascript">
	function validacaoEmail(field) {
		usuario = field.value.substring(0, field.value.indexOf("@"));
		dominio = field.value.substring(field.value.indexOf("@") + 1,
				field.value.length);

		if ((usuario.length >= 1) && (dominio.length >= 3)
				&& (usuario.search("@") == -1) && (dominio.search("@") == -1)
				&& (usuario.search(" ") == -1) && (dominio.search(" ") == -1)
				&& (dominio.search(".") != -1) && (dominio.indexOf(".") >= 1)
				&& (dominio.lastIndexOf(".") < dominio.length - 1)) {
			document.getElementById("msgemail").innerHTML = "<font color='green'>E-mail válido </font>";
		} else {
			document.getElementById("msgemail").innerHTML = "<font color='red'>E-mail inválido </font>";
		}
	}

	function verificaSenha() {
		senha = document.f1.senha.value;
		confirmaSenha = document.f1.confirmaSenha.value;
		if (senha == null && confirmarSenha == null) {
			document.getElementById("msgsenha").innerHTML = "<font color='red'>Os campos de senha não podem ficar vazios </font>";
		} else {
			if (senha != confirmaSenha && senha != null && confirmaSenha != null) {
				document.getElementById("msgsenha").innerHTML = "<font color='red'>As senhas não coincidem </font>";
			} else {
				document.getElementById("msgsenha").innerHTML = "<font color='green'>As senhas coincidem </font>";
			}
		}
	}
</script>

</html>