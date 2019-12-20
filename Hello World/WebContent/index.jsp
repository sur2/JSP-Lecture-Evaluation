<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>우리의 첫 번째 페이지</title>
</head>
<body>
	<h1>Hello World!</h1>
	<form action="./userJoinAction.jsp" method="post">
		<input type="text" name="userID" placeholder="아이디">
		<input type="password" name="userPassword" placeholder="비밀번호">
		<input type="submit" value="회원가입">
	</form>
</body>
</html>