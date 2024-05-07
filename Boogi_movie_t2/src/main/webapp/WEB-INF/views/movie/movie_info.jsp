<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/movie_info1.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
	<header>
		<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	</header>
	<div id="wrap">
        		
		<article>
			<iframe width="1400px" height="600px"  src="${movie.movie_trailler}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</article>
		<section>
			<div class="content">
				<h1>영화 상세페이지</h1>
				<div class="list">
					<div class="movie">
						<img src="${pageContext.request.contextPath}/resources/images/${movie.movie_poster}">
						<button type="button" class="btn btn-outline-primary">예매하기</button>
					</div>
					<div class="movieInfo">
						<ul>
							<li><span>제목 : ${movie.movie_name}  </span> </li>
							<li><span>개봉 : ${movie.movie_open_date} 	</span>  </li>
							<li><span>감독 : ${movie.movie_director} </span></li>
							<li><span>등급 : ${movie.movie_grade}  </span> </li>
							<li><span>줄거리 : ${movie.movie_summary}</span> </li>
							
						</ul>
						<button type="button" class="btn btn-outline-primary">뒤로가기</button>
					</div>	
				</div>
			</div>
			<div class="reviewContents">
			<form action="reviewPro" method="post">	
				<div class="star-rating">
				    <input type="radio" class="star" value="1">
    				<input type="radio" class="star" value="2">
				    <input type="radio" class="star" value="3">
				    <input type="radio" class="star" value="4">
				    <input type="radio" class="star" value="5">
				</div>
				<div class="review">
  				<h2>관람평</h2>
  				<c:choose>
    				<c:when test="${not empty sessionScope.sId}">
        				<textarea id="reviewText" class="form-control" rows="3" cols="2" maxlength="50" placeholder="50자 이내로 부탁드리겠습니다."></textarea>
    				</c:when>
    				<c:otherwise>
        				<textarea id="reviewText" class="form-control" rows="3" cols="2" maxlength="50" placeholder="사랑하는 고객님 로그인먼저 부탁드리겠습니다."></textarea>
    				</c:otherwise>
				</c:choose>
  				</div>	
				<button type="submit" class="btn btn-outline-primary"  id="submitReviewBtn">별점주기 & 관람평 남기기</button>
				 <!-- hidden input으로 값을 추가 -->
    			<input type="hidden" id="ratingInput" name="rating" value="">
   				<input type="hidden" id="reviewTextInput" name="review_text" value="">
   				<input type="hidden" id="movie_num" name="movie_num" value="${movie.movie_num}">
   				<input type="hidden" id="member_id" name="member_id" value="${sessionScope.sId}">
   				
			</form>
			</div>
			<div class="showReview">
				 
				<c:forEach var="review" items="${reviews}">
        		<div class="rating">
            	<c:forEach begin="1" end="${review.rating}">
                <span class="filled"></span>
           		 </c:forEach>
        		</div>
        		<div class="reviewTexts">
        		<span class="review-text">${review.review_text}</span>
        		<span class="member-id">${review.member_id}</span>
        		<span class="review-date">${fn:substring(review.review_date, 0, 10)}</span>
    			<c:if test="${review.member_id eq sessionScope.sId}">
                <button onclick="editReview('${review.review_id}')">수정</button>
                <button onclick="deleteReview('${review.review_id}')">삭제</button>
            	</c:if>
    			</div>
    			</c:forEach>
			</div>
		</section>		    
		<footer> 
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
		</footer>
	</div>
</body>
<script type="text/javascript">
$("#submitReviewBtn").click(function(event) {
    // 세션 아이디 가져오기
    let sessionId = "${sessionScope.sId}";

    // 관람평 가져오기
    let reviewText = $("#reviewText").val().trim();
    // 로그인 여부 확인
    if (!sessionId) {
        if (confirm("로그인이 필요합니다. 상단의 로그인영역으로 이동하시겠습니까?")) {
            // 로그인 페이지로 이동
        	$('a[href="member_login"]').focus();
        }
        event.preventDefault(); // 폼 제출 중단
        return;
    }


    // 관람평이 비어 있는지 확인
    if (reviewText === "") {
        alert("관람평을 입력해주세요.");
        $("#reviewText").focus();
        event.preventDefault(); // 폼 제출 중단
        return;
    }

    // 별점 가져오기
    let rating = $('.star-rating input:checked').val();
    if (!rating) {
        // 별점을 선택하지 않았을 때 기본값으로 0점 설정
        rating = 0;
    }

    // 별점과 관람평을 hidden input에 설정
    $("#ratingInput").val(rating);
    $("#reviewTextInput").val(reviewText);
});

</script>




</html>