<%@page import="java.net.URI"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- 외부 CSS 파일 연결하기(css/default.css) --%>
<%-- <link href="${pageContext.request.contextPath}/resources/css/myp_default.css" rel="stylesheet" type="text/css"> --%> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.js"></script>
<style type="text/css">
article{
	text-align : center;
}

</style>
</head>
<script type="text/javascript">
// --------------------------------------------------------------------
// 2. 아이디 입력란에서 커서가 빠져나갈 때 아이디 길이 체크하기 => blur 이벤트
$("#member_id").blur(function() {
    let id = $("#member_id").val(); // 입력받은 아이디 값 저장
// 	// 아이디 입력값 검증을 위한 정규표현식 활용
// 	// => 영문자([A-Za-z]), 숫자([0-9]), 특수문자(_) 조합 8 ~ 16자리
// 	//    이 때, 영문자 + 숫자 + _ 기호는 \w 로 대체 가능
// 	// => 단, 첫글자에 영문자 또는 숫자만 허용하고, _ 사용 불가
// 	//    ex) admin_ (사용가능)   _admin (사용불가)
// 	// -------------------------------------------------------------------
// 	// 자바스크립트로 정규표현식 문자열 생성할 때 
// 	// /정규표현식문자열/ 형태(또는 new Regexp("정규표현식문자열"))로 표현
//		let regex = /^[A-Za-z0-9][A-Za-z0-9_]{7,15}$/;
	let regex = /^[A-Za-z0-9]\w{3,15}$/; // 3 ~ 16글자
		console.log(regex + " : " + typeof(regex)); // 정규표현식 객체로 관리되므로 object 타입
	
// 	// 정규표현식 문자열을 관리하는 객체(regex)의 exec() 메서드를 호출하여
// 	// 검사할 문자열을 전달하면 정규표현식 일치 여부를 boolean 타입으로 리턴
    if(regex.exec(id)) {
		$("#checkIdResult").text("사용 가능한 아이디");
		$("#checkIdResult").css("color", "green");
    	
//     	// ID 규칙 검사 적합 여부 저장 변수에 true(적합)값 저장
    	checkIdResult = true;
    } else {
		$("#checkIdResult").text("영문자, 숫자, 특수문자(_) 조합 8~16글자 필수!");
		$("#checkIdResult").css("color", "red");
    	
    	// ID 규칙 검사 적합 여부 저장 변수에 false(부적합)값 저장
    	checkIdResult = false;
    }
});

// => 정규표현식 검사를 별도의 자바스크립트 코드로 수행하지 않고
//	  텍스트박스에서 pattern 속성으로 정규표현식을 작성하고
//	  title 속성으로 정규표현식에 부합되지 않는 값 입력됐을 경우 표시할 메세지 지정 가능 

</script>
<body>
	<article>
		<h1>아이디 중복 검사</h1>
		<form action="CheckDupId" class="align_center" method="post">
		<!-- pattern 속성으로 입력값 검증 수행 -->
		<!-- 주의! submit 버튼 클릭 시 동작하며, 패턴 작성 시 / 와 / 사이의 내용만 작성 -->
			<input type="text" name="member_id" value="${param.member_id}" title="영문대소문자, 숫자, _ 조합 4~16자리" pattern="^[A-Za-z0-9]\w{3,15}$" placeholder="검색할 아이디 입력" required>
			<input type="submit" value="검색">
		</form>
		<%-- 만약, id 파라미터값이 있을 경우 아이디 중복 체크 결과 표시 --%>
		<c:if test="${not empty param.member_id}">
			<br>
			<div class="align_center">
				<%-- 아이디 중복 체크 결과 메세지("checkResult" 속성값) 표시 --%>
<%-- 				${param.id} : ${checkResult}<br> --%>
				<%-- ------------------------------------------------------- --%>
				<%-- 아이디 중복 체크 결과("checkResult" 속성값이 true/false)에 따른 작업 수행 --%>
				<c:choose>
					<c:when test="${checkResult eq true}"> <%-- 아이디 중복 (사용 불가능한 아이디 = true) --%>
						${param.member_id} : 이미 사용중인 아이디
					</c:when>
					<c:otherwise> <%-- 아이디 중복 아님(사용 가능한 아이디 = false) --%>
						${param.member_id} : 사용 가능한 아이디<br>
						<%-- 아이디가 중복이 아닐 경우 [아이디 사용하기] 버튼 표시 --%>
						<input type="button" value="아이디 사용하기" onclick="useId()">
					</c:otherwise>
				</c:choose>
			</div>
		</c:if>
	</article>	
	<script type="text/javascript">
		function useId(){
			// 부모창 (현재 아이디 중복 검사 창을 열게 한 창)의 아이디 입력 텍스트박스에
			// 중복검사 완료된 아이디 파라미터값을 표시
			// => 부모창을 제어하기 위해서는 window.opener(opener만 사용 가능!)
			window.opener.document.fr.member_id.value = "${param.member_id}";
			
			// 현재 창(자식 창)닫기
			window.close();
			
		}
	</script>
</body>
</html>