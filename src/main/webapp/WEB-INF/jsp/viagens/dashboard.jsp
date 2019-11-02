<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Painel de controle de viagens</title>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
     <div class="container"> 
      <div class="row">
        <div class="col">
          <div class="card shadow">
            <div class="card-header border-0">
              <h3 class="mb-0">Pacotes cadastrados pela empresa</h3>
            </div>
            <div class="table-responsive">
              <table class="table align-items-center table-flush">
                <thead class="thead-light">
                  <tr>
                    <th scope="col">Nome do pacote</th>
                    <th scope="col">Data e hora de Saida</th>
                    <th scope="col">Local de embarque</th>
                    <th scope="col">Valor</th>
                    <th scope="col">Baixar roteiro</th>
                    <th scope="col">Desistir</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="v" items="${viagensPassageiro}">
                  <tr>
                  	<th scope="row" hidden>${v.id}</th>
                    <th scope="row">${v.titulo}</th>
                    <th scope="row">${v.data_saida} às ${v.hora_saida}</th>
                    <th scope="row">${v.origem}</th>
                    <th scope="row">${v.valor}</th>
                    <th scope="row"><a class="nav-link" href="<c:url value = "/viagens/downloadRoteiro/${v.id}"/>"><i class="fas fa-download text-success"></i></a></th>
                    <th scope="row"><a class="nav-link" href="<c:url value = "/viagens/excluirPassageiro/${v.id}"/>"><i class="fas fa-times text-danger"></i></a></th>
                    
                  </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
     </div>
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