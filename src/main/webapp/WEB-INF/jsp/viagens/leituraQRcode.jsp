<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Escanear QR Code</title>
<script src="<c:url value="/resources/js/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/js/instascan.min.js"/>"></script>
</head>
<body>
<c:import url="../headers/header.jsp"></c:import>
	<div class="container">
	<h1>Teste leitor QRCode</h1>
		<div class="row">
			<div class="card">
				<video id="preview"></video>
				<form id="submitConteudo" action='<c:url value="/viagens/validaQR"></c:url>' method="POST" enctype="multipart/form-data">
				    <input type="hidden" name="valores" id=conteudo>
				    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				</form>
			</div>
	    </div>
    </div>
    <script type="text/javascript">
      let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
      scanner.addListener('scan', function (content) {
        $('#conteudo').val(content);
        $('#submitConteudo').submit();
      });
      Instascan.Camera.getCameras().then(function (cameras) {
        if (cameras.length > 0) {
          scanner.start(cameras[0]);
        } else {
          console.error('No cameras found.');
        }
      }).catch(function (e) {
        console.error(e);
      });
    </script>
</body>
</html>