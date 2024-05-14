<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<section class="member_section">
<div class="member_title">
	<h3>새로운 비밀번호 입력</h3>
    <hr>
</div>
<form action="member_pwd_update" method="post">
<div class="member_row">

    <div class="form_item">
    	<label for="member_pwd"><b>비밀번호</b></label>
    	<input type="password"  name="member_pwd" id="member_pwd" required>
    	<span></span>
    </div>
    
    <div class="form_item">
    	<label for="member_pwd2"><b>비밀번호 확인</b></label>
    	<input type="password"  name="member_pwd2" id="member_pwd2" required>
    	<span></span>
    </div>
	<input type="hidden" value="${member_id }" id ="member_id" name = "member_id">
	<div class="regist_final">
		<hr>
    	<button type="submit" class="btn btn-outline-primary">비밀번호 바꾸기</button>
	</div>
	</div>
</form>

</section>

<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>
<script>
// 	todo 
</script>
</body>
</html>

