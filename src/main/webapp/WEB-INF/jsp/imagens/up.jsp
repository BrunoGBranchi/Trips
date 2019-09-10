<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="/imagens/upa" enctype="multipart/form-data">
            <input type="file" name="file" />
            <button type="submit">Upa ou morra</button>
        </form>
</body>
</html>