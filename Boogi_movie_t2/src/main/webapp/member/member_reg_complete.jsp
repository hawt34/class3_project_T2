<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>축하 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css
" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/member_reg_complete.css" rel="stylesheet">
</head>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

	
<div class="row container">
	<div class="col-md-2">
		<div class="side_var">
			<jsp:include page="../inc/admin_aside.jsp"></jsp:include>
		</div>
	</div>
	<div class="col-md-10" style="margin-top : 100px;">
		<div class="message">
			이연태님 회원가입을 환영합니다!
			<br>
		</div>
		<button type="button" class="btn btn-outline-primary">메인</button>
		<button type="button" class="btn btn-outline-primary">영화</button>
		<button type="button" class="btn btn-outline-primary">예매</button>
	</div>
</div>
  
<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>