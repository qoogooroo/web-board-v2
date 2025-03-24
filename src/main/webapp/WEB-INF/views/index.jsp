<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Web Board Index Page</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<body>
	<h3>Board index page.</h3>
	Welcome to web board!
	<br>
	<c:if test="${empty user}">
		<a href="/views/user/login">Login</a>
	</c:if>
	<c:if test="${not empty user}">
		<b>${user.uiName}</b>님 반갑습니다.<br>
		<a href="/views/user/view">My page</a>
		<a href="/board/board-list">게시판</a>
		<form method="POST" action="/user/logout">
			<button>로그아웃</button>
			<button type="button">회원탈퇴</button>
		</form>
	</c:if>
</body>
</html>