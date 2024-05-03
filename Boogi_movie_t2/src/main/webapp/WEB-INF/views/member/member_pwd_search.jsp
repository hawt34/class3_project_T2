<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<section class="member_section">
<div class="member_title">
    <h3>비밀번호 찾기</h3>
    <hr>
    </div>
<form action="member_search_pwd_pro" method="post">
<div class="member_row">


    <div class="form_item">
    	<label for="id"><b>아이디</b></label>
    	<input type="text"  name="member_id" id="member_id" required 
    	<c:choose>
			<c:when test="${not empty member_id }">
				value="${member_id }"
			</c:when>
			<c:otherwise>
				placeholder="아이디를 입력해주세요"
			</c:otherwise>
		</c:choose>>
    	<span></span>
    </div>
    
    <div class="form_item">
    	<label for="tel"><b>전화번호</b></label>
    	<input type="text"  name="member_tel" id="member_tel" required>
    	<span></span>
    </div>
</div>
<div class="regist_final">
	<hr>
	<button type="submit" class="btn btn-outline-primary">비밀번호 찾기</button>
</div>
</form>
</section>
<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>
</body>
</html>

