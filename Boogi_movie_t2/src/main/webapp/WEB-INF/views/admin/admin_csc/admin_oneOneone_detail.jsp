<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_detail</title>
<style>
	.container {
		width:850px;
		height:auto;
		margin: 0 auto;
		border:1px solid #6699FF;
		border-width: 5px;
		padding: 10px;
		
	}
	
	table {
		border-top:1px solid black;
		border-bottom:1px solid black;
		width:800px;
		margin: 50px auto;
		border-collapse: collapse;
		text-align: center;
	}
	table tr td {
		border:1px solid black;
		padding : 15px;
	}
	
	td:nth-child(odd) {
	  font-weight: bold;
	  text-align: left;
	  background-color: #6699FF;
	}
	
	td:nth-child(even) {
	  font-weight: bold;
	  text-align: left;
	  background-color: #CCCCCC;
	}
	
	 tr:nth-child(4) td {
	 	text-align: center;
	 	background-color: white;
	 }
	 
	table td:first-child {
		border-left: 0;
	}
	
	table td:last-child {
		border-right: 0;
	}
	 
	input[value="답변"] {
		padding:10px;
		background-color: #6699FF;	
		font-weight: bold;
	}
	.detail_button {
		text-align: center;
		margin-top: 15px;
	}
	
	span {
		color:#FFFF00;
	}
	
</style>
</head>
<body>
	<div class="container">
		<div>
			<table>
				<tr>
					<td>제목</td>
					<td>이거 어떻게 해요?</td>
					<td>작성자</td>
					<td>박종민</td>
				</tr>
				<tr>
					<td>문의 유형</td>
					<td><span>[영화]</span></td>
					<td>문의 지점</td>
					<td>[부산센텀]</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>~~~~</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="20" cols="100" style="resize: none" placeholder="여기에 질문 뿌리기"></textarea>
					</td>
				</tr>
			</table>
		</div>
		<form action="admin_oneOneone_detail_Pro" method="post" onsubmit="return confirm('답변을 등록하시겠습니까?');">
			<table>
				<tr>
					<td>제목</td>
					<td>네 고갱님 제가 알려드리겠습니다^^</td>
					<td>작성자</td>
					<td>admin</td>
				</tr>
				<tr>
					<td>문의 유형</td>
					<td><span>[영화]</span></td>
					<td>문의 지점</td>
					<td>[부산센텀]</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>~~~~</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea rows="20" cols="100" style="resize: none" placeholder="여기서 답변작성"></textarea>
					</td>
				</tr>
				
			</table>
			<!-- 답변 버튼 -->
			<div class="detail_button">
				<input type="submit" value="답변하기">
				<input type="reset" value="다시쓰기">
				<input type="button" value="돌아가기" onclick="history.back()">
			</div>
		</form>
	</div>
</body>
</html>