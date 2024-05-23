<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<style>
* {
	/* border: 1px solid skyblue; */
	
}

.showReview {
	font-size: 20px;
	width: 680px;
	height: 300px;
}

.ratingCover {
	margin-top: 15px;
	width: 230px;
	height: 220px;
	float: left;
}

select {
	font-size: 18px; /* 원하는 크기로 조절하세요 */
}

textarea {
	font-size: 18px; /* 원하는 크기로 조절하세요 */
}

.reviewTexts {
	float: right;
	width: 350px;
	height: 230px;
}

.reviewTexts span {
	margin-right: 10px; /* 원하는 만큼의 간격을 조절하세요 */
}

.buttonBottom {
	width: 340px;
	margin-top: 280px;
	margin-bottom: 10px;
}

.buttonBottom button {
	font-size: 20px; /* 수정된 폰트 크기 */
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div class="showReview">
		<form action="reviewUpdate" method="post">
			<p>${reviews.member_id}님께서작성한 별점과 관람평</p>
			<div class="ratingCover">
				내가 선택한 별점: ${reviews.review_rating} 점
				<p>변경할 별점</p>
				<select id="review_rating" name="review_rating" class="form-select">
					<option value="0" selected>별점 선택(미선택시 0점 ☆)</option>
					<option value="1">★ 1점</option>
					<option value="2">★★ 2점</option>
					<option value="3">★★★ 3점</option>
					<option value="4">★★★★ 4점</option>
					<option value="5">★★★★★ 5점</option>
				</select>
			</div>
			<div class="reviewTexts">
				<p>내가 적은 관람평</p>
				<textarea class="review-text" name="review_text" rows="4" cols="35">${reviews.review_text}</textarea>
				<input type="hidden" name="member_id" value="${sessionScope.sId}">
				<input type="hidden" name="review_num" value="${reviews.review_num}">
			</div>
			<%--     	</c:forEach> --%>
			<div class="buttonBottom">
				<button type="submit" class="btn btn-outline-primary">수정</button>
				<button onclick="closeWindow()" class="btn btn-outline-primary">취소하기</button>
			</div>
		</form>
	</div>
</body>
<script>
	function closeWindow() {
		window.close();
	}
</script>
</html>