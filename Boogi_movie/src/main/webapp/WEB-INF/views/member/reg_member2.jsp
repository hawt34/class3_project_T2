<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<link href="${pageContext.request.contextPath}/css/member_default.css" rel="stylesheet" type="text/css">

<body>
<form action="action_page.php" method="post">
  <div class="container">
    <h1>회원가입</h1>
    <hr>
    <div class="form_item">
    	<label for="name"><b>이름</b></label>
    	<input type="text"  name="name" id="name" required value="가입확인할때 받은 이름">
    	<span></span>
    </div>
	
	
	<label for="id"><b>아이디</b></label>
    <input type="text" placeholder="아이디 입력" name="id" id="id" required autocapitalize="off">
	
    <label for="pwd"><b>비밀번호</b></label>
    <input type="password" placeholder="비밀번호 입력" name="pwd" id="pwd" required>

    <label for="pwd2"><b>비밀번호 확인</b></label>
    <input type="password" placeholder="비밀번호 확인" name="pwd2" id="pwd2" required>
    
    <label for="birth"><b>생년월일</b></label>
    <input type="text" placeholder="생년월일" name="birth" id="birth" required value="가입확인할때 받은 생년월일">	
    
    <label for="postCode"><b>주소</b></label>
    <input type="text" id="postCode" name="postCode" size="6" readonly onclick="search_address()" placeholder="클릭 시 주소검색">
	<input type="text" id="address1" name="address1" placeholder="기본주소" size="25" readonly onclick="search_address()"><br>
	<input type="text" id="address2" name="address2" placeholder="상세주소" size="25" pattern="^.{2,20}$" maxlength="20">
    
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="이메일 입력" name="email" id="email" required>
    
    <label for="phoneNum"><b>전화번호</b></label>

    <input type="text" placeholder="전화번호 입력" name="phoneNum" id="phoneNum" placeholder="-제외한 전화번호를 입력해주세요" required >
    
		<div class="form_item">
		<label for="movTaste"><b>영화취향</b></label>
			<div class="movTaste">
				<label><input type="checkbox" name="movTaste" value="공포">공포</label>
				<label><input type="checkbox" name="movTaste" value="코믹">코믹</label>
				<label><input type="checkbox" name="movTaste" value="시사">시사</label>
				<label><input type="checkbox" id="cb_all">전체선택</label>
			</div>
		</div>
<div class="regist_fianl">
		<hr>
		<button type="submit" class="registerbtn">가입하기</button>
	<div class="container signin">
		<p>아이디가 이미 있으신가요? <a href="#">돌아가기</a>.</p>
	</div>
</div>
</div>
</form>
	




	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function search_address() {
	        new daum.Postcode({ // daum.Postcode 객체 생성
	        	// 주소검색 창에서 주소 검색 후 검색된 주소를 사용자가 클릭하면
	        	// oncomplete 이벤트에 의해 해당 이벤트 뒤의 익명함수가 실행(호출됨)
	        	// => 사용자가 호출하는 것이 아니라 API 가 함수를 호출하게 됨(callback(콜백) 함수)
	            oncomplete: function(data) {
	                // 클릭(선택)된 주소에 대한 정보(객체)가 익명함수 파라미터 data 에 전달됨
	                // => data.xxx 형식으로 각 주소 정보에 접근 가능
	                console.log(data);
	                // 1) 우편번호(= 국가기초구역번호 = zonecode 속성값) 가져와서 
	                //    우편번호 입력란(postCode)에 출력
	                document.fr.postCode.value = data.zonecode;
	        
	        		// 2) 기본주소(address 속성값) 가져와서 기본주소 항목(address1)에 출력
// 	        		document.fr.address1.value = data.address; // 기본주소
// 	        		document.fr.address1.value = data.roadAddress; // 도로명주소
	        		
	        		// 만약, 해당 주소에 대한 건물명(buildingName 속성값)이 존재할 경우(널스트링 아닐 때)
	        		// 기본주소 뒤에 건물명을 결합하여 출력
	        		// ex) 기본주소 : 부산 부산진구 동천로 109
	        		//     건물명 : 삼한골든게이트
	        		//     => 부산 부산진구 동천로 109 (삼한골든게이트)
	        		let address = data.address; // 기본주소 변수에 저장
	        		
	        		// 건물명이 존재할 경우(buildingName 속성값이 널스트링이 아닐 경우)
	        		// 기본주소 뒤에 건물명 결합
	        		if(data.buildingName != "") {
	        			address += " (" + data.buildingName + ")";
	        		}
	        		
	        		// 기본주소 출력
	        		document.fr.address1.value = address;
	        		
	        		// 상세주소 입력 항목에 커서 요청
	        		document.fr.address2.focus();
	        		
	            }
	        }).open();
	    }
	</script>
</body>
</html>