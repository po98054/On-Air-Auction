<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">

<link href="<c:url value='/resources/css/star-rating.css'></c:url>" media="all" rel="stylesheet" type="text/css" />

<link href="<c:url value='/resources/css/summernote-bs4.css'></c:url>" rel="stylesheet">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<!--<script src="<c:url value='/resources/js/jquery-3.3.1.slim.min.js'></c:url>"></script>  -->

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/summernote-bs4.js'></c:url>"></script>

<script src="<c:url value='/resources/js/star-rating.js'></c:url>" type="text/javascript"></script>

<style>

	.body{
        height: 700px; width: 1900px;
	}
	.body .body-left{
		float:left; width: 250px; height:700px; border-right: 1px solid black;
	}
	.body .body-left .nav-ul{
		margin-top: 5px;
	}
    .body .body-left .nav-ul .list-li:nth-child(1){
        width: 250px; height: 180px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(2){
        width: 250px; height: 120px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
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
    .star_rating {
        font-size:0; letter-spacing:-4px;
    }
    .star_rating a {
        font-size:22px;
        letter-spacing:0;
        display:inline-block;
        margin-left:5px;
        color:#ccc;
        text-decoration:none;
    }
    .star_rating a:first-child {
        margin-left:25px;
    }
    .star_rating a.on {
        color:#777;
    }
    .body .body-middle{
        float:left; width: 1150px; height:700px;
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

<!-- 후기 등록 -->

<div class="body">
		<div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="<c:url value='/MyPage/participateAuctionList'></c:url>" class="item-a">경매 참가 내역</a><br>
                    <a href="<c:url value='/MyPage/OrderAuctionList'></c:url>" class="item-a">주문 내역</a><br>
                    <a href="<c:url value='/MyPage/RefundList'></c:url>" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
                    <a href="<c:url value='/MyPage/heldAuctionList'></c:url>" class="item-a">경매 개최 내역</a><br>
				</li>	
				<li class="list-li">후기<br>
					<a href="<c:url value='/MyPage/ReviewInsert'></c:url>" class="item-a">후기 작성</a><br>
                    <a href="<c:url value='/MyPage/ReviewList'></c:url>" class="item-a">후기 조회</a>	
				</li>	
				<li class="list-li">신고<br>
					<a href="<c:url value='/MyPage/ReportInsert'></c:url>" class="item-a">신고 작성</a><br>
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
        
           <form action="<c:url value='/MyPage/ReviewInsert'></c:url>" method="post" enctype="multipart/form-data">
           	
           	<input type="hidden" name="me_id" value="${user2.me_id}">
           
           	 <div class="form-group" style="margin-left: 10px">
		
				<label for="title">제목:</label>
			
				<input type="text" class="form-control" id="title" name="re_title">
			
			 </div>
			 
			 <div class="form-group">
			
				<select class="form-control" name="re_satisfaction" id="type">
			
					<option value="0">평점을 선택하세요.</option>
				
					<option value="1">★☆☆☆☆</option>
					
					<option value="2">★★☆☆☆</option>
					
					<option value="3">★★★☆☆</option>
					
					<option value="4">★★★★☆</option>
					
					<option value="5">★★★★★</option>
				
				</select>
			
			</div>
			
			<div class="OrName" style="">
			
			<label for="Order" id="orList">구매 기록</label>
			
			 <button type="button" class="btn btn-primary btn-search" data-toggle="modal" data-target="#myModal">검색</button>
			 
			</div>
			
			<div id="common" style="margin-left: 10px">
		
				<div class="form-group" style="margin-left: 10px">
			
					<label for="content">내용:</label>
					
					<textarea id="content" name="re_content"></textarea>
				
				</div>
			
			</div>
			
			<div id="image" style="margin-left: 10px">
		
			<label>이미지:</label>
			
			<div class="form-group mt-3" style="margin-left: 10px">
			
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
		
		<button class="btn btn-outline-success col-12 mb-2" style="margin-left: 10px">후기 등록</button>
		
       </form>
       
        <!-- The Modal -->
      <div class="modal" id="myModal" style="margin-top: 150px;">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
            	
                <label>구매 기록</label>
            		
            	
            		
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
	
		height: 120
	
	});
	
	$('form').submit(function(){
		
		let re_satisfaction = $('[name=re_satisfaction]').val();
		
		if(re_satisfaction  == 0){
			
			alert('별점을 선택하세요.');
			
			$('[name=re_satisfaction]').focus();
			
			return false;
			
		}
		
		let re_title = $('[name=re_title]').val();
		
		if(re_title.trim().length  == 0){
			
			alert('제목을 입력하세요.');
			
			$('[name=re_title]').focus();
			
			return false;
			
		}
		
		let re_content = $('[name=re_content]').val();
		
		if(re_content.trim().length  == 0){
			
			alert('내용을 입력하세요.');
			
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
		  
		  return true;
		
	});
	
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
	
	$('.btn-search').click(function(){
		
		let me_id = $('[name=me_id]').val();
		
		let id = $('.sport').val();
		
		console.log(id);
			
			console.log(me_id);
			
			let order = {
					
					me_id : me_id
					
			};
			
			select(order);
	    
	})

	function select(order){
		
		ajax('POST', order, '<c:url value="/OrderList"></c:url>', function(data){
			
				if(data.order){
					
					let str = '';
					
					let order = data.order;
					
					for(i = 0; i < order.length; i++){
						
					str +=
						
						'<table class="table table-striped">' + '<thead>' + '<tr>' + '<th>경매 기록 번호</th>' + 
						
						'<th>제품명</th>' + '<th>경매 개최자 아이디</th>' + '</tr>' + '</thead>';
						
					str +=
							
						'<tbody>' + '<tr>'+ '<td>' + '<a href="#" class="ar_num">' + order[i].ar_num + '</a>' + '</td>' +
						
						'<td>' + order[i].pr_name + '</td>'
						
						+ '<td>' + order[i].au_me_id + '</td>' ;
						
					str +=
							
						'</tr>' + '</tbody>' + '</table>';
						
					}
						
					$('.dream').html(str);
					
				}
				
			});
		
		
		
		$('.ar_num').click(function(){
			
			let ar_num = $(this).text();
			
			console.log("경매 기록 번호 : " + ar_num);
			
			 ar_num = parseInt(ar_num);
			
			console.log($.type(ar_num));
			
			let OrName = {
					
					ar_num : ar_num
					
			};
			
			console.log(OrName);
			
			selectOrName(OrName);
			
		})
		
		}
		
	function selectOrName(OrName){
		
		ajax('POST', OrName, '<c:url value='/MyPage/OrderSelect'></c:url>', function(data){
			
			if(data.result){
				
				let str2 = '';
				
				let result = data.result;
				
				for(i = 0; i < result.length; i++){
					
					console.log(result[i].ar_num);
					
					console.log("result[i].ar_num 데이터 타입 : " + $.type(parseInt(result[i].ar_num)));
				
				str2 +=
					
					'<input type="number" name="re_ar_num" value="'+ parseInt(result[i].ar_num) + '" style="width: 200px;"/>' +
					
					'<button type="button" class="searchButton" data-toggle="modal" data-target="#myModal">검색</button>';
					
				}
					
				$('.OrName').html(str2);
				
				let p = $('[name=re_ar_num]').val();
				
				console.log("p의 값 : " + p);
				
				console.log("p의 데이터 타입 : " + $.type(p));
				
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