<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_info_modify.css">
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
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>	<!-- col-md-2 사이드바  -->
				<div class="col-md-10">
					<h2>회원정보수정</h2>
					<hr>
				<div class="box1">
	    			<label for="name">이름</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="이름을 입력" required>
				    </div><!-- form item -->
				
	    			<label for="id">아이디</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="아이디를 입력" required>
				    </div><!-- form item -->
				
	    			<label for="pwd">비밀번호</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="비밀번호를 입력" required>
				    </div><!-- form item -->
				
	    			<label for="pwd2">비밀번호 확인</label>
				  	<div class="form_item w-75 ">
				    	<input type="text" placeholder="비밀번호 확인" required>
				    </div><!-- form item -->
				
	    			<label for="birth">생년월일</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="생년월일" required>
				    </div><!-- form item -->
				
	    			<label for="postCode">주소</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="주소를 입력" required>
				    </div><!-- form item -->
				
	    			<label for="email">Email</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="이메일 입력" required>
				    </div><!-- form item -->
				
	    			<label for="phoneNum">전화번호</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="전화번호 입력" required>
				    </div><!-- form item -->
				</div><!-- box1 -->
				<div class="d-grid gap-2 col-3 box2">
					  <button class="btn btn-outline-primary btn-lg" type="button" onclick="location.href='myp_main'">수정완료</button>
				</div>
			</div><!-- col-md-10 -->
		</div><!-- row  -->	
	</div><!--container2 -->
</div> <!--  container1  -->
	<footer>
		<jsp:include page="inc/myp_footer.jsp"></jsp:include>
	</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>