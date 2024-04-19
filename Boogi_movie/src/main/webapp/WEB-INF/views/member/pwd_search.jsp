<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<form action="action_page.php" method="post">
<div class="container">
    <h1>비밀번호 찾기</h1>
    <hr>
    <div class="form_item">
    	<label for="id"><b>아이디</b></label>
    	<input type="text"  name="id" id="id" required>
    	<span></span>
    </div>
    <div class="form_item">
    	<label for="tel"><b>전화번호</b></label>
    	<input type="text"  name="tel" id="tel" required>
    	<span></span>
    </div>
</div>
<div class="regist_final">
	<hr>
	<button type="submit" class="registerbtn">비밀번호 찾기</button>
</div>
</form>
</body>
</html>

