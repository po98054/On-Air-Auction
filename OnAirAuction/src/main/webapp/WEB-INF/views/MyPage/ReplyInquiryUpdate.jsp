<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">

<link href="<c:url value='/resources/css/summernote-bs4.css'></c:url>" rel="stylesheet">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/summernote-bs4.js'></c:url>"></script>

<style>

	.body{
        height: 780px; width: 1900px;
	}
	.body .body-left{
		float:left; width: 250px; height:780px; border-right: 1px solid black;
	}
	.body .body-left .nav-ul{
		margin-top: 5px;
	}
    .body .body-left .nav-ul .list-li:nth-child(1){
        width: 250px; height: 200px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(2){
        width: 250px; height: 140px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(3){
        width: 250px; height: 90px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(4){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(5){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(6){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold;
    }
	.body .body-left .nav-ul .list-li .item-a{
		display: inline-block; padding-top: 2px; color:black; margin-top: 6px; font-weight: normal;
	}
	
	.body .body-middle{
        float:left; width: 1150px; height:780px;
    }
    .file-box{
	width : 100px;
	
	height : 200px;
	
	border : 1px solid black;
	
	font-size : 50px;
	
	text-align : center;
	
	line-height : 200px;
	
	font-weight : bold;
	
	border-radius: 5px;
	
	float : left;
	
	cursor: pointer;
	}
	#image > div::after{
	display: block;
	
	content: '';
	
	clear: both;
	}
	#image [type=file]{
	display: none;
	}
	#image > div > div{
	float : left;
	
	margin-right : 20px;
	}
	
</style>

<!-- 문의 사항 수정 -->

<div class="body">
		<div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="./마이페이지_구매자_경매참가내역.html" class="item-a">경매 참가 내역(일반/실시간 경매)</a><br>
                    <a href="./마이페이지_구매자_경매참가내역2.html" class="item-a">경매 참가 내역(인원수 제한 경매)</a><br>
                    <a href="./마이페이지_구매자_경매개최내역.html" class="item-a">경매 개최 내역</a><br>
                    <a href="./마이페이지_구매자_주문내역.html" class="item-a">주문 내역</a><br>
                    <a href="./마이페이지_구매자_환불내역.html" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
					<a href="./마이페이지_판매자_경매참가내역.html" class="item-a">경매 참가 내역</a><br>
                    <a href="./마이페이지_판매자_경매개최내역.html" class="item-a">경매 개최 내역</a><br>
                    <a href="./마이페이지_판매자_판매내역.html" class="item-a">판매 내역</a>
				</li>	
				<li class="list-li">후기<br>
                    <a href="./마이페이지_후기조회.html" class="item-a">후기 조회</a>	
				</li>	
				<li class="list-li">신고<br>
					<a href="<c:url value='/MyPage/ReportInsert'></c:url>" class="item-a">신고 작성</a>
                    <a href="<c:url value='/MyPage/ReportList'></c:url>" class="item-a">신고 조회</a>	
				</li>	
				<li class="list-li">문의 사항<br>	
					<a href="<c:url value='/MyPage/InquiryInsert'></c:url>" class="item-a">문의 사항 등록</a><br>
                    <a href="<c:url value='/MyPage/InquiryList'></c:url>" class="item-a">문의 사항 조회</a>
				</li>
				<li class="list-li">회원<br>
					<a href="<c:url value='/MyPage/MemberUpdate/${user.me_id}'></c:url>" class="item-a">회원 정보 수정</a><br>
				</li>		
			</ul>		
		</div>
		
		<div class="body-middle">
        
           <form action="<c:url value='/MyPage/ReplyInquiryUpdate/${inquiry.in_num}'></c:url>" method="post" enctype="multipart/form-data">
           
           	<div class="form-group">
		
			<label for="type">게시판:</label>
			
			<select class="form-control" name="in_ic_num" id="type" readonly>
			
				<option value="0">문의 사항 카데고리를 선택하세요.</option>
				
				<c:forEach items="${inquiryCategory}" var="inca">
				
					<option value="${inca.ic_num}" <c:if test="${inquiry.in_ic_num == inca.ic_num}">selected</c:if>>${inca.ic_name}</option>
					
				</c:forEach>
				
			</select>
			
			</div>
			
			<div class="PrName" style="width:140px; height: 20px;" readonly>
			
			<input type="hidden" name="in_pr_code" value="${inquiry.in_pr_code}">
			
			<label for="person" id="pr_name">상품 : ${inquiry.pr_name}  </label>
			 
			</div>
           
           	 <div class="form-group" style="margin-left: 10px; margin-top: 30px;">
		
				<label for="title">제목:</label>
			
				<input type="text" class="form-control" id="title" name="in_title" value="${inquiry.in_num}번 글의 답글 : ${inquiry.in_title}">
			
			 </div>
			 
			 <div id="common" style="margin-left: 10px">
		
				<div class="form-group" style="margin-left: 10px">
			
					<label for="content">내용:</label>
					
					<textarea id="content" name="in_answer_content"></textarea>
				
				</div>
			
			</div>
			
			<div id="image" style="margin-left: 10px">
		
			<label>이미지:</label>
			
			<div class="form-group mt-3">
			
				<c:forEach items="${files}" var="file">
				
					<div style="position: relative">
				
						<div class="file-box" style="display: none">+</div>
					
						<input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
					
						<img class="preview" height="200" width="auto" src="<c:url value='/download${file.fi_save_name}'></c:url>">
						
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
		
		<button class="btn btn-outline-success col-12 mb-2" style="margin-left: 10px">문의 사항 답글 등록</button>
			 
		</form>
		
		
	</div>
	</div>
	
	<script>
    $('#content').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 140
    });
    
	$('form').submit(function(){
		
		let in_title = $('[name=in_title]').val();
		
		if(in_title.trim().length  == 0){
			
			alert('제목을 입력하세요.');
			
			$('[name=in_title]').focus();
			
			return false;
			
		}
		
		let in_content = $('[name=in_answer_content]').val();
		
		if(in_answer_content.trim().length  == 0){
			
			alert('내용을 입력하세요.');
			
			return false;
			
		}
		
	let images = image.querySelectorAll('[type=file]');
		
		for(i = 0; i < images.length; i++){
			
			if(images[i].files && images[i].files[0]){
				
				return true;
				
			}
			
			let imgCount = '${files.size()}';
			
			let deleteImgCount = image.querySelectorAll('[name=fileNums]').length;
			
			if(imgCount - deleteImgCount != 0) {
				
				return true;
				
			}
			
			alert('이미지를 1개 이상 선택하세요.');
			
			return false;
			
		}
		
	});
	
	$('#content').summernote('code','${inquiry.in_answer_content}');
	
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