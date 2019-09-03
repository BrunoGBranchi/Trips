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
	<form method="post" action='<c:url value="/imagens/upa"></c:url>' enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Pick file #1:</td>
                    <td><input type="file" name="arquivo" id="arquivo" size="50" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Upload" /></td>
                </tr>
            </table>
        </form>
</body>
</html>