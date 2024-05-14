<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

.admin_footer {
	background: white;
	color: black;
	padding: 30px 0px;
	border-top: 1px solid black;
	font-family: "Noto Sans KR", sans-serif; 
	font-optical-sizing: auto;
	font-weight: 400;
	font-style: normal;
}

.footer_image {
	width: 50px;

}
</style>
<div align="center" class="admin_footer">
	<p>사업자번호: 0000000000 | 사업자명: 전준혁 | 전화번호 000-0000-0000</p>
	<p>회사주소: 부산광역시 부산진구 삼한골든게이트 7층 304호</p>
	<img src="${pageContext.request.contextPath}/resources/images/boogiHappy.png" class="footer_image">
</div>
