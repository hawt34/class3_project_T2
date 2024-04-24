<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theater.css" type="text/css">
</head>

<body>
	<header>
		<%-- 상단 로그인 메뉴 영역 --%>
		<%-- inc/top.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
		<%-- <jsp:include> 태그에서 상대 주소 지정 시 / 는 webapp 디렉토리를 가리킴 --%>
		
	</header>
	<article>
	<div class="theater_all">
		<div id="theater_top">
			<h1>전체 극장</h1>
			<hr>
			<div class="theater_top_content">
				<nav class="nav nav-pills nav-justified">
					 <a class="nav-link" href="#">해운대점</a>
					 <a class="nav-link" href="#">광안리점</a>
					 <a class="nav-link" href="#">서면점</a>
					 <a class="nav-link" href="#">남포점</a>
					 <a class="nav-link" href="#">부산대점</a>
					 <a class="nav-link" href="#">동래점</a>
					 <a class="nav-link" href="#">수영점</a>
					 <a class="nav-link" href="#">노포점</a>
					 <a class="nav-link" href="#">기장점</a>
				</nav>
				<div class="theater_top_content">
					<h4>마이 극장 정보</h4>
					 <!-- 비로그인 상태 -->
					<input type="button" class="btn btn-outline-primary btn-sm" value="로그인하기">
					 <!-- 로그인 상태 -->
					<input type="button" class="btn btn-outline-primary btn-sm" value="마이 극장 관리">
				</div>	
			</div>	
		</div>
		<hr>		
		<div id="theater-event">
			<h1>극장 이벤트</h1>
			<a href=""><img src="${pageContext.request.contextPath}/resources/images/theater_ex.jpg"></a>
		</div>
		
	</div>	
	
	
	</article>
	<footer>
		<%-- 하단 웹사이트 정보 영역 --%>
		<%-- inc/bottom.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
	</footer>



<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
</body>
</html>