<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_login.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> 
<style>

input[type=password]{
   width: 100%;
   padding: 12px 20px;
   margin: 20px 10px 10px 0px;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}	

</style>
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<div class="row container">
	<h3>로그인</h3>
	<hr>
	<div class="col input-box">
		<form action="member_login_pro" method="post">
			<label for="id">아이디</label>
			<input type="text" id="id" name="member_id" placeholder="아이디를 입력하세요">
	
			<label for="pwd">비밀번호</label>
			<input type="password" id="pwd" name="member_pwd" placeholder="비밀번호를 입력하세요">
		
	  		<div class="loginBtns">
				<button type="submit" class="btn btn-outline-primary">로그인</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='member_search_id'">아이디 찾기</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='member_search_pwd'">비밀번호 찾기</button>
				<button type="button" class="btn btn-outline-primary" onclick="location.href='member_pre_reg_member'">회원가입</button>
			</div>
		</form>
	</div>
  			
	<div class="col login-box">
		<h2>소셜 로그인</h2>
		<a href="#" class="social-button" id="google-connect"> <span>구글 로그인</span></a>
		<a href="#" class="social-button" id="kakao-connect"> <span>카카오톡 로그인</span></a>
	</div>
</div>

<header>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js
"></script>
</body>
</html>