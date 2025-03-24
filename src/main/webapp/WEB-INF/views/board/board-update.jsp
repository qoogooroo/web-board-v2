<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<body>
	<div class="container">
		<form method="POST" action="/board/update">
			<input type="hidden" name="biNum" value="${board.biNum}"> <input
				type="hidden" name="uiNum" value="${user.uiNum}">
			<table class="table table-borderd">

				<c:if test="${empty board}">
					<tr>
						<th>존재하지 않는 게시글입니다.</th>
					<tr>
					<tr>
						<td><a href="/board/board-list">게시글 목록으로 돌아가기</a></td>
					</tr>
				</c:if>
				<c:if test="${not empty board}">
					<tr>
						<th>제목</th>
						<td><input type="text" name="biTitle"
							value="${board.biTitle}"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="biContent">${board.biContent}</textarea></td>
					</tr>

					<tr>
						<th colspan="2">
							<button>게시글 수정</button>
						</th>
					</tr>

				</c:if>
			</table>
		</form>
		<a href="/board/board-list">게시글 목록으로</a>
	</div>
</body>
</html>