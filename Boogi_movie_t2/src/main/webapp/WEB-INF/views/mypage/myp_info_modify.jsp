<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myp_info_modify.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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


</style>
</head>
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<form action="myp_info_modify" method="post">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div>	<!-- col-md-2 사이드바  -->
				<div class="col-md-9">
					<h2>회원정보수정</h2>
					<hr>
				<div class="box1">
	    			<label for="name">이름</label>
				  	<div class="form_item w-75">
				    	<input type="text" name="name" id="name" value="${member.name}" placeholder="이름을 입력" required>
				    </div><!-- form item -->
				
	    			<label for="id">아이디</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="아이디 입력" name="id" id="id" autocapitalize="off" required>
				    </div><!-- form item -->
				
	    			<label for="pwd">비밀번호</label>
				  	<div class="form_item w-75">
				    	<input type="password" placeholder="비밀번호 입력" name="pwd" id="pwd" required>
				    </div><!-- form item -->
				
	    			<label for="pwd2">비밀번호 확인</label>
				  	<div class="form_item w-75 ">
				    	<input type="password" placeholder="비밀번호 확인" name="pwd2" id="pwd2" required>
				    </div><!-- form item -->
				
	    			<label for="birth">생년월일</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="생년월일" name="birth" id="birth" required value="${member.birth}" required>
				    </div><!-- form item -->
	
	    			<label for="postCode">주소</label>
				  	<div class="form_item w-75">
				    	<input type="text" id="postCode" name="postCode" size="6" onclick="search_address()" placeholder="클릭 시 주소검색" required>
				    	<input type="text" id="address1" name="address1" placeholder="기본주소" onclick="search_address()" size="25" required>
				    	<input type="text" id="address2" name="address2" placeholder="상세주소" size="25" pattern="^.{2,20}$" maxlength="20" required>
				    </div><!-- form item -->
				
	    			<label for="email">Email</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="이메일 입력" name="email" id="email" required>
				    </div><!-- form item -->
				
	    			<label for="phoneNum">전화번호</label>
				  	<div class="form_item w-75">
				    	<input type="text" placeholder="-제외한 전화번호를 입력해주세요" name="tel" id="tel" required>
				    </div><!-- form item -->
				    
		    		<div class="row">
						<label for="movie_genre"><b>영화취향</b></label>
							<div class="col-md-8 box3">
					  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="공포" name="movie_genre">공포</div>
					  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="코믹" name="movie_genre">코믹</div>
					  			<div class="col-md-2"><input type="checkbox" class="form-check-input" value="시사" name="movie_genre">시사</div>
  								<div class="col-md-2"><input type="checkbox" id="cb_all">전체선택</div>
							</div>
				    </div>
				</div><!-- box1 -->
				<div class="d-grid gap-2 col-3 box2">
					  <button class="btn btn-outline-primary btn-lg" type="button" onclick="location.href='myp_main'">수정완료</button>
				</div>
			</div><!-- col-md-10 -->
		</div><!-- row  -->	
	</form>
</div> <!--  container1  -->
	<footer>
		<jsp:include page="inc/myp_footer.jsp"></jsp:include>
	</footer>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>