<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<style>
.table {
	margin-top: 10px;
}
</style>
</head>
<body class="text-center">
	<h3>My page</h3>
	<h3>Update board</h3>
	<main class="w-75 m-auto">
		<form method="POST" action="/user/delete" onsubmit="return checkDelete()">
			<table class="table table-bordered">
				<c:if test="${empty user}">
					<tr>
						<th>유저 정보가 없습니다.</th>
					<tr>
					<tr>
						<td><a href="/views/user/login">로그인</a></td>
					</tr>
				</c:if>
				<c:if test="${not empty user}">
					<tr>
						<th>번호</th>
						<td>${user.uiNum}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${user.uiName}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${user.uiId}</td>
					</tr>
					<%-- <tr>
						<th>비밀번호</th>
						<td><input type="password" name="uiPwd" value="${user.uiPwd}"></td>
					</tr> --%>
					<tr>
						<th>등급</th>
						<td>${user.uiGrade}</td>
					</tr>
					<tr>
						<th colspan="2">
							<button class="btn btn-info" type="button" onclick="location.href='/views/user/update'">회원정보 수정</button>
							<button class="btn btn-danger">회원 탈퇴</button>
						</th>
					</tr>
				</c:if>
			</table>
		</form>
	</main>
	<a href="/">메인 페이지로 돌아가기</a>
	<script>
		function checkDelete() {
			return confirm('탈퇴하시겠습니까?');
		}
	</script>
</body>
</html>