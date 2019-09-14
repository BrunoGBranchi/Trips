<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"  name="viewport"
	content="width=device-width, initial-scale=1.0">
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

<title>Cadastrar pacote de viagem</title>
</head>
<body>
<form>
  <div class="form-group row">
    <label for="titulo" class="col-4 col-form-label">Titulo:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-angle-double-right"></i>
          </div>
        </div> 
        <input id="titulo" name="titulo" placeholder="Titulo do roteiro" type="text" required="required" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="origem" class="col-4 col-form-label">Origem:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-angle-double-right"></i>
          </div>
        </div> 
        <input id="origem" name="origem" placeholder="Cidade de saida" type="text" required="required" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="data_saida" class="col-4 col-form-label">Data de saida:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-calendar"></i>
          </div>
        </div> 
        <input id="data" name="data_saida" placeholder="DD/MM/AAAA" type="text" required="required" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="destino" class="col-4 col-form-label">Destino:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-angle-double-right"></i>
          </div>
        </div> 
        <input id="destino" name="destino" placeholder="Destino" type="text" required="required" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="data_retorno" class="col-4 col-form-label">Data de retorno:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-calendar"></i>
          </div>
        </div> 
        <input id="data" name="data_retorno" placeholder="DD/MM/AAAA" type="text" required="required" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="embarque" class="col-4 col-form-label">Local de embarque:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-angle-double-right"></i>
          </div>
        </div> 
        <input id="embarque" name="embarque" placeholder="Local combinado com os passageiros" type="text" aria-describedby="embarqueHelpBlock" required="required" class="form-control">
      </div> 
      <span id="embarqueHelpBlock" class="form-text text-muted">Primeiro local de embarque (caso tenha mais que um)</span>
    </div>
  </div>
  <div class="form-group row">
    <label for="visitacoes" class="col-4 col-form-label">Lugares visitados no roteiro:*</label> 
    <div class="col-8">
      <textarea id="visitacoes" name="visitacoes" cols="40" rows="5" aria-describedby="visitacoesHelpBlock" required="required" class="form-control"></textarea> 
      <span id="visitacoesHelpBlock" class="form-text text-muted">Lugares que serão visitados inclusos no roteiro, apenas um resumo do roteiro. (Max. 5 linhas)</span>
    </div>
  </div>
  <div class="form-group row">
    <label for="inclusos" class="col-4 col-form-label">Valores inclusos no pacote</label> 
    <div class="col-8">
      <textarea id="inclusos" name="inclusos" cols="40" rows="15" required="required" class="form-control"></textarea>
    </div>
  </div>
  <div class="form-group row">
    <label for="valor" class="col-4 col-form-label">Valor:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-dollar"></i>
          </div>
        </div> 
        <input id="valor" name="valor" placeholder="Valor em R$" type="text" aria-describedby="valorHelpBlock" required="required" class="form-control">
      </div> 
      <span id="valorHelpBlock" class="form-text text-muted">Valor por pessoa</span>
    </div>
  </div>
  <div class="form-group row">
    <label for="imagens" class="col-4 col-form-label">Imagens:*</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-cloud-upload"></i>
          </div>
        </div> 
        <input id="imagens" name="imagens" placeholder="Escolha as imagens" type="file" required="required" class="form-control" multiple>
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="roteiro" class="col-4 col-form-label">Arquivo do roteiro:</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-cloud-upload"></i>
          </div>
        </div> 
        <input id="roteiro" name="roteiro" placeholder="Selecione o arquivo do roteiro" type="file" aria-describedby="roteiroHelpBlock" required="required" class="form-control">
      </div> 
      <span id="roteiroHelpBlock" class="form-text text-muted">Apenas arquivo no formato PDF</span>
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Salvar</button>
    </div>
  </div>
</form>
<script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.0.0/jquery.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/webjars/bootstrap/4.3.1/js/bootstrap.js"/>"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script type="text/javascript">
jQuery(function($) {
	$("#data").mask("99/99/9999");
});
</script>
</body>
</html>