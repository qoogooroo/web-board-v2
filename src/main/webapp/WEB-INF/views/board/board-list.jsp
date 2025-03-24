<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<body>
<h3>회원 전용 게시판</h3>
<div class="contatiner">
	<table class="table table-boardered w-75">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${boards}" var="board">
		<tr>
			<td>${board.biNum}</td>
			<td>${board.biTitle}</td>
			<td>${board.uiName}</td>
			<td>${board.credat}</td>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="4">
				<a href="/board/board-insert">등록</a>
			</th>
		</tr>
	</table>

</div>
</body>
</html>