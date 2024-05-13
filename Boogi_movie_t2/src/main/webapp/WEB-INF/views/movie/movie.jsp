<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/movie.css"	rel="stylesheet" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">
		<article>
			<video src="${pageContext.request.contextPath}/resources/home.mp4"
				autoplay muted>
			</video>
		</article>
		<section>
			
			<div class="nowMovie">
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movie'">현재
					상영작</button>
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href='movieFuture'">상영예정작</button>
				<button type="button" class="btn btn-outline-primary" onclick="window.location.href=''">상영 중인 영화찾기</button>
			</div>
			<div class="list">
			<c:forEach var="movie" items="${movieInfo}" varStatus="loop" begin="0">
    		<div class="movie">
            <img src="${movie.movie_poster}">
            <p>${movie.movie_name}</p>
            <input type="hidden" class="movie_num" name="movie_num" value="${movie.movie_num}">
            <button type="button" class="btn btn-outline-primary movieTicket">예매하기</button>
            <button type="button" class="btn btn-outline-primary detail_button">상세보기</button>
    		</div>
			</c:forEach>
			</div>
			
		</section>
		<footer>
			<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
	</div>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		 $(document).ready(function() {
			    // 예매하기 버튼 클릭 이벤트 처리
			    $(".list").on("click", ".movieTicket", function() {
			        // 세션 아이디 확인
			        let sId = "${sessionScope.sId}";
			        // 클릭한 영화의 번호 가져오기
			        let movie_num = $(this).siblings(".movie_num").val();
			        
			        if (!sId) {
			            // 로그인되어 있지 않다면 확인 후 이동
			            if (confirm("로그인이 필요합니다. 상단의 로그인 영역으로 이동하시겠습니까?")) {
			                // 로그인 페이지로 이동
			            	$('a[href="member_login"]').focus();
			            }
			        } else {
			            // 로그인되어 있다면 예매 페이지로 이동
			            window.location.href = 'tic_ticketing';
			        }
			    });

			    // 상세보기 버튼 클릭 이벤트 처리
			    $(".list").on("click", ".detail_button", function() {
			        // 클릭한 영화의 번호 가져오기
			        let movie_num = $(this).siblings(".movie_num").val();
			        // 상세보기 페이지로 이동
			        window.location.href = 'movieInfo?movie_num=' + movie_num;
			    });
			});
	</script>
</body>
</html>