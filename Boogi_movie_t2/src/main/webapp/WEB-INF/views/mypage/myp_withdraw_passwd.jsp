<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


.container1{
	height : 900px;
	width: 1400px; /* 해상도 1200*/
}

.container2{
	margin-top: 20px;
}

.text1{
	text-align: center;
	margin-top: 40px;	
}

.box1{
	margin-top: 40px;
	margin-left: 140px;
}

* {box-sizing: border-box}

input[type=text], input[type=password]{
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

.movTaste{
  width: 100%;
  padding: 15px 15px 15px 0;
  margin: 5px 0 22px 0;
  border: none;
  height : 5%;
  display: flex; /* 요소들을 가로로 정렬하기 위해 flexbox 사용 */
  align-items: center; /* 체크박스와 텍스트를 수직 중앙 정렬 */
}



input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}


</style>
</head>
<body>
<header>
	<jsp:include page="../inc/admin_header.jsp"></jsp:include>
</header>
<div class="container1">
	<div class="container2">
		<div class="row">
			<div class="col-md-2">
				<jsp:include page="inc/myp_aside.jsp"></jsp:include>
			</div><!-- col-md-2  -->
			
			<div class="col-md-9">
				<h2>회원탈퇴</h2>
				<hr>
				<div class="text1">
					<h5>고객님의 개인정보를 위해 비밀번호를 재입력 해주세요.</h5>
<!-- 				<div class="member_row"> -->
				    <div class="form_item w-75 box1">
				    	<input type="password"  id="passwordInput" required>
				    </div><!-- form item -->
				    <form  id="withdrawForm" action="myp_withdraw_finish_pro" method="post">
			    	    <span id="passwordMessage" style="color: red;"></span>
						<section class="content">
							<button type="submit"  id="submitButton" class="btn btn-outline-primary btn-lg" required>회원탈퇴하기</button>
						</section>
					</form>
				</div><!-- text1 -->
			</div><!-- col-md-9 -->
		</div><!-- row -->
	</div><!-- container2 -->
</div><!-- container1 -->
<footer>
	<jsp:include page="inc/myp_footer.jsp"></jsp:include>
</footer>
<script type="text/javascript">

    // 폼을 서버로 전송할 때 이벤트를 처리하는 함수
    document.getElementById('withdrawForm').addEventListener('submit', function(event) {
        // 폼의 기본 동작인 서버로의 제출을 막습니다.
        event.preventDefault();

        // 사용자가 입력한 비밀번호를 가져옵니다.
        var passwordValue = document.getElementById('passwordInput').value;

        // 만약 비밀번호가 입력되지 않았다면 알림 메시지를 표시합니다.
        if (!passwordValue) {
            alert("비밀번호를 입력하세요");
            return;
        }

        // 비밀번호를 서버로 전송하여 비교하는 로직을 구현합니다.
        // 이 코드는 실제로 서버에서 처리해야 합니다.
        // 여기서는 단순히 비밀번호를 가져오는 로직만을 작성합니다.
        // 만약 비밀번호가 서버로 전송되어야 한다면, 비밀번호를 서버로 전송하는 코드를 추가해야 합니다.
        // 여기서는 비밀번호를 서버로 전송하지 않고 클라이언트에서만 처리합니다.

        // 비밀번호를 폼 데이터에 추가합니다.
        // 이렇게 하면 컨트롤러로 비밀번호가 함께 전송됩니다.
//         document.getElementById('withdrawForm').insertAdjacentHTML('beforeend', '<input type="hidden" name="member_pwd" value="' + passwordValue + '">');
        document.getElementById('withdrawForm').insertAdjacentHTML('beforeend', '<input type="hidden" name="password" value="' + passwordValue + '">');

        // 폼을 서버로 제출합니다.
        document.getElementById('withdrawForm').submit();
    });

document.getElementById('passwordInput').addEventListener('keydown', function(event) {
    if (event.keyCode === 13) { // 엔터 키의 keyCode는 13입니다.
        event.preventDefault(); // 폼 제출을 막음
        document.getElementById('submitButton').click(); // 버튼 클릭
    }
});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js">
</body>
</html>