<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>1 대 1 문의 내역</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myp_oneOnone_breakdown.css"> --%>
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
  width: 10%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 40%;
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


</style>
</head>
<body>
<div class="container">
	<div class="row">
		<!--사이드 바  -->
		<div class="col-2">
			<jsp:include page="csc_sidebar.jsp"></jsp:include>
		</div>
		<!-- content 영역 -->
		<div class="col-10">
			<h1>1 대 1 문의 내역</h1>
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
					<div class="mp_inquiry">
						나의 문의내역
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
								<th>상태</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td>예매가 안되요</td>
								<td>admin</td>
								<td>예매/결제</td>
								<td>미확인</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
							</tr>
							<tr>
								<td>2</td>
								<td>영화 언제 개봉하나요?</td>
								<td>hong123</td>
								<td>영화</td>
								<td>확인</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
							</tr>
							<tr>
								<td>1</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>미확인</td>
								<td>
									<button type="button" class="btn btn-outline-primary">수정</button>
								</td>
							</tr>
						</tbody>
					</table>
					</div>
					
				</div>
				<div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
					<div class="mp_inquiry">
						문의내역 확인
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
								<th>상태</th>
<!-- 								<th>수정/삭제</th> -->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>3</td>
								<td>예매가 안되요</td>
								<td>admin</td>
								<td>예매/결제</td>
								<td>답변</td>
<!-- 								<td> -->
<!-- 									<button type="button" class="btn btn-outline-primary">수정</button> -->
<!-- 									<button type="button" class="btn btn-outline-primary">삭제</button> -->
<!-- 								</td> -->
							</tr>
							<tr>
								<td>2</td>
								<td>영화 언제 개봉하나요?</td>
								<td>hong123</td>
								<td>영화</td>
								<td>답변</td>
<!-- 								<td> -->
<!-- 									<button type="button" class="btn btn-outline-primary">수정</button> -->
<!-- 									<button type="button" class="btn btn-outline-primary">삭제</button> -->
<!-- 								</td> -->
							</tr>
							<tr>
								<td>1</td>
								<td>junhyuk</td>
								<td>이거 리뷰 써지는거냐?</td>
								<td>4.8점</td>
								<td>답변</td>
<!-- 								<td> -->
<!-- 									<button type="button" class="btn btn-outline-primary">수정</button> -->
<!-- 									<button type="button" class="btn btn-outline-primary">삭제</button> -->
<!-- 								</td> -->
							</tr>
						</tbody>
					</table>
					</div>
				</div>
				</div>
			</div>
			
		
		</div>
	</div>
</div>

</body>
</html>