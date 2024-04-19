<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<style type="text/css">
	#myTheater {
		margin: 25px 5px;  padding:30px 5px; 
	}
	#allTheater {
	 	margin: 25px 5px;  padding:30px 5px; 
	}
	#theaterEvent {
		margin: 25px 5px;  padding:30px 5px; 
	}
	.theater-contents {
		margin: 25px 5px;  padding:10px 5px; 
	}
	
	
</style>


</head>

<body>
	<header>
		<%-- 상단 로그인 메뉴 영역 --%>
		<%-- inc/top.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
		<%-- <jsp:include> 태그에서 상대 주소 지정 시 / 는 webapp 디렉토리를 가리킴 --%>
<%-- 		<jsp:include page="/inc/top.jsp"></jsp:include> --%>
	</header>
	<article>
	<div class="container-md">
		<div id="allTheater">
			<h3>전체 극장</h3>
			<div class="theater-contents">
				<a href="${pageContext.request.contextPath}/theater/theater_detail.jsp">
					<button type="button" class="btn btn-outline-secondary">해운대점</button>
				</a>
				<a href="${pageContext.request.contextPath}/theater/theater_detail.jsp">
					<button type="button" class="btn btn-outline-secondary">광안리점</button>
				</a>
				<a href="${pageContext.request.contextPath}/theater/theater_detail.jsp">
					<button type="button" class="btn btn-outline-secondary">서면점</button>
				</a>
				<button type="button" class="btn btn-outline-secondary">남포점</button>
				<button type="button" class="btn btn-outline-secondary">부산대점</button>
				<button type="button" class="btn btn-outline-secondary">동래점</button>
				<button type="button" class="btn btn-outline-secondary">수영점</button>
				<button type="button" class="btn btn-outline-secondary">사상점</button>
				<button type="button" class="btn btn-outline-secondary">노포점</button>
				<button type="button" class="btn btn-outline-secondary">기장점</button>
			</div>	
		</div>
		
		<div id="myTheater">
			<h3>마이 극장</h3>
			<div class="theater-contents">
				<button type="button" class="btn btn-outline-primary btn-sm">로그인하기</button>
			</div>	
		</div>
		
		<div id="theaterEvent">
			<h3>극장 이벤트</h3>
			<img src="${pageContext.request.contextPath}/images/ex.jpg">
		</div>
		
	</div>	
	
	
	</article>
	<footer>
		<%-- 하단 웹사이트 정보 영역 --%>
		<%-- inc/bottom.jsp 페이지 삽입(<jsp:include> 태그 사용) --%>
<%-- 		<jsp:include page="/inc/bottom.jsp"></jsp:include> --%>
	</footer>



</body>
</html>