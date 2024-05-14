<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_info_modify.css">
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

/* .form_item { margin-top : 0px; } */
</style>

<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="row">
		<div class="col-md-2">
			<jsp:include page="inc/myp_aside.jsp"></jsp:include>
		</div>	<!-- col-md-2 사이드바  -->
		<div class="col-md-9">
			<h2>회원정보수정</h2>
			<hr>
		<form action="myp_info_modify_pro" method="post" name="fr">
			<div class="box1">
				
				<div class="box5">
		   			<label for="member_name">이름</label>
				</div>
			  	<div class="form_item w-75">
			    	<input type="text" name="member_name" id="member_name" value="${member.member_name}" placeholder="이름을 입력" readonly>
			    </div><!-- form item -->
			    
			    
				<div class="box5">
		   			<label for="member_id">아이디</label>
		   		</div>
			  	<div class="form_item w-75">
		    		<input type="text"  placeholder="아이디 입력" name="member_id" id="member_id" title="영문대소문자, 숫자, _ 조합 4~16자리" pattern="^[A-Za-z0-9]\w{3,15}$" value="${member.member_id}" readonly required>
			    </div><!-- form item -->
<!-- 				</form> -->
				<div class="box5">
	   				<label for="member_pwd">새 비밀번호</label>
	   			</div>
			  	<div class="form_item w-75">
			    	<input type="password" placeholder="비밀번호 입력" name="member_pwd" id="member_pwd">
				    <div class="box4">
			    		<span id="pwdMessage" style="color: red;"></span>
					</div>
			    </div><!-- form item -->
				
				<div class="box5">
	   				<label for="member_pwd2">새 비밀번호확인</label>
			  	</div>
			  	<div class="form_item w-75 ">
			    	<input type="password" placeholder="비밀번호 확인" name="member_pwd2" id="member_pwd2">
    			    <div class="box4">
		    	   		<span id="pwd2Message" style="color: red;"></span>
		    	    </div>
			    </div><!-- form item -->
				
				<div class="box5">
	   				<label for="member_birth">생년월일</label>
				</div>
			  	<div class="form_item w-75">
			    	<input type="text" placeholder="생년월일" name="member_birth" id="member_birth" required value="${member.member_birth}">
<!-- 		    	   	<div class="box4"> -->
		    	    	<span id="birthMessage" style="color: red;"></span>
<!-- 		    	    </div> -->
			    </div><!-- form item -->
			    
				<div class="box5">
	   				<label for="member_addr">주소</label>
	   			</div>
			  	<div class="form_item w-75">
			    	<input type="text" id="member_addr" name="member_addr" size="6" onclick="search_address()" required value="${member.member_addr}" placeholder="클릭 시 주소검색">
<!-- 			    	<div class="box4"> -->
			    		<span id="addrMessage" style="color: red;"></span>
<!-- 			    	</div> -->
			    </div><!-- form item -->
			
				<div class="box5">
		   			<label for="member_email">Email</label>
				</div>
			  	<div class="form_item w-75">
			    	<input type="text" placeholder="이메일 입력" name="member_email" id="member_email" required value="${member.member_email}">
					<div class="box4">
 				    	<span id="emailMessage" style="color: red;"></span>
 				    </div>
			    </div><!-- form item -->
			
				<div class="box5">
	   				<label for="member_tel">전화번호</label>
	   			</div>
			  	<div class="form_item w-75">
			    	<input type="text" placeholder="-제외한 전화번호를 입력해주세요" name="member_tel" required id="member_tel" value="${member.member_tel}">
					<div class="box4">
						<span id="telMessage" style="color: red;"></span>
					</div>
			    </div><!-- form item -->
			    
<!-- 	    		<div class="row"> -->
<!-- 					<label for="movie_genre"><b>영화취향</b></label> -->
<!-- 						<div class="col-md-8 box3"> -->
<!-- 				  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="공포" name="member_movie_genre">공포</div> -->
<!-- 				  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="코믹" name="member_movie_genre">코믹</div> -->
<!-- 				  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="시사" name="member_movie_genre">시사</div> -->
<!-- 									<div class="col-md-2"><input type="checkbox" id="cb_all">전체선택</div> -->
<!-- 						</div> -->
<!-- 			    </div> -->
			</div><!-- box1 -->
			<div class="d-grid gap-2 col-3 box2">
				  <button class="btn btn-outline-primary btn-lg" type="submit" onclick="myp_info_modify_pro">수정완료</button>
			</div> <!-- d-grid gap-2 col-3 box2 -->
		</form>
		</div><!-- col-md-9 -->
	</div><!-- row -->
</div><!-- container1  -->	
	<footer>
		<jsp:include page="inc/myp_footer.jsp"></jsp:include>
	</footer>
	
<!-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
	
	<script>

	$(document).ready(function() {

		
	    // 비밀번호 입력값 변경 시
	    $("#member_pwd").on("input", function(){
	        let pwd = $("#member_pwd").val();
	        let regex = /^.{8,16}$/g;
			let message = document.getElementById("pwdMessage");
	        
	        if (!regex.test(pwd)) {
	            message.textContent = "올바른 비밀번호 형식이 아닙니다";
	        } else {
	            message.textContent = ""; // 에러 메시지 지우기
	        }

	        if (pwd === "") {
	            message.textContent = "비밀번호를 입력하세요"; // 메시지 설정
	        }
	        
	
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    
	    // 비밀번호2 입력값 변경 시
	    $("#member_pwd2").on("input", function() {
	    	let pwd = $("#member_pwd").val();
	        let pwd2 = $("#member_pwd2").val();
	        let regex = /^.{8,16}$/g;
			let message = document.getElementById("pwd2Message");
	        
	        if (pwd2 != pwd) {
	            message.textContent = "비밀번호가 일치하지 않습니다";
	        } else if (pwd2 === "") {
	            message.textContent = "비밀번호를 입력하세요"; // 메시지 설정
	        } else {
	            message.textContent = ""; // 에러 메시지 지우기
	        }

	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    // 생년월일 입력값 변경 시 
	    $("#member_birth").on("input", function() {
	        let birth = $("#member_birth").val();
//         	let regex = /^[0-9]{8}$/;
	        let regex = /\d{6}$/g; // \d는 숫자 [0-9]를 나타내는 메타 문자
			let message = document.getElementById("birthMessage");
	        
	        if (birth.length > 6) { // member_birth의 길이가 6일때
        		message.textContent = "생년월일을 6글자로 입력하세요";
	        	
	        } else { // 길이가 6이 아닐때
	        	if(!regex.test(birth)){
	        		message.textContent = "유효한 생년월일 양식이 아닙니다";
	        	} else {
	            message.textContent = ""; // 에러 메시지 지우기
	       		}
	        	
	        }

	        if (birth === "") {
	            message.textContent = "생년월일을 입력하세요"; // 메시지 설정
	        }
		
            checkFormValidity(); // 폼 유효성 검사 실행
			
		});
	    
	    // 상세주소 입력값 변경 시
	    $("#member_addr").on("input", function() {
	        let address = $("#member_addr").val();
	        let regex = /.{2,20}$/g;
			let message = document.getElementById("addrMessage");
	        
	        if (!regex.test(address)) {
	            message.textContent = "유효한 주소 형식이 아닙니다.";
	        } else {
	            message.textContent = ""; // 에러 메시지 지우기
	        }

	        if (address === "") {
	            message.textContent = "주소를 입력하세요"; // 메시지 설정
	        }
		
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    // 이메일 입력값 변경 시
	    $("#member_email").on("input", function() {
	        let email = $("#member_email").val();
	        let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/g;
			let message = document.getElementById("emailMessage");
	        
	        if (!regex.test(email)) {
	            message.textContent = "유효한 이메일 형식이 아닙니다.";
	        } else {
	            message.textContent = ""; // 에러 메시지 지우기
	        }

	        if (email === "") {
	            message.textContent = "이메일을 입력하세요"; // 메시지 설정
	        }
	        
	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
	    
	    // 전화번호 입력값 변경 시
	    $("#member_tel").on("input", function() {
	        let tel = $("#member_tel").val();
	        let regex = /^010\d{8}$/g;
			let message = document.getElementById("telMessage");
	        if (tel.includes("-")) {
	            message.textContent = "'-'를 제외한 전화번호를 입력해주세요";
	        } else if (!regex.test(tel)) {
	            message.textContent = "유효한 전화번호 형식이 아닙니다.";
	        } else {
	            message.textContent = ""; // 에러 메시지 지우기
	        }

	        if (tel === "") {
	            message.textContent = "전화번호를 입력하세요"; // 메시지 설정
	        }

	        checkFormValidity(); // 폼 유효성 검사 실행
	    });
	    
		    // 폼 유효성 검사 함수
	    function checkFormValidity() {
	        let pwdIsValid = /^.{8,16}$/.test($("#member_pwd").val());
	        let pwd2IsValid = /^.{8,16}$/.test($("#member_pwd2").val());
	        let birthIsValid = /^\d{6}$/.test($("#member_birth").val());
	        let addressIsValid = /^.{2,20}$/.test($("#member_addr").val());
	        let emailIsValid = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test($("#member_email").val());
	        let telIsValid = /^010\d{8}$/.test($("#member_tel").val());
	
	        if (pwdIsValid && pwd2IsValid && birthIsValid && addressIsValid && emailIsValid && telIsVali    d) {
	            $("button[type='submit']").prop("disabled", false); // submit 버튼 활성화
	        } else {
	            $("button[type='submit']").prop("disabled", true); // submit 버튼 비활성화
	        }
	    }
	});
	</script>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	    function search_address() {
	        new daum.Postcode({ // daum.Postcode 객체 생성
	        	// 주소검색 창에서 주소 검색 후 검색된 주소를 사용자가 클릭하면
	        	// oncomplete 이벤트에 의해 해당 이벤트 뒤의 익명함수가 실행(호출됨)
	        	// => 사용자가 호출하는 것이 아니라 API 가 함수를 호출하게 됨(callback(콜백) 함수)
// 	            oncomplete: function(data) {
// 	                // 클릭(선택)된 주소에 대한 정보(객체)가 익명함수 파라미터 data 에 전달됨
// 	                // => data.xxx 형식으로 각 주소 정보에 접근 가능
// 	                console.log(data);
// 	                // 1) 우편번호(= 국가기초구역번호 = zonecode 속성값) 가져와서 
// 	                //    우편번호 입력란(postCode)에 출력
// 	                document.fr.member_addr.value = data.zonecode;
	        		
// 	        		// 2) 기본주소(address 속성값) 가져와서 기본주소 항목(address1)에 출력
// // 	        		document.fr.address1.value = data.address; // 기본주소
// // 	        		document.fr.address1.value = data.roadAddress; // 도로명주소
	        		
// 	        		// 만약, 해당 주소에 대한 건물명(buildingName 속성값)이 존재할 경우(널스트링 아닐 때)
// 	        		// 기본주소 뒤에 건물명을 결합하여 출력
// 	        		// ex) 기본주소 : 부산 부산진구 동천로 109
// 	        		//     건물명 : 삼한골든게이트
// 	        		//     => 부산 부산진구 동천로 109 (삼한골든게이트)
// 	        		let address = data.address; // 기본주소 변수에 저장
	        		
// 	        		// 건물명이 존재할 경우(buildingName 속성값이 널스트링이 아닐 경우)
// 	        		// 기본주소 뒤에 건물명 결합
// 	        		if(data.buildingName != "") {
// 	        			address += " (" + data.buildingName + ")";
// 	        		}
	        		
// 	        		// 기본주소 출력
// 	        		document.fr.member_addr.value = address;
	        		
// 	        		// 상세주소 입력 항목에 커서 요청
// 	        		document.fr.member_addr.focus();
					// ---------------------------------------------------
					oncomplete: function(data) {

	        		console.log(data); // 반환되는 데이터를 콘솔에 출력하여 데이터 구조를 확인합니다.
					let address = data.address; // 기본주소를 가져옵니다.

					// 건물명이 존재할 경우 기본주소 뒤에 추가합니다.
					if(data.buildingName !== "") {
					address += " (" + data.buildingName + ")";
					}
					
					// 주소 정보에서 우편번호를 가져옵니다.
					let zonecode = data.zonecode;
					
					// 우편번호와 주소를 입력란에 설정합니다.
					document.getElementById('member_addr').value = zonecode + ' ' + address;
					
					// 창을 닫습니다.
					// this.modal.close();      		
					document.fr.member_addr.focus();// 상세주소 입력 항목에 커서 요청
					
					}
	        }).open();
	    }
	</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script> -->
</body>
</html>