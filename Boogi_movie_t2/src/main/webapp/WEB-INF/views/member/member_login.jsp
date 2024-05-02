<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/member_login.css" rel="stylesheet" type="text/css">
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

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>