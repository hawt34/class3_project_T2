<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<section class="member_section">
<div class="member_title">
	<h3>아이디 찾기</h3>
    <hr>
</div>
<form action="member_search_id_result_pro" method="post">
<div class="member_row">

    <div class="form_item">
    	<label for="member_name"><b>이름</b></label>
    	<input type="text"  name="member_name" id="member_name" required>
    	<span></span>
    </div>
    <div class="form_item">
    	<label for="member_birth"><b>생년월일</b></label>
    	<input type="text"  name="member_birth" id="member_birth" required>
    	<span></span>
    </div>

	<div class="regist_final">
		<hr>
    	<button type="submit" class="btn btn-outline-primary">아이디 찾기</button>
	</div>
	</div>
</form>

</section>

<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>

