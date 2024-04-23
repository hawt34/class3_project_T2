<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 확인하기</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>


<section class="member_section">
	<div class="member_title">
	    <h3>가입 확인하기</h3>
	    <hr>
    </div>
	<form action="action_page.php" method="post">
		<div class="member_row">
	
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
			<button type="submit" class="btn btn-outline-primary">가입 확인하기</button>
			<button type="button" class="btn btn-outline-primary">돌아가기</button>
		</div>
	</form>
</section>



<header>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</header>


</body>
</html>


