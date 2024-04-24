<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/member_login.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<div class="row container">
	<h1>로그인</h1>
	<hr>
	<div class="col input-box">
		<form action="/action_page.php" method="post">
		<label for="id">아이디</label>
		<input type="text" id="id" name="id" placeholder="아이디를 입력하세요">

		<label for="pwd">비밀번호</label>
		<input type="text" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
	
  
		<button type="submit" class="btn btn-outline-primary">로그인</button>
		<button type="button" class="btn btn-outline-primary">아이디 비밀번호 찾기</button>
		<button type="button" class="btn btn-outline-primary">회원가입</button>
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