<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');
body { 
	font-family: "Noto Sans KR", sans-serif; 
	font-optical-sizing: auto;
	font-weight: 400;
	font-style: normal;
}

.container1{
	height : 900px;
	width: 1400px; /* 해상도 1200*/
}

.container2{
	margin-top: 20px;
}

.text1{
	text-align: center;
	margin-top: 40px;	
}

.box1{
	margin-top: 40px;
	margin-left: 150px;
}

* {box-sizing: border-box}

input[type=text], input[type=password]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.movTaste{
  width: 100%;
  padding: 15px 15px 15px 0;
  margin: 5px 0 22px 0;
  border: none;
  height : 5%;
  display: flex; /* 요소들을 가로로 정렬하기 위해 flexbox 사용 */
  align-items: center; /* 체크박스와 텍스트를 수직 중앙 정렬 */
}



input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}


</style>
</head>
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div><!-- row box1  -->
			
			<div class="col-md-9">
				<h2>회원탈퇴</h2>
				<hr>
				<div class="text1">
					<h5>고객님의 개인정보를 위해 비밀번호를 재입력 해주세요.</h5>
<!-- 				<div class="member_row"> -->
				    <div class="form_item w-75 box1">
				    	<input type="text" required>
				    </div><!-- form item -->
				    <form action="myp_withdraw_finish_pro" method="post">
						<section class="content">
							<button type="submit" class="btn btn-outline-primary btn-lg">회원탈퇴하기</button>
						</section>
					</form>
				</div><!-- text1 -->
			</div><!-- col-md-10 box1 -->
		</div><!-- row -->
	</div><!-- container2 -->
</div><!-- container1 -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">
</body>
</html>