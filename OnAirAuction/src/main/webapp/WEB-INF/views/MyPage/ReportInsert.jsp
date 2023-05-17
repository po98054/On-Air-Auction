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

<!-- 신고 등록 -->

<div class="body">
		<div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="<c:url value='/MyPage/participateAuctionList'></c:url>" class="item-a">경매 참가 내역</a><br>
                    <a href="<c:url value='/MyPage/heldAuctionList'></c:url>" class="item-a">경매 개최 내역</a><br>
                    <a href="<c:url value='/MyPage/OrderAuctionList'></c:url>" class="item-a">주문 내역</a><br>
                    <a href="<c:url value='/MyPage/RefundList'></c:url>" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
					<a href="<c:url value='/MyPage/participateAuctionList'></c:url>" class="item-a">경매 참가 내역</a><br>
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
        
           <form action="<c:url value='/MyPage/ReportInsert'></c:url>" method="post" enctype="multipart/form-data">
           
           	<div class="form-group">
		
			<label for="type">게시판:</label>
			
			<select class="form-control" name="re_rc_num" id="type">
			
				<option value="0">신고 카데고리를 선택하세요.</option>
				
				<c:forEach items="${reportCategory}" var="reca">
				
					<option value="${reca.rc_num}" class="rc_num">${reca.rc_name}</option>
				
				</c:forEach>
				
			</select>
			
			</div>
			
			 <div class="PrName" style="width:120px; height: 40px; display: none;">
			
				<label for="person" id="me_id">유저</label>
			
			 	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">검색</button>
			 
			</div>
			
			<div class="PrdName" style="width:120px; height: 40px; display: none;">
			
				<label for="product" id="pr_name">상품</label>
			
				 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">검색</button>
			 
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
		
		<button class="btn btn-outline-success col-12 mb-2" style="margin-left: 10px">신고 등록</button>
			 
		</form>
		
		 <!-- The Modal -->
      <div class="modal" id="myModal2" style="margin-top: 150px;">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
            	
                <label>상품</label>
            		
            	<input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
            	
            	<div class="input-group-append">
            		
            		<button class="btn btn-success" type="submit" id="btn-search2">검색</button>
            			
            	</div>
            	
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              
            </div>
            
            <!-- Modal body -->
            <div class="modal-body dream2">
              
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
            
          </div>
        </div>
      </div>
		
		 <!-- The Modal -->
      <div class="modal" id="myModal" style="margin-top: 150px;">
        <div class="modal-dialog">
          <div class="modal-content">
          
            <!-- Modal Header -->
            <div class="modal-header">
            	
                <label>유저</label>
            		
            	<input type="text" class="form-control" placeholder="Search" name="select" value="${pm.criteria.select}">
            	
            	<div class="input-group-append">
            		
            		<button class="btn btn-success" type="submit" id="search">검색</button>
            			
            	</div>
            	
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              
            </div>
            
            <!-- Modal body -->
            <div class="modal-body Person">
              
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
	
	let rc = [];
	
	<c:forEach items="${reportCategory}" var="rc">
	
		<c:if test="${rc.rc_name == '유저'}">rc.push('${rc.rc_num}')</c:if>
		
	</c:forEach>
	
	console.log(rc);
	
	$('#type').change(function(){
		
		let val = $(this).val();
		
		console.log(val);
		
		console.log(rc);
		
		console.log(rc.indexOf(val));
		
		$('.PrName').hide();
		
		
		if(val == 0) {
			
			return;
			
		}
		
		if(rc.indexOf(val) == 0){
			
			$('.PrName').show();
			
		}else{
			
			$('.PrdName').show();
			
		}
		
	});
	
    $('#content').summernote({
        placeholder: '내용을 입력하세요.',
        tabsize: 2,
        height: 140
    });

    $('.file-box,.preview').click(function(){
	$(this).siblings('input').click();
	});
    
	$('form').submit(function(){
		
		let re_num = $('[name=re_num]').val();
		
		if(rc_num  == 0){
			
			alert('신고 카데고리를 선택하세요.');
			
			$('[name=re_rc_num]').focus();
			
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

$('#search').click(function(){
	
	console.log(1);
	
	let select = $('[name=select]').val();
	
	console.log(select);
	
	let Person = {
			
			select : select
			
	};
	
	search(Person)
    
})

function search(Person){
	
	ajax('POST', Person, '<c:url value="/PersonList"></c:url>', function(data){
		
			if(data.person){
				
				let str = '';
				
				let person = data.person;
				
				for(i = 0; i < person.length; i++){
					
				str +=
					
				'<table class="table table-striped">' + '<thead>' + '<tr>' + '<th>아이디</th>' + 
				
				'<th>이름</th>' + '<th hidden></th>' + '</tr>' + '</thead>';
				
				str +=
					
				'<tbody>' + '<tr>'+ '<td>' + '<a href="#" class="user">' + person[i].me_id + '</a>' + '</td>' +
				
				'<td>' + person[i].me_name + '</td>';
				
				str +=
					
				'</tr>' + '</tbody>' + '</table>';
				
				}
				
				$('.Person').html(str);
				
			}
			
		});
	
	let id = $('.user').text();
	
	let PrName = {
			
			me_id : id
			
	};
	
	console.log(PrName);
	
	$('.user').click(function(){
		
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
				
				'<input type="hidden" name="re_report_id" value="'+ result[i].me_id + '"/>' +
				
				'<label for="person" id="me_id" name="re_report_id">' + result[i].me_id + '</label>' +
				
				'<button type="button" class="searchButton" data-toggle="modal" data-target="#myModal">검색</button>';
				
			}
				
			$('.PrName').html(str2);
			
			$('.PrName').show();
			
	}
	
})

}

$('#btn-search2').click(function(){
	
	let search = $('[name=search]').val();
	
	console.log(search);
	
	let product = {
			
			search : search
			
	};
	
	select(product)
    
})

function select(product){
	
	ajax('POST', product, '<c:url value="/ProductList"></c:url>', function(data){
		
			if(data.product){
				
				let str = '';
				
				let product = data.product;
				
				for(i = 0; i < product.length; i++){
					
				str +=
					
				'<table class="table table-striped">' + '<thead>' + '<tr>' + '<th>상품명</th>' + 
				
				'<th>이름</th>' + '<th hidden></th>' + '</tr>' + '</thead>';
				
				str +=
					
				'<tbody>' + '<tr>'+ '<td>' + '<a href="#" class="sport">' + product[i].pr_name + '</a>' + '</td>' +
				
				'<td>' + product[i].me_name + '</td>'
				
				+ '<td hidden class="code">' + product[i].pr_code + '</td>' ;
				
				str +=
					
				'</tr>' + '</tbody>' + '</table>';
				
				}
				
				$('.dream2').html(str);
				
			}
			
		});
	
	let pr = $('.sport').text();
	
	let code = $('.code').text();
	
	code = parseInt(code);
	
	console.log($.type(code));
	
	let prName = {
			
			pr_name : pr,
			
			pr_code : code
			
	};
	
	console.log(prName);
	
	$('.sport').click(function(){
		
		selectPrdName(prName);
		
	})
	
	}
	
function selectPrdName(prName){
	
	ajax('POST', prName, '<c:url value='/MyPage/ProductSelect'></c:url>', function(data){
		
		if(data.result){
			
			let str2 = '';
			
			let result = data.result;
			
			for(i = 0; i < result.length; i++){
				
				console.log(result[i].pr_name);
				
				console.log(result[i].pr_code);
				
				console.log($.type(result[i].pr_code));
			
			str2 +=
				
				'<input type="hidden" name="re_pr_code" value="'+ result[i].pr_code + '"/>' +
				
				'<label for="product" id="pr_name" name="re_report_product">' + result[i].pr_name + '</label>' +
				
				'<button type="button" class="searchButton" data-toggle="modal" data-target="#myModal2">검색</button>';
				
			}
				
			$('.PrdName').html(str2);
			
			$('.PrdName').show();
			
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