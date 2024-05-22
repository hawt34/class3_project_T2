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
						<h2>스토어</h2>
					</div> <!-- col-10 -->
					<hr>
				</div><!--  하위 row -->
				<div class="box2">
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="storePay-tab" data-bs-toggle="tab"
								data-bs-target="#storePay" type="button" role="tab" aria-controls="storePay"
								aria-selected="true">결제내역</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="storeCancel-tab" data-bs-toggle="tab"
								data-bs-target="#storeCancel" type="button" role="tab" aria-controls="storeCancel"
								aria-selected="false">취소내역</button>
						</li>
					</ul>
				</div><!-- box2 -->
				
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="storePay" role="tabpanel"aria-labelledby="storePay-tab">
						<table class="table table-hover" >
							<thead>
							    <tr>
								    <th scope="col">#</th>
								    <th scope="col">구매일</th>
								    <th scope="col">결제내역</th>
								    <th scope="col">결제금액</th>
								    <th scope="col">결제수단</th>
						    	</tr>
							</thead>
							<tbody>
								<c:forEach var="store_pay" items="${storePay}" varStatus="status" begin="0" end="4">
								    <tr class="${status.index % 2 == 0 ? 'table-secondary' : ''}">
								        <th scope="row">${status.index + 1}</th>
								        <td>${store_pay.store_pay_date}</td>
								        <td>0000</td>
								        <td>${store_pay.store_pay_price}</td>
								        <td>${store_pay.store_pay_type}</td>
								    </tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div><!-- tab-content 탭1 끝 -->
				<div class="tab-pane fade" id="storeCancel" role="tabpanel"aria-labelledby="storeCancel-tab">
					<table class="table table-hover" >
						<thead>
						    <tr>
								<th scope="col">#</th>
							    <th scope="col">취소일</th>
							    <th scope="col">구매일</th>
							    <th scope="col">결제내역</th>
							    <th scope="col">결제취소 금액</th>
							    <th scope="col">결제취소 수단</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="store_pay" items="${storePay}" varStatus="status" begin="0" end="4">
							    <tr class="${status.index % 2 == 0 ? 'table-secondary' : ''}">
							        <th scope="row">${status.index + 1}</th>
							        <td>${store_pay.store_pay_cancel_date}</td>
							        <td>${store_pay.store_pay_date}</td>
							        <td>
<%-- 							        ${store_pay.store_pay_type} --%>
							        0000
							        </td>
							        <td>${store_pay.store_pay_price}</td>
							        <td>${store_pay.store_pay_type}</td>
							    </tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- tab-pane fade 탭2 끝-->
				
				
				
				
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