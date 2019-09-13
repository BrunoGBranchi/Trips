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
	
<link href="<c:url value="/webjars/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css"/>"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
<title>Cadastro Usuarios</title>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">

				<h2>Cadastrar Usuario</h2>
				<br>
				<form name="f1" id="f1" class="form-horizontal"
					action='<c:url value="/usuarios/enviar"></c:url>' method="post" enctype="multipart/form-data">

					<div class="form-group">
						<label class="col-sm-2 control-label">E-mail: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" id="login" name="login"
								onblur="valida_form(f1.login)"
								placeholder="exemplo@exemplo.com.br" required autofocus value="branchibruno@gmail.com" />
							<div id="msgemail"></div>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="senha"
								placeholder="Senha" required onblur="verificaSenha()" value="123456" />
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Confrimar senha: </label>
						<div class="col-sm-10">
							<input class="form-control" type="password" name="confirmaSenha"
								placeholder="Confirmar senha" required onblur="verificaSenha()" value="123456" />
							<div id="msgsenha"></div>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Nome: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="nome"
								placeholder="Nome Completo" required value="Bruno Ghilardi Branchi"/>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Data de Nascimento:
						</label>
						<div class="col-sm-10">
							<div class="input-group date" data-provide="datepicker">
								<input type="text" class="form-control" name="data_nascimento" >
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-th"></span>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">CPF: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="cpf" id="cpf"
								placeholder="000.000.000-00" required value="060.476.369-77"/>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">RG/Identidade: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="rg"
								placeholder="0.000.000" required value="5710363"/>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Orgão emissor: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="emissor"
								placeholder="SSPSC" required value="SSPSC" />
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Estado: </label>
						<div class="col-sm-10">
							<select class="form-control" name="uf" size="1" id="uf"></select>
						</div>
					</div>
					<br>



					<div class="form-group">
						<label class="col-sm-2 control-label">Cidade: </label>
						<div class="col-sm-10">
							<select class="form-control" name="cidade" size="1" id="cidade"></select>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">CEP: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="cep" id="cep"
								placeholder="89820-000" required value="89820-000"/>
						</div>
					</div>
					<br>

					<div class="form-group">
						<label class="col-sm-2 control-label">Endereço: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="endereco"
								placeholder="Av. Brasil" required value="Av. Brasil"/>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Numero: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="numero"
								placeholder="100" required value="numero"/>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="col-sm-2 control-label">Complemento: </label>
						<div class="col-sm-10">
							<input class="form-control" type="text" name="complemento"
								placeholder="Casa/Ap 101" required value="casa"/>
						</div>
					</div>
					<br> 
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Avatar: </label>
						<div class="col-sm-10">
							<input class="form-control" type="file" name="file"
								placeholder="Escolha um arquivo"/>
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
<script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/webjars/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.js"/>"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery.maskedinput.min.js'/>"></script>
<script language="Javascript">
	function valida_form() {
		if (document.getElementById("login").value == "") {
			document.getElementById("login").setAttribute("style", "");
		} else {
			var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if (!filter.test(document.getElementById("login").value)) {
				document.getElementById("login").focus();
				document.getElementById("login").setAttribute("style",
						"border: solid red");
				document.getElementById("msgemail").innerHTML = "<font color='red'>E-mail inválido </font>";
				return false;
			} else {
				document.getElementById("login").setAttribute("style",
						"border:solid green");
				document.getElementById("msgemail").innerHTML = "<font color='green'>E-mail válido </font>";
			}
		}
	};

	function verificaSenha() {
		senha = document.f1.senha.value;
		confirmaSenha = document.f1.confirmaSenha.value;
		if (senha == "" && confirmaSenha == "") {
			document.getElementById("msgsenha").innerHTML = "<font color='red'>Os campos de senha não podem ficar vazios </font>";
		} else {
			if (senha != confirmaSenha) {
				document.getElementById("msgsenha").innerHTML = "<font color='red'>As senhas não coincidem </font>";
			} else {
				document.getElementById("msgsenha").innerHTML = "<font color='green'>As senhas coincidem </font>";
			}
		}
	}
	
	jQuery(function($) {
		$("#cpf").mask("999.999.999-99");
		$("#cep").mask("99999-999");
		$(".datepicker").datepicker({
			format: 'dd/mm/yyyy'
		});
	});



	$
			.ajax({
				'url' : "https://servicodados.ibge.gov.br/api/v1/localidades/estados",
				'type' : "GET",
				'success' : function(listaUf) {
					var option = '<option>Selecione o Estado</option>';
					$
							.each(
									listaUf,
									function(i, obj) {
										option += '<option value="'+obj.nome+'" data-codigo="'+obj.id+'">'
												+ obj.sigla + '</option>';
									})
					$("#uf").html(option).show();
				}
			});
	$('#uf')
			.change(
					function(e) {
						var estado = $('#uf').find('option:selected').data(
								'codigo');

						$
								.ajax({
									'url' : "https://servicodados.ibge.gov.br/api/v1/localidades/estados/"
											+ estado + "/municipios",
									'type' : "GET",
									'success' : function(listaCidades) {
										var option = '<option>Selecione a Cidade</option>';
										$.each(listaCidades, function(i, obj) {
											option += '<option>' + obj.nome
													+ '</option>';
										})
										$("#cidade").html(option).show();
									}
								})
					});
</script>

</html>