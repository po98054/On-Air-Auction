<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
.file-box{
	width : 100px; height : 200px;
	border : 1px solid black; font-size : 50px;
	text-align: center; line-height: 200px; font-weight: bold;
	border-radius: 5px; 
	float: left; cursor: pointer;
}
#image>div::after{
	display: block; content: ''; clear: both;
}

#image>div>div{
	float:left; margin-right: 20px;
}
</style>
<body>
	<form action="/OnAirAuction/savePurchase" method="post" enctype="multipart/form-data">
	    <div class="form-group">
		    <label for="name">상품명:</label>
		    <input type="text" class="form-control" id="name" name="name" required>
	    </div>
		<div class="form-group">
		    <label for="price">상품소개:</label>
		    <input type="text" id="intro" name="intro" required>
		</div>
		<div class="form-group">
		    <label for="price">상품상태:</label>
		    <input type="text" id="condition" name="condition" required>
		</div>
		<div class="form-group">
		    <label for="price">상세정보:</label>
		    <input type="text" id="detail" name="detail" required>
		</div>
		<div class="form-group">
		    <label for="price">상품위치:</label>
		    <input type="text" id="location" name="location" required>
		</div>
		    <label for="number">경매시작가격:</label>
		    <input type="text" id="startprice" name="startprice" required>
		<div class="form-group">
		    <label for="price">원산지:</label>
		    <input type="text" id="origin" name="origin" required>
		</div>
		<div class="form-group">
		    <label for="price">물품크기:</label>
		    <input type="text" id="size" name="size" required>
		</div>
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
