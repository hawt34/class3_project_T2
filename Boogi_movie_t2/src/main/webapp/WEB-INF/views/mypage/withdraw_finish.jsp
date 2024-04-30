<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_withdraw3.css">
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
		
/* .button-container { */
/*             display: flex; */
/*             justify-content: center; */
            
/*         } */
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
			</div><!-- col-md-2 사이드바임 -->
				<div class="col-md-10">
					<h2>회원탈퇴</h2>
					<hr>
					<div class="box1">
						<h1>탈퇴처리되었습니다.</h1>
						<div class="row">
							<div class="col-md-4"> </div>
							<div class="col-md-4">
								<section class="content">
									<div class="d-grid gap-2 d-md-block box2">
									  <button class="btn btn-outline-primary btn-lg" type="button" onclick="location.href='../main.jsp'">메인페이지</button>
									  <button class="btn btn-outline-primary btn-lg" type="button" onclick="location.href='../../member/member_reg_member.jsp'">회원가입</button>
									  <button class="btn btn-outline-primary btn-lg" type="button" onclick="location.href='../../member/member_login.jsp'">로그인</button>
									</div>
								</section>
						    </div><!-- col-md-4 -->
							<div class="col-md-4"> </div>
					    </div><!-- row -->
					</div>  
			    </div><!-- "col-md-10" -->
		    </div><!-- row -->
    	</div> <!-- container2 -->
    </div> <!-- container1 -->
    
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>