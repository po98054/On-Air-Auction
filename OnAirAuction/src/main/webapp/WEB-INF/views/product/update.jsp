<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
   
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
	#image [type=file]{
		display: none;
	}
	#image>div>div{
		float:left; margin-right: 20px;
	}
	#image .btn-times{
		position: absolute; top:5px; right : 5px; width:30px; height:30px;
		border:1px solid black; background: #fff; text-align: center;
		line-height: 27px; font-size: 20px; border-radius: 5px; cursor: pointer;
	}
	.container{
		height: 1400px;
	}
 	.container-box{
 		width: 800px; margin-left: auto; margin-right: auto; margin-top: 40px !important;
 	}
	.container-h1{
 		margin-top: 40px; margin-bottom: 30px;
 	}
 	.find-btn{
 		 text-align: center;
 	}

</style>
<div class="container">
	<div class="container-box">
		<div class="container-h1">
			<h1>물품 수정</h1>
		</div>	
		<form action="<c:url value='/product/update/${vo.pr_code}'></c:url>" method="post" enctype="multipart/form-data">
		    <div class="form-group">
			    <label for="name">상품명</label>
			    <div class="form-control">
			   		<input type="text" id="name" name="pr_name" value="${vo.pr_name }" style="border:none" >
			    </div>
		    </div>
			<div class="form-group">
			    <label for="intro">상품소개</label>
			    <div class="form-control">
				    <input type="text" id="intro" name="pr_intro" value="${vo.pr_intro }" style="border:none">    
			    </div>
			</div>
			<div class="form-group">
			    <label for="condition">상품상태</label>
			    <div class="form-control">
				    <input type="text" id="condition" name="pr_condition" value="${vo.pr_condition }" style="border:none">			    
			    </div>
			</div>
			<div class="form-group">
			    <label for="detail">상세정보</label>
			    <div class="form-control">
				    <input type="text" id="detail" name="pr_detail" value="${vo.pr_detail }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
			    <label for="location">상품위치</label>
			    <div class="form-control">
				    <input type="text" id="location" name="pr_location" value="${vo.pr_location }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
				<label>반품수용여부</label>
				<div class="form-control">
				    <input type="text" id="refund_ok" name="pr_refund_ok" value="${vo.pr_refund_ok }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
				<label>반품수용기간</label>
				<div class="form-control">
				    <input type="text" id="refunddate" name="pr_refunddate" value="${vo.pr_refunddate }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
				<label>환불가능조건</label>
				<div class="form-control">
				    <input type="text" id="refundreason" name="pr_refundreason" value="${vo.pr_refundreason }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
			    <label for="startprice">경매시작가격</label>
			    <div class="form-control">
				    <input type="text" id="startprice" name="pr_startprice" value="${vo.pr_startprice }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
			    <label for="origin">원산지</label>
			    <div class="form-control">
				    <input type="text" id="origin" name="pr_origin"  value="${vo.pr_origin }" style="border:none">
			    </div>
			</div>
			<div class="form-group">
			    <label for="price">물품크기</label>
			    <div class="form-control">
				    <input type="text" id="size" name="pr_size"  value="${vo.pr_size }" style="border:none">
			    </div>
			</div>
		   	<div id="image" style="margin-left: 10px">
				<label>이미지:</label>
				<div class="form-group mt-3">
					<c:forEach items="${files}" var="file">
						<div style="position: relative">
							<div class="file-box" style="display: none">+</div>
							<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
							<img class="preview" height="200" width="auto" src="<c:url value='/download${file.fi_savename}'></c:url>">
							<span class="btn-times" data-num="${file.fi_num}">X</span>
						</div>
					</c:forEach>
					<c:forEach begin="1" end="${3 - files.size()}">
						<div>
							<div class="file-box">+</div>
							<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
							<img class="preview" height="200" width="auto">
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="find-btn">
				<button class="btn btn-outline-primary">수정</button>
			</div>
		</form>
	</div>
</div>

<script>
$('form').submit(function(){
	let pr_name = $('[name=pr_name]').val();
	if(pr_name.trim().length  == 0){
		alert('상품명을 입력하세요.');
		$('[name=pr_name]').focus();
		return false;
	}
	let pr_intro = $('[name=pr_intro]').val();
	if(pr_intro.trim().length  == 0){
		alert('상품소개를 입력하세요.');
		$('[name=pr_intro]').focus();
		return false;
	}
	let pr_condition = $('[name=pr_condition]').val();
	if(pr_condition.trim().length  == 0){
		alert('상품상태를 입력하세요.');
		$('[name=pr_condition]').focus();
		return false;
	}
	let pr_detail = $('[name=pr_detail]').val();
	if(pr_detail.trim().length  == 0){
		alert('상세정보를 입력하세요.');
		$('[name=pr_detail]').focus();
		return false;
	}	
	let pr_location = $('[name=pr_location]').val();
	if(pr_location.trim().length  == 0){
		alert('상품위치를 입력하세요.');
		$('[name=pr_location]').focus();
		return false;
	}
	let pr_refund_ok = $('[name=pr_refund_ok]').val();
	if(pr_refund_ok.trim().length  == 0){
		alert('반품수용여부를 입력하세요.');
		$('[name=pr_refund_ok]').focus();
		return false;
	}
	let pr_refunddate = $('[name=pr_refunddate]').val();
	if(pr_refunddate.trim().length  == 0){
		alert('반품수용기간을 입력하세요.');
		$('[name=pr_refunddate]').focus();
		return false;
	}
	let pr_refundreason = $('[name=pr_refundreason]').val();
	if(pr_refundreason.trim().length  == 0){
		alert('환불가능조건을 입력하세요.');
		$('[name=pr_refundreason]').focus();
		return false;
	}
	let pr_startprice = $('[name=pr_startprice]').val();
	if(pr_startprice.trim().length  == 0){
		alert('경매시작가격을 입력하세요.');
		$('[name=pr_startprice]').focus();
		return false;
	}
	let pr_origin = $('[name=pr_origin]').val();
	if(pr_origin.trim().length  == 0){
		alert('원산지를 입력하세요.');
		$('[name=pr_origin]').focus();
		return false;
	}
	let pr_size = $('[name=pr_size]').val();
	if(pr_size.trim().length  == 0){
		alert('상품크기를 입력하세요.');
		$('[name=pr_size]').focus();
		return false;
	}
	
	const images = image.querySelectorAll('input[type=file]');
	  let imageSelected = false;
	  
	  for (let i = 0; i < images.length; i++) {
	    if (images[i].files.length > 0) {
	      imageSelected = true;
	      break;
	    }
	  }

	  if (!imageSelected) {
	    alert('이미지를 1개 이상 선택하세요.');
	    return false;
	  }

	  // 유효성 검사를 통과한 경우에는 true를 반환하여 폼을 제출합니다.
	  return true;
});

	$('.file-box,.preview').click(function(){
		$(this).siblings('input').click();
	});
	
	$('#image .btn-times').click(function(){
		$(this).siblings('.preview').attr('src', '');	
		$(this).siblings('.file-box').show();
		$(this).parent().detach().appendTo('#image>div')
		//input태그로 삭제할 첨부파일 번호를 전송하기 위한 준비 작업
		$(this).after('<input type="hidden" name="fileNums" value="'+$(this).data('num')+'">');
		$(this).remove();
	})
	
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