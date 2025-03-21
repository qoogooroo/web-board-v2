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

.form-signin input[type="text"] {
	margin-bottom: -1px;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
	margin-bottom: 10px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
}
</style>

</head>
<body class="text-center">

	<main class="form-signin w-100 m-auto">
		<form method="POST" action="/user/login" onsubmit="return validation()">
			<img class="mb-4" src="/resources/svg/bootstrap-logo.svg"
				alt="" width="72" height="57">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>

			<div class="form-floating">
				<input type="text" class="form-control" id="uiId" name="uiId" 
					placeholder="아이디"> <label for="uiId">아이디</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="uiPwd" name="uiPwd"
					placeholder="비밀번호"> <label for="uiPwd">비밀번호</label>
			</div>

			<div class="checkbox mb-3">
				<label> <input type="checkbox" value="remember-me">
					아이디 기억하기
				</label>
			</div>
			<button class="w-40 btn btn-lg btn-primary" type="submit">로그인</button>
			<button class="w-40 btn btn-lg btn-secondary" type="button">회원가입</button>
			<p class="mt-5 mb-3 text-muted">&copy; 2025-2026</p>
		</form>
	</main>
	<script>
	function validation(){
		const uiId = document.querySelector('#uiId');
		if(uiId.value.trim().length<4){
			alert('아이디는 4글자 이상입니다.');
			uiId.focus();
			return false;
		}
		const uiPwd = document.querySelector('#uiPwd');
		if(uiPwd.value.trim().length<4){
			alert('비밀번호는 4글자 이상입니다.');
			uiPwd.focus();
			return false;
		}
		return true;
	}
	
	</script>


</body>
</html>