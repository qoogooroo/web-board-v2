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
		<form method="POST" action="/board/delete">
			<input type="hidden" name="biNum" value="${board.biNum}">
			<table class="table table-bordered w-75">
				<c:if test="${empty board}">
					<tr>
						<th>존재하지 않는 게시글입니다.</th>
					<tr>
					<tr>
						<td><a href="/board/board-list">목록으로 돌아가기</a></td>
					</tr>
				</c:if>
				<c:if test="${not empty board}">
					<tr>
						<th>번호</th>
						<td>${board.biNum}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${board.biTitle}</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td>${board.uiName}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><pre>${board.biContent}</pre></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>${board.credat}</td>
					</tr>
					<tr>
						<th>등록시각</th>
						<td>${board.cretim}</td>
					</tr>
					<tr>
						<th>최근수정일</th>
						<td>${board.lmodat}</td>
					</tr>
					<tr>
						<th>최근수정시각</th>
						<td>${board.lmotim}</td>
					</tr>
					<tr>
						<th colspan="2"><button class="btn btn-primary" type="button"
								onclick="location.href='/board/board-update?biNum=${board.biNum}'">수정</button>
							<button class="btn btn-secondary">삭제</button></th>
					</tr>
				</c:if>
			</table>
		</form>
		${user.uiNum}${board.uiNum} <a href="/board/board-list">게시글 목록으로</a>
	</div>
</body>
</html>