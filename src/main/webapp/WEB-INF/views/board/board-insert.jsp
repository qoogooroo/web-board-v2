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
<body class="text-center">
	<div class="container">
		<form method="POST" action="/board/insert"
			onsubmit="return validation()">
			<table class="table table-bordered w-75">
				<tr>
					<th>제목</th>
					<td><input type="text" name="biTitle" id="biTitle" size="40"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${user.uiName}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="biContent" id="biContent"
							Style="resize: none; width: 100%; , height: 200px;"></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<button class="btn btn-primary">등록</button>
						<button class="btn btn-secondary" type="button"
							onclick="location.href='/board/board-list'">돌아가기</button>
					</th>
				</tr>
			</table>
		</form>
	</div>
	<script>
		function validation() {
			const biTitle = document.querySelector('#biTitle');
			if(biTitle.value.trim() < 4){
				alert('제목은 4글자 이상입니다.');
				biTitle.value = '';
				biTitle.focus();
				return false;
			}
			const biContent = document.querySelector('#biContent');
			if(biContent.value.trim() < 2){
				alert('제목은 2글자 이상입니다.');
				biContent.value = '';
				biContent.focus();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>