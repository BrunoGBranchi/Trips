<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Meu perfil</title>
</head>
<body class="">

  <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
  <c:import url="../headers/header.jsp"></c:import>
  </nav>
  <div class="main-content">
    <!-- Navbar -->
	<c:if test="${aviso != null}">
			<div class="alert alert-success" role="alert"><h1 class="text-center text-white">${aviso}</h1></div>
	</c:if>
    <!-- Header -->
    <div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 600px; background-image: url(../assets/img/theme/profile-cover.jpg); background-size: cover; background-position: center top;">
      <!-- Mask -->
      <span class="mask bg-gradient-default opacity-8"></span>
      <!-- Header container -->
      <div class="container-fluid d-flex align-items-center">
        <div class="row">
          <div class="col-lg-7 col-md-10">
            <h1 class="display-2 text-white">Olá, ${usuario.nome}</h1>
            <p class="text-white mt-0 mb-5">Este é seu perfil, aqui você pode conferir suas informações e editá-las se necessário</p>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row">
        <div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
          <div class="card card-profile shadow">
            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
            </div>
            <div class="card-body pt-0 pt-md-4">
              <div class="row">
                <div class="col">
                </div>
              </div>
              <div class="text-center">
                <h3>
                  ${usuario.nome}<span class="font-weight-light">, ${usuario.idade}</span>
                </h3>
                <div class="h5 font-weight-300">
                  <i class="ni location_pin mr-2"></i>${usuario.cidade}, ${usuario.uf}
                </div>
                <div class="h5 mt-4">
                 <h3>
                  Numero de identidade:<span class="font-weight-light"> ${usuario.rg}</span>
                </h3>
                <h3>
                  CPF:<span class="font-weight-light"> ${usuario.cpf}</span>
                </h3>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-8 order-xl-1">
          <div class="card bg-secondary shadow">
            <div class="card-header bg-white border-0">
              <div class="row align-items-center">
                <div class="col-8">
                  <h3 class="mb-0">Minha conta</h3>
                </div>
              </div>
            </div>
            <div class="card-body">
              <form action='<c:url value="/usuarios/salvarEditado"></c:url>' method="POST" enctype="multipart/form-data">
                <input name="id" value="${usuario.id}" type="hidden">
                <h6 class="heading-small text-muted mb-4">Informações do usuário</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="nome">Nome Completo</label>
                        <input type="text" id="nome" name="nome" class="form-control form-control-alternative" placeholder="Nome completo" value="${usuario.nome}">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="login">Email</label>
                        <input type="email" id="login" name="login" class="form-control form-control-alternative" value="${usuario.login}">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="login">Senha</label>
                        <input type="password" id="login" name="senha" class="form-control form-control-alternative" required>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="login">Confirmar senha</label>
                        <input type="password" id="login" name="confirmarSenha" class="form-control form-control-alternative" required>
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Informações de contato</h6>
                <div class="pl-lg-4">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-control-label" for="endereco">Endereço</label>
                        <input id="input-address" name="endereco" class="form-control form-control-alternative" placeholder="Endereço" value="${usuario.endereco}" type="text">                        
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Numero</label>
                        <input id="input-address" name="numero" class="form-control form-control-alternative" placeholder="Numero" value="${usuario.numero}" type="text">                        
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-control-label" for="input-address">Complemento</label>
                        <input id="input-address" name="complemento" class="form-control form-control-alternative" placeholder="Endereço" value="${usuario.complemento}" type="text">                        
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-city">Cidade</label>
                        <input type="text" id="input-city" name="cidade" class="form-control form-control-alternative" placeholder="Cidade" value="${usuario.cidade}">
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">Estado</label>
                        <input type="text" id="input-country" name="uf" class="form-control form-control-alternative" placeholder="Estado" value="${usuario.uf}">
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <label class="form-control-label" for="input-country">CEP</label>
                        <input type="text" id="input-postal-code" name="cep" class="form-control form-control-alternative" placeholder="CEP" value="${usuario.cep}">
                      </div>
                    </div>
                  </div>
                </div>
                <hr class="my-4" />
                <!-- Description -->
                <h6 class="heading-small text-muted mb-4">Outras informações</h6>
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-username">Numero Identidade</label>
                        <input type="text" id="input-username" name="rg" class="form-control form-control-alternative" placeholder="Nome completo" value="${usuario.rg}">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Emissor</label>
                        <input id="input-email" name="emissor" class="form-control form-control-alternative" value="${usuario.emissor}">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">CPF</label>
                        <input id="input-email" name="cpf" class="form-control form-control-alternative" value="${usuario.cpf}">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="input-email">Data de nascimento</label>
                        <input id="input-email" name="data_nascimento" class="form-control form-control-alternative" value="${usuario.data_nascimento}">
                      </div>
                    </div>
                  </div>
                   <input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> 
                  <button class="btn btn-info">Salvar</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <footer class="footer">
        <div class="row align-items-center justify-content-xl-between">
          <div class="col-xl-6">
            <div class="copyright text-center text-xl-left text-muted">
              &copy; 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
            </div>
          </div>
          <div class="col-xl-6">
            <ul class="nav nav-footer justify-content-center justify-content-xl-end">
              <li class="nav-item">
                <a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a>
              </li>
              <li class="nav-item">
                <a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a>
              </li>
              <li class="nav-item">
                <a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a>
              </li>
              <li class="nav-item">
                <a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a>
              </li>
            </ul>
          </div>
        </div>
      </footer>
    </div>
  </div>
  <!--   Core   -->
  <script src="../assets/js/plugins/jquery/dist/jquery.min.js"></script>
  <script src="../assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="../assets/js/argon-dashboard.min.js?v=1.1.0"></script>
  <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "argon-dashboard-free"
      });
  </script>
</body>
</html>