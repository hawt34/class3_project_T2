<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="pay1.css">
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


<div class="sidebar1">
	<jsp:include page="../sidebar/sidebar.jsp"></jsp:include>
</div>


<div class="container1">

		

	
	<div class="row box1">
		<div class="top">
			<h2>예매내역</h2>
					<select>
						<option selected>1주일</option>
						<option value="1">1개월</option>
						<option value="2">3개월</option>
						<option value="3">기간 설정</option>
					</select>
		</div><!-- top -->
		<!-- 탭 메뉴 -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
					data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
					aria-selected="true">예매내역</button>
			</li>
		</ul>
		<!-- 내용 -->
		<div class="box-in">
			<div class="box2">
<!-- 				<div class="poster"> -->
					<img src="../image/img1.jpg" width="20%" height="100%">
<!-- 					<div class="title"><h4>범죄도시4</h4></div> -->
<!-- 				</div> -->
				
			</div>	
			<hr>
			<div class="box2">
				<img src="../image/img2.jpg" width="20%" height="100%">
				
				
			</div>	
			<hr>
			<div class="box2">
				<img src="../image/img3.jpg" width="20%" height="100%">
				
				
			</div>	
			<hr>
			<div class="box2">
				<img src="../image/img4.jpg" width="20%" height="100%">
				
				
			</div>	
			<hr>
		</div><!-- box-in -->
	</div><!-- row box1 -->

</div> <!-- contaier -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>