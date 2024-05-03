<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 확인하기</title>
</head>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/member_default.css" rel="stylesheet" type="text/css">
<body>

<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>


<section class="member_section">
	<div class="member_title">
	    <h3>가입 확인하기</h3>
	    <hr>
    </div>
	<form action="member_reg_member" method="post">
		<div class="member_row">
	
		    <div class="form_item">
		    	<label for="member_name"><b>이름</b></label>
		    	<input type="text"  maxlength="10" name="member_name" id="member_name" required placeholder="이름을 입력해주세요">
		    	<span id="name_span"></span>
		    </div>
		    
		    <div class="form_item">
		    	<label for="member_birth"><b>생년월일</b></label>
		    	<input type="text"  maxlength="6" name="member_birth" id="member_birth" required placeholder="생년월일6자리 입력해주세요">
		    	<span id="birth_span"></span>
		    </div>
		</div>
		<div class="regist_final">
			<hr>
			<button type="submit" class="btn btn-outline-primary">가입 확인하기</button>
			<button type="button" class="btn btn-outline-primary" onclick="history.back()">돌아가기</button>
		</div>
	</form>
</section>



<header>
	<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
</header>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	$(document).ready(function() {
	    // 이름 입력값 변경 시
	    $("#member_name").on("input", function() {
	        let name = $("#member_name").val();
	        let regex = /^[a-zA-Z가-힣]{2,10}$/g;
	        
	        if (!regex.test(name)) {
	            $("#member_name").css("background-color", "red");
	            $("#name_span").text("틀렸습니다");
	        } else {
	            $("#member_name").css("background-color", ""); // 원래의 배경색으로 돌아갑니다 (빈 문자열로 설정)
	            $("#name_span").text(""); // 텍스트를 제거합니다
	        }
	
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    // 생일 입력값 변경 시
	    $("#member_birth").on("input", function() {
	        let birth = $("#member_birth").val();
	        let regex = /^\d{6}$/g;
	
	        if (birth.length === 6) { // member_birth의 길이가 6일 때만 실행
	            if (!regex.test(birth)) {
	                $("#member_birth").css("background-color", "red");
	                $("#birth_span").text("틀렸습니다");
	            } else {
	                $("#member_birth").css("background-color", ""); // 원래의 배경색으로 돌아갑니다 (빈 문자열로 설정)
	                $("#birth_span").text(""); // 텍스트를 제거합니다
	            }
	
	            checkFormValidity(); // 폼 유효성 검사 실행
	        }
	    });
	
	    // 폼 유효성 검사 함수
	    function checkFormValidity() {
	        let nameIsValid = /^[a-zA-Z가-힣]{2,10}$/.test($("#member_name").val());
	        let birthIsValid = /^\d{6}$/.test($("#member_birth").val());
	
	        if (nameIsValid && birthIsValid) {
	            $("button[type='submit']").prop("disabled", false); // submit 버튼 활성화
	        } else {
	            $("button[type='submit']").prop("disabled", true); // submit 버튼 비활성화
	        }
	    }
	});

		
		
		
	
</script>
</body>
</html>


