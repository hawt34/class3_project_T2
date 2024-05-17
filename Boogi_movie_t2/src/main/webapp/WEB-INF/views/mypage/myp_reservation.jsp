<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_reservation.css">
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
hr{
	margin-top: 10px;
}
.breakdown_pageArea {
	margin-top: 20px;
	text-align: center;
}

.breakdown_pageArea > nav {
	display: inline-block;
}

</style>
</head>
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<c:set var="pageNum" value="${empty param.pageNum ? 1 : param.pageNum}" />
		<div class="row">
			<div class="col-md-2 box1">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div><!-- sidebar1 -->
				<!-- 탭 메뉴 -->
				<!-- 내용 -->
			<div class="col-md-9 box-in">
				<div class="row">
					<div class="col-10">
						<h2>예매내역</h2>
					</div> <!-- col-10 -->
					<hr>
				</div><!--  하위 row -->
				<div class="box2">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="userinfo-tab" data-bs-toggle="tab"
								data-bs-target="#userinfo" type="button" role="tab" aria-controls="userinfo"
								aria-selected="true">예매내역</button>
						</li>
					</ul>
				</div><!-- box2 -->
				<c:forEach items="${movieReservation}" var="map" varStatus="loop" begin="0" end="3">
				    <div class="row">
				        <div class="col-md-3">
				        	<img src="${map.movie_poster}" style="margin-left: 30px" width="200px" height="250px">
				        </div>
				        <div class="paybox1 col-md-6">
				            <div class="col-md-4 d-grid gap-5">
				                <input class="form-control box3 w-75" type="text" value="영화" aria-label="Disabled input example" disabled readonly>
				                <input class="form-control box3 w-75" type="text" value="관람날짜" aria-label="Disabled input example" disabled readonly>
				                <input class="form-control box3 w-75" type="text" value="상영시간" aria-label="Disabled input example" disabled readonly>
				            </div>
				            <div class="col-md-4 d-grid gap-5">
				                <input type="text" readonly class="form-control-plaintext" value="${map.movie_name}">
				                <input type="text" readonly class="form-control-plaintext" value="${map.scs_date}">
				                <input type="text" readonly class="form-control-plaintext" value="${map.theater_info}">
				            </div>
				            <div class="col-md-4 d-grid gap-5">
				                <input class="form-control box3 w-75" type="text" value="상영관" aria-label="Disabled input example" disabled readonly>
				                <input class="form-control box3 w-75" type="text" value="관람좌석" aria-label="Disabled input example" disabled readonly>
				                <input class="form-control box3 w-75" type="text" value="결제금액" aria-label="Disabled input example" disabled readonly>
				            </div>
				            <div class="col-md-4 d-grid gap-5">
				                <input type="text" readonly class="form-control-plaintext" value="${map.session_time}">
				                <input type="text" readonly class="form-control-plaintext" value="${map.ticket_seat_info}">
				                <input type="text" readonly class="form-control-plaintext" value="${map.ticket_price}">
				            </div>
				        </div>
				    </div>
				    <hr>
				</c:forEach>
					<!-- 페이징 시작 -->
					<div class="breakdown_pageArea">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<li class="page-item <c:if test="${pageNum eq 1 }">disabled</c:if>" > 
								<a class="page-link" href="myp_reservation?pageNum=${pageNum - 1}" aria-label="Previous" >
								<span aria-hidden="true" >&laquo;</span>
								</a>
							</li>
							<c:forEach var="i" begin="${pageList.startPage}" end="${pageList.endPage}">
								<c:choose>
									<c:when test="${pageNum eq i }">
										<li class="page-item active"><a class="page-link">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="myp_reservation?pageNum=${i}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="page-item <c:if test="${pageNum eq pageList.maxPage }">disabled</c:if>">
								<a class="page-link" href="myp_reservation?pageNum=${pageNum + 1}" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</ul>
					</nav>
					</div>
					<!-- 페이징 끝 -->
			</div><!-- col-md-9 box-in -->
		</div> <!-- row -->
	</div><!-- container2 -->
</div><!-- container -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">

</body>
</html>