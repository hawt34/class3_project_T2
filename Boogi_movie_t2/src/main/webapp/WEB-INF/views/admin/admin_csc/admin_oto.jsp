<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일대일 문의 내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
</script>
<style type="text/css">
	.admin_csc_selectBox {
		display: flex;
		justify-content: space-around;
	}
	
	h3 {
		margin-left: 20px;
	}
	
	h1 {
		font-style: italic;
	}
	
	/* 테이블 css */
	.admin_ono_body > table {
	  border-collapse: collapse;
	  width: 90%;
	  margin: 0rem auto;
	  box-shadow: 4px 4px 10px 0 rgba(0, 0, 0, 0.1);
	  background-color: white;
	  text-align: center;
	}
	
	 /* 테이블 행 */
	th, td {
	  padding: 8px;
	  border-bottom: 1px solid #ddd;
	}
	
	th {
	  background-color: #1b1b1b;
	  color: #ddd;
	}
	
	/* 테이블 올렸을 때 */
	tbody tr:hover {
	  background-color: #eee;
	  opacity: 0.9;
	  cursor: pointer;
	}
	
	/* 테이블 비율 */
	th:nth-child(1),
	td:nth-child(1) {
	  width: 10%;
	}
	
	th:nth-child(2),
	td:nth-child(2) {
	  width: 10%;
	}
	
	th:nth-child(3),
	td:nth-child(3) {
	  width: 25%;
	}
	th:nth-child(4),
	td:nth-child(4) {
	  width: 10%;
	}
	th:nth-child(5),
	td:nth-child(5) {
	  width: 10%;
	}
	th:nth-child(6),
	td:nth-child(6) {
	  width: 10%;
	}
	th:nth-child(7),
	td:nth-child(7) {
	  width: 10%;
	}
	.admin_ono_head {
	margin: 30px 0;
	text-align: right;
	border
	}
	
	.admin_ono_title {
		float: left;
		font-size: 30px;
		margin-left: 100px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
	</header>
	
<!-- 	<div class="container"> -->
		<div class="row">
			<!-- side 영역 -->
			<div class="col-2">
				<jsp:include page="/WEB-INF/views/inc/admin_aside.jsp"></jsp:include>
			</div>
			<!-- content 영역 -->
			<div class="col-9">
				<div class="admin_ono_head">
					<div class="admin_ono_title">1대1 문의 관리</div>
						<div class="admin_ono_search">
							<table>
								<tr>
									<td>
							<!-- 문의 유형 카테고리 -->
										<select class="form-select form-select-sm w-50"
											aria-label="Default select example" name="csc_category">
											<option selected value="">문의 유형 선택</option>
											<option value="movie">영화</option>
											<option value="theater">극장</option>
											<option value="payment">예매/결제</option>
											<option value="coupon">쿠폰</option>
											<option value="memberInfo">회원정보</option>
										</select> 
									</td>
									<td>
										<select class="form-select form-select-sm w-50"
											aria-label="Default select example" name="csc_theater">
											<option selected>문의 지점 선택</option>
											<option value="부산진구">부산진구</option>
											<option value="해운대구">해운대구</option>
											<option value="북구">북구</option>
											<option value="남구">남구</option>
											<option value="서구">서구</option>
										</select>
									</td>
								</tr>
							</table>
						</div>
					</div>
				
				<div class="admin_ono_body">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>문의제목</th>
								<th>문의유형</th>
								<th>문의지점</th>
								<th>작성일</th>
								<th>답변상태</th>
								<th>답변</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty otoList }">
									<tr>
										<td colspan="7">게시물이 없습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="oto" items="${otoList }">
										<tr>
											<td>${oto.oto_num }</td>
											<td>${oto.member_id }</td>
											<td>${oto.oto_subject }</td>
											<td>${oto.oto_category }</td>
											<td>${oto.theater_name }</td>
											<td>${oto.oto_date }</td>
											<td>${oto.oto_reply_status }</td> <!-- 답변 상태 -->
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="admin_oto_reply(${oto.oto_num})">답변하기</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	<footer>
		<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
	</footer>
	
	<script type="text/javascript">
		function admin_oto_reply(num) {
			window.open("admin_oto_detail?oto_num=" + num, "_self");
		}
		function admin_notice_withdraw() {
			location.href="admin_notice_delete";
		}
	
	
	</script>
	
</body>
</html>