<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
	
	<script type="text/javascript">
		var maxCount = 3;								// 카운트 최대값은 3
		var count = 0;   								// 카운트, 0으로 초기화 설정
		
		function CountChecked(field){ 					// field객체를 인자로 하는 CountChecked 함수 정의
			if (field.checked) {						// 만약 field의 속성이 checked 라면(사용자가 클릭해서 체크상태가 된다면)
				count += 1;								// count 1 증가
			}
			else {										// 아니라면 (field의 속성이 checked가 아니라면)
				count -= 1;								// count 1 감소
			}
			
			if (count > maxCount) {						// 만약 count 값이 maxCount 값보다 큰 경우라면
				alert("최대 3개까지만 선택가능합니다!");	// alert 창을 띄움
			field.checked = false;						// (마지막 onclick한)field 객체의 checked를 false(checked가 아닌 상태)로 만든다.
			count -= 1;									// 이때 올라갔던 카운트를 취소처리해야 하므로 count를 1 감소시킨다.
			}
		}
	</script>
					
</header>
<div class="container1">
	<div class="container2">
		<div class="row box1">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>	
			<div class="col-md-9">
				<h2>마이페이지</h2>
				<hr>
				<blockquote class="bluejeans">
					<br>
					<div class="main">
						<h3>${member.member_name}님 안녕하세요!</h3>
					</div>
<!-- 					<section class="content"> -->
						<div class="col-6 box3">
							<button type="button" class="btn btn-outline-primary btn-lg" style="left: 20px" onclick="location.href='myp_info_modify'">회원정보수정</button>
						</div>
<!-- 					</section> -->
				</blockquote>
				<hr>
			</div><!-- col-md-10 -->
		</div><!-- row -->
		<div class="row ">
			<div class="col-md-2"> </div>
				<div class="col-md-6">
					<div class="row">
						<div class="col-10">
							<h2>예매내역</h2>
						</div>
						<div class="col-2 box2">
							<button type="button" class="btn btn-outline-primary" onclick="location.href='myp_reservation'">+ 더보기</button>
						</div>
					</div><!-- row -->
					<table class="table2 table table-hover " >
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">영화</th>
					      <th scope="col">날짜</th>
					      <th scope="col">상영시간</th>
					      <th scope="col">극장</th>
					      <th scope="col">좌석</th>
					      <th scope="col">가격</th>
					    </tr>
					  </thead>
					  <tbody>
					  
						  <c:forEach var="movie" items="${movieReservation}" varStatus="status" begin="0" end="6">
							    <tr class="${status.index % 2 == 0 ? 'table-secondary' : ''}">
							        <th scope="row">${status.index + 1}</th>
							        <td>${movie.movie_name}</td>
<%-- 							        <td>${ticket.screen_date}</td> --%>
<%-- 							        <td>${reservation.discsount_num}</td> --%>
<%-- 							        <td>${reservation.discsount_num}</td> --%>
<%-- 							        <td>${reservation.discsount_num}</td> --%>
<%-- 							        <td>${reservation.discsount_num}</td> --%>
							    </tr>
							</c:forEach>
					  
<!-- 					    <tr  class="table-secondary"> -->
<!-- 					      <th scope="row">1</th> -->
<%-- 						      <td>${movie.movie_name}</td> --%>
<!-- 						      <td>2024 / 04 / 16</td> -->
<!-- 						      <td>17:00 ~ 19:20</td> -->
<!-- 						      <td>서면</td> -->
<!-- 						      <td>K9</td> -->
<!-- 						      <td>15,000원</td> -->
<!-- 					    </tr>       -->
<!-- 					    <tr> -->
<!-- 					      <th scope="row">2</th> -->
<!-- 					        <td>아바타3</td> -->
<!-- 					        <td>2024 / 03 / 29</td> -->
<!-- 					        <td>18:20 ~ 20:15</td> -->
<!-- 					        <td>서면</td> -->
<!-- 					        <td>H8</td> -->
<!-- 					        <td>15,000원</td> -->
<!-- 					    </tr> -->
					  </tbody>
					</table>
				</div><!-- col-md-6 -->
				
				<div class="col-md-3">
					<div class="row">
						<div class="col-10">
							<h2>MY 극장</h2>
						</div><!-- col-5 -->
						<div class="col-2">
							<img src="${pageContext.request.contextPath}/resources/images/myp_mytheater.png" data-bs-toggle="modal" data-bs-target="#exampleModal" width="25px" height="25px">
						</div><!-- col-7 -->
					</div>	<!-- row -->	
								
					<!-- Modal -->
					<div class="modal fade " id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					    
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">자주가는 극장</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div><!-- modal-header -->
					      
					      <div class="modal-body">
							<div class="form-check">
								<div>
									<c:forEach begin="0" var="theater" items="${theater}">
										  <input onclick="CountChecked(this)" class="form-check-input" value="${theater.theater_name}" type="checkbox" id="flexCheckDefault" name="theaterId">
										  ${theater.theater_name}<br>
										  <br>
									</c:forEach>
								</div>
							</div>
					      </div><!-- modal-body -->
					      
					      <div class="modal-footer"> <!-- 모달 폼 극장 전체 리스트 -->
					      		<form id="theaterForm" method="post" action="MyTheaterList">
									<button type="submit" onclick="sendCheckedValues()" class="btn btn-outline-primary btn-lg"  class="btn btn-secondary" data-bs-dismiss="modal" name="theaterIds">확인</button>
						      		<script type="text/javascript">
						      		function sendCheckedValues() {
						      		    var checkedValues = []; // 선택된 체크박스의 값을 저장할 배열
						      		    var checkboxes = document.querySelectorAll('.form-check-input:checked'); // 선택된 체크박스들을 가져옴
										
						      		    checkboxes.forEach(function(checkbox) {
						      		        checkedValues.push(checkbox.value); // 배열에 선택된 체크박스의 값을 추가
						      		    });
										
						      		    $.ajax({
						      		        url: "api/myp_my_theater",
						      		        method: "POST", 
						      		      	contentType: "application/json",
						      		     	data: JSON.stringify({ checkedValues: checkedValues }), // JSON 문자열로 변환하여 전송
						      		        dataType: "json",
						      		        success: function (response) {
						      		            alert("영화 정보 등록을 성공하였습니다");
						      		            location.reload();
						      		        },
						      		        error: function (xhr, status, error) {
						      		            alert("영화 정보를 가져오는 데 실패했습니다. 에러 : " + error);
						      		        }
						      		    });
						      		}
										        	
										        
									</script>
								</form>
					      </div><!--modal-footer  --> <!-- 모달 폼 극장 전체 리스트 -->
					    </div><!-- modal-content -->
					  </div> <!-- modal-dialog -->
					</div><!-- modal fade 모달 div 끝 -->
					
					<table class="table3 table table-bordered">
					
						<tr>
							<td>
								<c:choose>
									<c:when test="${empty member.member_my_theater1}"><%-- 자주가는 영화관 미설정시 --%>
										<a href="#">+</a>
									</c:when>
									<c:otherwise>
										<a href="#">${member.member_my_theater1}</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
						<tr>
							<td>
								<c:choose>
									<c:when test="${empty member.member_my_theater2}">
										<a href="#">+</a>
									</c:when>
									<c:otherwise>
										<a href="#">${member.member_my_theater2}</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
						<tr>
							<td>
								<c:choose>
									<c:when test="${empty member.member_my_theater3}">
										<a href="#">+</a>
									</c:when>
									<c:otherwise>
										<a href="#">${member.member_my_theater3}</a>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</table>
				</div><!-- col-md-3-->
		</div> <!-- row -->
	</div><!-- container2 -->
</div><!-- container -->

<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">
<script>
	
</script>
</body>
</html>

