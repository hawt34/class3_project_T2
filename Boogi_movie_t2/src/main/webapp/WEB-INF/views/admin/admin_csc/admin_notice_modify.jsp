<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록폼</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- 부트스트랩 링크 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin_form.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-4">공지사항등록</h4>
				<form class="validation-form" novalidate action="admin_notice_modify" method="post" onsubmit="return confirm('공지를 등록하시겠습니까?');">
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="movie_director">작성자</label>  -->
<!-- 						<input type="text" id="movie_director" class="form-control" required /> -->
<!-- 						<div class="invalid-feedback">작성자를 입력해주세요.</div> -->
<!-- 					</div> -->
					<div class="mb-3">
						<label for="movie_name">글제목</label> 
						<input type="text" value="${notice.notice_subject }" id="movie_name" class="form-control" required name="notice_subject" required />
						<div class="invalid-feedback">글제목을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<select name="notice_category">
							<option value="전체" ${notice.notice_category == '전체' ? 'selected' : ''}>전체</option>
							<option value="극장" ${notice.notice_category == '극장' ? 'selected' : ''}>극장</option>
						</select>
						<select name="theater_name">
							<option value="해운대점" ${notice.theater_name eq '해운대점' ? 'selected' : '' }>해운대점</option>
							<option value="센텀점" ${notice.theater_name eq '센텀점' ? 'selected' : '' }>센텀점</option>
							<option value="서면점" ${notice.theater_name eq '서면점' ? 'selected' : '' }>서면점</option>
							<option value="남포점" ${notice.theater_name eq '남포점' ? 'selected' : '' }>남포점</option>
							<option value="부산대점" ${notice.theater_name eq '부산대점' ? 'selected' : '' }>부산대점</option>
							<option value="사직점" ${notice.theater_name eq '사직점' ? 'selected' : '' }>사직점</option>
							<option value="영도점" ${notice.theater_name eq '영도점' ? 'selected' : '' }>영도점</option>
							<option value="덕천점" ${notice.theater_name eq '덕천점' ? 'selected' : '' }>덕천점</option>
							<option value="정관점" ${notice.theater_name eq '정관점' ? 'selected' : '' }>정관점</option>
							<option value="사상점" ${notice.theater_name eq '사상점' ? 'selected' : '' }>사상점</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="movie_story">내용</label> 
						<textarea id="summernote" class="form-control" rows="10" required name="notice_content">${notice.notice_content }</textarea>
						<div class="invalid-feedback">내용을 입력해주세요.</div>
					</div>
					
					<hr class="mb-4">
					
					<div class="mb-4" align="center">
						<input type="submit" value="수정완료" class="btn btn-primary btn-lg btn-block" >
						<input type="reset" value="다시작성" class="btn btn-primary btn-lg btn-block" >
						<input type="button" value="돌아가기" class="btn btn-primary btn-lg btn-block" onclick="history.back()">
					</div>
				</form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; Boogi Movie</p>
		</footer>
	</div>
	<script>
	    window.addEventListener('load', () => {
	      const forms = document.getElementsByClassName('validation-form');
	
	      Array.prototype.filter.call(forms, (form) => {
	        form.addEventListener('submit', function (event) {
	          if (form.checkValidity() === false) {
	            event.preventDefault();
	            event.stopPropagation();
	          }
	
	          form.classList.add('was-validated');
	        }, false);
	      });
	    }, false);
 	</script>
 	<script>
      $('#summernote').summernote({
        placeholder: '공지를 입력하세요.',
        tabsize: 1,
        height: 800,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']],
          ['height', ['height']]
        ]
      });
    </script>
    <script>
    // 첫 번째 선택란의 변경을 감지하여 두 번째 선택란의 옵션을 변경하는 함수
    document.getElemenByName('notice_category').addEventListener('change', function() {
        var firstValue = this.value; // 첫 번째 선택란의 값을 가져옴
        var secondSelect = document.getElementByName('theater_name');

        // 첫 번째 선택란의 값에 따라 두 번째 선택란의 옵션을 변경
        switch (notice_category) {
            case '1':
                secondSelect.value = 'A';
                break;
            case '2':
                secondSelect.value = 'B';
                break;
            case '3':
                secondSelect.value = 'C';
                break;
            default:
                secondSelect.value = ''; // 디폴트 값 설정
        }
    });
</script>
</body>
</html>