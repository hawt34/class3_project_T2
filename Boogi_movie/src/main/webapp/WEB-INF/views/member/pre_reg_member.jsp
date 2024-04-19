<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 확인하기</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<form action="action_page.php" method="post">
<div class="container">
    <h1>가입 확인하기</h1>
    <hr>
    <div class="form_item">
    	<label for="name"><b>이름</b></label>
    	<input type="text"  name="name" id="name" required>
    	<span></span>
    </div>
    <div class="form_item">
    	<label for="birth"><b>생년월일</b></label>
    	<input type="text"  name="birth" id="birth" required>
    	<span></span>
    </div>
</div>
<div class="regist_final">
	<hr>
	<button type="submit" class="registerbtn">확인하기</button>
	<div class="container signin">
		<p>이미 가입하셨나요? <a href="#">돌아가기</a>.</p>
	</div>
</div>
</form>
</body>
</html>


