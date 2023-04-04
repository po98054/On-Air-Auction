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
	<form action="/OnAirAuction/savePurchase" method="post" enctype="multipart/form-data">
	    <label for="name">상품명:</label>
	    <input type="text" id="name" name="name" required><br>
	    <label for="price">사이즈:</label>
	    <input type="text" id="price" name="size" required><br>
	    <div id="image">
			<label>이미지:</label>
			<div class="form-group mt-3">
				<div>
					<div class="file-box">+</div>
					<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
					<img class="preview" height="200" width="auto">
				</div>
				<div>
					<div class="file-box">+</div>
					<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
					<img class="preview" height="200" width="auto">
				</div>
				<div>
					<div class="file-box">+</div>
					<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
					<img class="preview" height="200" width="auto">
				</div>
			</div>
		</div>
		<button type="submit">등록</button>
	</form>
</body>
</html>
<script>
$('.file-box,.preview').click(function(){
	$(this).siblings('input').click();
});
function readURL(input){
	
	if(!input.files || !input.files[0]){
		input.nextElementSibling.src ='';
		input.previousElementSibling.style.display = 'block';
		return;
	}
	let reader = new FileReader();
	reader.onload = function(e){
		input.previousElementSibling.style.display = 'none';
		input.nextElementSibling.src = e.target.result;
	}
	reader.readAsDataURL(input.files[0]);
}


</script>
