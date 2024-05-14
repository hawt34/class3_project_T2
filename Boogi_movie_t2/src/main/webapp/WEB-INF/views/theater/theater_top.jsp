<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 CSS, JS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
<!-- 극장 theater.css  -->
<link href="${pageContext.request.contextPath}/resources/css/theater.css" rel="stylesheet" type="text/css">
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
</head>
<body>
	<div class="theater_top">
		<nav class="nav justify-content-center theater_name">	
			<c:forEach var="theater" items="${theaterList}">
				<a class="nav-link" href="theater_detail?theater_num=${theater.theater_num}">${theater.theater_name}</a>
			</c:forEach>
			 <div class="dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">MY 극장</a>
				<ul class="dropdown-menu">
					 <c:choose>
					 	<c:when test="${empty sId}"> <!-- 비로그인 상태 -->
							<li><input type="button" class="btn" value="로그인하기" onclick="location.href='member_login'"></li>
					 	</c:when>
					 	<c:otherwise> <!-- 로그인 상태 -->
							<!-- 나의극장 관리 모달 버튼 -->
							<li><button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
								<img src="${pageContext.request.contextPath}/resources/images/set.svg"> MY 극장 관리</button>
							</li>
							<!-- 체크된 MY극장 리스트 / member_my_theater -->
							<c:forEach var="myTheaters" items="${myTheaters}">
								<li><a class="dropdown-item" href="#">${myTheaters.member_my_theater}</a></li>
							</c:forEach>
					 	</c:otherwise>
					 </c:choose>
				</ul>
			</div>
		</nav>
		
		<form action="Mytheater" method="post">
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">MY 극장 관리</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<c:forEach var="theater" items="${theaterList}">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" value="${theater.theater_name}" id="${theater.theater_num}" onclick="CountChecked(this)">
									<label class="form-check-label" for="${theater.theater_num}">${theater.theater_name}</label>
								</div>
							</c:forEach>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">저장</button>
		      			</div>
					</div>
		  		</div>
		  	</div> <!-- 모달 끝 -->
	  	</form>
	</div><!-- theater_top 끝 -->



</body>
</html>