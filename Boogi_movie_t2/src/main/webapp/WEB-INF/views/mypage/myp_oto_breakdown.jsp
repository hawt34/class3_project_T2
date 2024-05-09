<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1 대 1 문의 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myp_oto_breakdown.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/csc_sidebar.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
table {
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
  width: 5%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 35%;
}

th:nth-child(3),
td:nth-child(3) {
  width: 10%;
}
th:nth-child(4),
td:nth-child(4) {
  width: 15%;
}
th:nth-child(5),
td:nth-child(5) {
  width: 10%;
}
th:nth-child(6),
td:nth-child(6) { 
   width: 15%;  
} 
th:nth-child(7),
td:nth-child(7) { 
   width: 10%;  
} 
.myp_inquiry > img {
	width:27px;
	height:27px;
}
.myp_inquiry {
	vertical-align: middle;
	font-weight: bold;
	font-size: 30px;
	margin: 20px 0;
}
#myp_title {
	margin-top: 20px;
}

</style>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/inc/admin_header.jsp"></jsp:include>
</header>
<div class="container">
	<div class="row">
		<!--사이드 바  -->
		<div class="col-2">
			<jsp:include page="/WEB-INF/views/mypage/inc/myp_aside.jsp"></jsp:include>
		</div>
		<!-- content 영역 -->
		<div class="col-10">
			<div id="myp_title">
				<h1>1 대 1 문의 내역</h1>
			</div>
			<hr>
			<div class="mp_wrap">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">나의 문의내역</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">문의내역 답변</button>
					</li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
					<div class="myp_inquiry">
						<img src="${pageContext.request.contextPath }/resources/images/inquiryIcon.svg">나의 문의내역
					</div>
					<!--문의 내역 게시판-->
					<div class="admin_review_body">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>문의유형</th>
								<th>문의지점</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty otoList} ">
									<tr>
										<td colspan="7">게시판이 비어있습니다</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="oto" items="${otoList}">
										<tr>
											<td>${oto.oto_num}</td>
											<td onclick="location.href='myp_oto_detail?oto_num=${oto.oto_num}'">${oto.oto_subject} </td>
											<td>${oto.member_id} </td>
											<td>${oto.oto_category} </td>
											<td>${oto.theater_name }</td>
											<td>
												<button type="button" class="btn btn-outline-primary" 
													onclick="location.href='myp_oto_modifyForm?oto_num=${oto.oto_num}'">수정</button>
											</td>
											<td>
												<button type="button" class="btn btn-outline-primary" onclick="otoConfirm(${oto.oto_num})">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</tbody>
					</table>
					</div>
					
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					<div class="myp_inquiry">
						<img src="${pageContext.request.contextPath }/resources/images/inquiryIcon.svg">문의내역 확인
					</div>
					<!-- 문의 내역 확인 -->
					<div class="admin_review_body">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>문의유형</th>
								<th>문의지점</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="oto" items="${otoReplyList } ">
								<c:choose>
									<c:when test="${empty otoReplyList} ">
										<tr>
											<td colspan="7">게시판이 비어있습니다</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td>${oto.oto_num }</td>
											<td>${oto.oto_subject }</td>
											<td>${oto.member_id }</td>
											<td>${oto.oto_category }</td>
											<td>${otoTheater }</td>
											<td>
												${oto.oto_reply_status }
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
					</table>
					</div>
				</div>
				</div>
			</div>
			
		
		</div>
	</div>
</div>

<footer>
	<jsp:include page="/WEB-INF/views/inc/admin_footer.jsp"></jsp:include>
</footer>
<script type="text/javascript">
	function otoConfirm(num) {
		if(confirm("삭제하시겠습니까?")) {
			location.href="myp_oto_delete?oto_num=" + num;
		}
	};
</script>
</body>
</html>