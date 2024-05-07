<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>

<section class="member_section">
<div class="member_title">
	<h3>아이디 찾기</h3>
    <hr>
</div>
<form action="member_search_id_result_pro" method="post">
<div class="member_row">

    <div class="form_item">
    	<label for="member_name"><b>이름</b></label>
    	<input type="text"  name="member_name" id="member_name" required maxlength="20">
    	<span></span>
    </div>
    <div class="form_item">
    	<label for="member_birth"><b>생년월일</b></label>
    	<input type="text"  name="member_birth" id="member_birth" required maxlength="6">
    	<span></span>
    </div>
	
	<div class="regist_final">
		<hr>
    	<button type="submit" class="btn btn-outline-primary">아이디 찾기</button>
	</div>
	</div>
</form>
</section>

<footer>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</footer>


	<script>
	
	$(document).ready(function() {
		
	    // 아이디 입력값 변경 시
	    $("#member_name").on("input", function() {
	        let name = $("#member_name").val();
	        let regex = /^[a-zA-Z가-힣]{2,10}$/g;
	        
	        if (!regex.test(name)) {
	            $("#member_name").css("background-color", "red");
	        } else {
	            $("#member_name").css("background-color", ""); // 원래의 배경색으로 돌아갑니다 (빈 문자열로 설정)
	        }
	
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    // 비밀번호 입력값 변경 시
	    $("#member_birth").on("input", function() {
	        let birth = $("#member_birth").val();
	        let regex = /^\d{6}$/g;
	        
	        if (!regex.test(birth)) {
	            $("#member_birth").css("background-color", "red");
	        } else {
	            $("#member_birth").css("background-color", ""); // 원래의 배경색으로 돌아갑니다 (빈 문자열로 설정)
	        }
	
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    // 폼 유효성 검사 함수
	    function checkFormValidity() {
        let nameIsValid = /^[a-zA-Z가-힣]{2,10}$/.test($("#member_name").val());
        let birthIsValid = /^.{8,16}$/.test($("#member_birth").val());

        if (idIsValid && pwdIsValid && pwd2IsValid && address2IsValid && emailIsValid && telIsValid) {
            $("button[type='submit']").prop("disabled", false); // submit 버튼 활성화
        } else {
            $("button[type='submit']").prop("disabled", true); // submit 버튼 비활성화
        }
    }
});
	</script>
</body>
</html>