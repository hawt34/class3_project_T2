<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
데이터 확인용
<h1>Store Pay</h1>
    
    <h2>Snack</h2>
    <p>스낵가격: ${snack}</p>
    <p>수량: ${snackNum}</p>

    <h2>Pop</h2>
    <p>팝콘가격: ${pop}</p>
    <p>수량: ${snackPop}</p>

    <h2>Juice</h2>
    <p>쥬스가격: ${juice}</p>
    <p>수량: ${snackJuice}</p>

    <h2>Combo</h2>
    <p>콤보가격: ${combo}</p>
    <p>콤보수량: ${snackCombo}</p>
</body>
</html>