<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <!-- Icons -->
  <link href="<c:url value="/resources/js/plugins/nucleo/css/nucleo.css"/>" rel="stylesheet" />
  <link href="<c:url value="/resources/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"/>"rel="stylesheet" />
  <!-- CSS Files -->
  <link href="<c:url value="/resources/css/argon-dashboard.css?v=1.1.0"/>" rel="stylesheet" />
</head>
<body class="">
<!-- Autenticado mostra esse -->
<sec:authorize access="isAuthenticated()">
   <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
        <a href="<c:url value="/index"></c:url>">
            <h1 class="text-purple"><i class="fas fa-road"></i> Trips.</h1>
        </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="./index.html">
                <h1 class="text-purple"><i class="fas fa-road"></i> Trips.</h1>
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <!-- Navigation -->
        <ul class="navbar-nav">
         <sec:authorize access="hasRole('ADM_SISTEMA')">
        <li class="nav-item">
            <a class="nav-link " href="<c:url value="/viagens/dashboard"></c:url>">
              <i class="ni ni-tv-2 text-primary"></i> Painel de controle
            </a>
          </li>
        </sec:authorize>
        <sec:authorize access="hasRole('ADM_SISTEMA')">
        <li class="nav-item">
            <a class="nav-link " href="<c:url value="/viagens/adicionar"></c:url>">
              <i class="ni ni-fat-add text-blue"></i> Adicionar pacote
            </a>
          </li>
        </sec:authorize>
                <sec:authorize access="hasRole('ADM_SISTEMA')">
        <li class="nav-item">
            <a class="nav-link " href="<c:url value="/viagens/lerQR"></c:url>">
              <i class="fas fa-qrcode text-purple"></i> Escanear QR Code
            </a>
          </li>
        </sec:authorize>
          <li class="nav-item"  class="active">
          <a class=" nav-link active " href="<c:url value="/viagens/listar"></c:url>"> <i class="ni ni-bullet-list-67 text-primary"></i> Lista de viagens
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="<c:url value="/usuarios/perfil"></c:url>">
              <i class="ni ni-single-02 text-blue"></i> Perfil
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="<c:url value="/logout"></c:url>">
              <i class="ni ni-button-power text-red"></i> Sair
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  </sec:authorize>
  
  
  
  
  
  
  <!-- Não autenticado mostra esse -->
  <sec:authorize access="!isAuthenticated()">
   <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
    <div class="container-fluid">
      <!-- Toggler -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <!-- Brand -->
        <a href="<c:url value="/index"></c:url>">
            <h1 class="text-purple"><i class="fas fa-road"></i> Trips.</h1>
        </a>
      <!-- User -->
      <ul class="nav align-items-center d-md-none">
        <li class="nav-item dropdown">
          <a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

          </a>
          <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
            <div class=" dropdown-header noti-title">
              <h6 class="text-overflow m-0">Welcome!</h6>
            </div>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-single-02"></i>
              <span>My profile</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-settings-gear-65"></i>
              <span>Settings</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-calendar-grid-58"></i>
              <span>Activity</span>
            </a>
            <a href="./examples/profile.html" class="dropdown-item">
              <i class="ni ni-support-16"></i>
              <span>Support</span>
            </a>
            <div class="dropdown-divider"></div>
            <a href="#!" class="dropdown-item">
              <i class="ni ni-user-run"></i>
              <span>Logout</span>
            </a>
          </div>
        </li>
      </ul>
      <!-- Collapse -->
      <div class="collapse navbar-collapse" id="sidenav-collapse-main">
        <!-- Collapse header -->
        <div class="navbar-collapse-header d-md-none">
          <div class="row">
            <div class="col-6 collapse-brand">
              <a href="./index.html">
                <h1 class="text-purple"><i class="fas fa-road"></i> Trips.</h1>
              </a>
            </div>
            <div class="col-6 collapse-close">
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
                <span></span>
                <span></span>
              </button>
            </div>
          </div>
        </div>
        <!-- Form -->
        <!-- Navigation -->
        <ul class="navbar-nav">
         <li class="text-center">
         	Você não está logado!
         </li>
         <li class="text-center" style="padding: 20px;">
         	<a href="<c:url value="/login"></c:url>"><button class="btn-lg btn-block btn-primary">Entrar</button></a>
         </li>
         <li class="text-center">
         	<h4>OU</h4>
         </li>
         <li class="text-center" style="padding: 20px;">
         	<a href="<c:url value="usuarios/cadastro"></c:url>"><button class="btn-lg btn-block btn-secondary">Criar uma conta</button></a>
         </li>
        </ul>
      </div>
    </div>
  </nav>
  </sec:authorize>
   <!--   Core   -->
  <script src="<c:url value="/resources/js/plugins/jquery/dist/jquery.min.js"/>"></script>
  <script src="<c:url value="/resources/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"/>"></script>
  <!--   Optional JS   -->
  <!--   Argon JS   -->
  <script src="<c:url value="/resources/js/argon-dashboard.min.js?v=1.1.0"/>"></script>
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