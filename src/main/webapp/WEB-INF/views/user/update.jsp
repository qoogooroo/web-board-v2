<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>

<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	align-items: center;
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 330px;
	padding: 15px;
}

.form-signin .form-floating:focus-within {
	z-index: 2;
}

.form-signin .f-top {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin .f-bottom {
	margin-bottom: 10px;
	border-top-right-radius: 0;
	border-top-left-radius: 0;
}

.form-signin .normal {
	margin-bottom: -1px;
	border-radius: 0;
}
</style>

</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form method="POST" action="/user/update" onsubmit="return validation()">
			<img class="mb-4" src="/resources/svg/bootstrap-logo.svg" alt=""
				width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">회원수정</h1>

			<div class="form-floating">
				<input type="text" class="form-control f-top" id="uiId" name="uiId"
					placeholder="아이디" value="${user.uiId}"> <label for="uiId">아이디</label>
			</div>
			<div class="form-floating">
				<input type="text" class="form-control normal" id="uiName"
					name="uiName" placeholder="이름" value="${user.uiName}"> <label for="uiName">이름</label>
			</div>
			<div class="form-floating">
				<select class="form-control f-bottom" id="uiGrade" name="uiGrade">
					<option value="">선택</option>
					<option value="1" ${user.uiGrade=="1"?"selected":""}>일반</option>
					<option value="2" ${user.uiGrade=="2"?"selected":""}>관리자</option>
				</select> <label for="uiGrade">회원등급</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">수정</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2025-2026</p>
		</form>
	</main>
	<script>
		function validation() {
			// document.getElementById('uiId');
			// document.getElementsByName('uiId')[0];
			// document.querySelector('#uiId');
			// document.querySelector('[id=uiId]');x
			// document.querySelectorAll('[name=uiId]')[0];
			const uiId = document.querySelector('#uiId');
			if (uiId.value.trim().length < 4) {
				alert('아이디는 4글자 이상입니다.');
				uiId.value='';
				uiId.focus();
				return false;
			}
			const uiName = document.querySelector("#uiName");
			if (uiName.value.trim().length < 2){
				alert('이름은 2글자 이상입니다.');
				uiId.value='';
				uiName.focus();
				return false;
			}
			const uiGrade = document.querySelector("#uiGrade");
			if(uiGrade.value===''){
				alert('회원등급을 선택해주세요.');
				uiGrade.focus();
				return false;
			}
				return true;
		}
	</script>


</body>
</html>