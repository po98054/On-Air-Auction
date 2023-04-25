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
					<a href="./마이페이지_신고작성.html" class="item-a">신고 작성</a><br>
                    <a href="./마이페이지_신고조회.html" class="item-a">신고 조회</a>	
				</li>	
				<li class="list-li">문의 사항<br>	
					<a href="./마이페이지_상품문의등록.html" class="item-a">문의 사항 등록</a><br>
                    <a href="./마이페이지_상품문의조회.html" class="item-a">문의 사항 조회</a>
				</li>
				<li class="list-li">회원<br>
					<a href="./마이페이지_회원정보수정.html" class="item-a">회원 정보 수정</a><br>
                    <a href="./마이페이지_회원탈퇴.html" class="item-a">회원 탈퇴</a>
				</li>		
			</ul>		
		</div>
		
		<div class="body-middle">
        
           <form action="<c:url value='/MyPage/ReportUpdate/${report.re_num}'></c:url>" method="post" enctype="multipart/form-data">
           
           	<div class="form-group">
		
			<label for="type">게시판:</label>
			
			<select class="form-control" name="re_rc_num" id="type">
			
				<option value="0">신고 카데고리를 선택하세요.</option>
				
				<c:forEach items="${reportCategory}" var="reca">
				
					<option value="${reca.rc_num}" <c:if test="${report.re_rc_num == reca.rc_num}">selected</c:if>>${reca.rc_name}</option>
					
				</c:forEach>
				
			</select>
			
			</div>
			
			<div class="PrName" style="width:140px; height: 30px; margin-bottom: 70px;">
			
			<label for="person" id="pr_name">신고 당한 사람 : &nbsp;&nbsp;&nbsp; ${report.re_report_id}  </label>
			
			 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">검색</button>
			 
			</div>
			 
			 <div id="common" style="margin-left: 10px">
		
				<div class="form-group" style="margin-left: 10px">
			
					<label for="content">내용:</label>
					
					<textarea id="content" name="re_content"></textarea>
				
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
		
		<button class="btn btn-outline-success col-12 mb-2" style="margin-left: 10px">신고 수정</button>
			 
		</form>
		
		 <!-- The Modal -->
      <div class="modal" id="myModal" style="margin-top: 150px;">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
            	
                <label>유저</label>
            		
            	<input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
            	
            	<div class="input-group-append">
            		
            		<button class="btn btn-success" type="submit" id="btn-search">검색</button>
            			
            	</div>
            	
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              
            </div>
            
            <!-- Modal body -->
            <div class="modal-body dream">
              
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
            
          </div>
        </div>
      </div>
      
	</div>
	</div>
	
	<script>
    $('#content').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 140
    });
    
	$('form').submit(function(){
		
		let rc_num = $('[name=re_rc_num]').val();
		
		if(rc_num  == 0){
			
			alert('신고 카데고리를 선택하세요.');
			
			$('[name=re_rc_num]').focus();
			
			return false;
			
		}
		
		let in_content = $('[name=re_content]').val();
		
		if(re_content.trim().length  == 0){
			
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
	
	$('#content').summernote('code','${report.re_content}');
	
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

	$('#btn-search').click(function(){
		
		let search = $('[name=search]').val();
		
		console.log(search);
		
		let Person = {
				
				search : search
				
		};
		
		select(Person)
	    
	})

	function select(Person){
		
		ajax('POST', Person, '<c:url value="/PersonList"></c:url>', function(data){
			
				if(data.person){
					
					let str = '';
					
					let person = data.person;
					
					for(i = 0; i < person.length; i++){
						
					str +=
						
					'<table class="table table-striped">' + '<thead>' + '<tr>' + '<th>아이디</th>' + 
					
					'<th>이름</th>' + '<th hidden></th>' + '</tr>' + '</thead>';
					
					str +=
						
					'<tbody>' + '<tr>'+ '<td>' + '<a href="#" class="sport">' + person[i].me_id + '</a>' + '</td>' +
					
					'<td>' + person[i].me_name + '</td>';
					
					str +=
						
					'</tr>' + '</tbody>' + '</table>';
					
					}
					
					$('.dream').html(str);
					
				}
				
			});
		
		let id = $('.sport').text();
		
		let PrName = {
				
				me_id : id
				
		};
		
		console.log(PrName);
		
		$('.sport').click(function(){
			
			selectPrName(PrName);
			
		})
		
		}
		
	function selectPrName(PrName){
		
		ajax('POST', PrName, '<c:url value='/MyPage/MemberSelect'></c:url>', function(data){
			
			if(data.result){
				
				let str2 = '';
				
				let result = data.result;
				
				for(i = 0; i < result.length; i++){
					
					console.log(result[i].me_id);
				
				str2 +=
					
					'<label for="person" id="me_id" name="re_report_id">' + result[i].me_id + '</label>' +
					
					'<button type="button" class="searchButton" data-toggle="modal" data-target="#myModal">검색</button>';
					
				}
					
				$('.PrName').html(str2);
				
		}
		
	})

	}
			
	function ajax(method, obj, url, successFunc, errorFunc){
		
		$.ajax({
			
				async:false,
				
				type: method,
				
				data: JSON.stringify(obj),
				
				url: url,
				
				dataType:"json",
				
				contentType:"application/json; charset=UTF-8",
				
				success : successFunc
				
			});
			
		}
</script>