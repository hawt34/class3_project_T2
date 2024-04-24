<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_main.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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


</style>
</head>
<body>
<header>
	<jsp:include page="inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
		
			<div class="col-md-2">
				<jsp:include page="sidebar/sidebar.jsp"></jsp:include>
			</div>	<!-- col-md-2 사이드바  -->
			
			<div class="col-md-10 box1">
				<h2>정보수정</h2>
				<hr>
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="name" >이름</label>
			    <input type="password" class="form-control" placeholder="이름을 입력하세요">
			  </div>
			  
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="id" >아이디</label>
			    <input type="password" class="form-control" placeholder="아이디 입력">
			  </div>
			
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="passwd" >비밀번호</label>
			    <input type="password" class="form-control" placeholder="비밀번호 입력">
			  </div>
			<br>
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="password2" >비밀번호 확인</label>
			    <input type="password" class="form-control" placeholder="비밀번호 입력">
			  </div>
			
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="password2" >생년월일</label>
			    <input type="password" class="form-control" placeholder="생년월일 입력">
			  </div>
			
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="password2" >주소</label>
			    <input type="password" class="form-control" placeholder="주소 입력">
			  </div>
			
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="password2" >Email</label>
			    <input type="password" class="form-control" placeholder="이메일 입력">
			  </div>
			
			  <div class="col-auto w-50 d-grid gap-3">
			    <label for="password2" >전화번호</label>
			    <input type="password" class="form-control" placeholder="전화번호 입력">
			  </div>
			
			<div class="position-relative button-container box3">
			  <div class="position-absolute top-50 start-50 translate-middle">
				<section class="content">
				  <div class="box bg-1">
				    <button class="button button--round-s button--ujarak button--border-medium button--text-thick" onclick="location.href='mainpage.jsp'">수정완료</button>
				  </div>
				</section>
				</div>
		    </div>  <!-- button-container -->			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			</div><!-- col-md-10 -->
		</div><!-- row  -->	
	</div><!--container2 -->
</div> <!--  container1  -->
	<footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>