<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>


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
		display: inline-block; padding-to: 2px; color: black; margin-top: 6px; font-weight: normal;
	}
	.body .body-middle{
		float:left; width: 1400px; height: 700px; border-right: 1px solid black;
	}
	.body .body-middle .middle{
		width: 1400px; height: 50px; 
	}
	.body .body-middle .middle .beforeMonth{
		float:left; width: 400px; height: 50px; 
	}
	.body .body-middle .middle .beforeMonth .Month{
		margin-top: 10px; margin-bottom: 20px; margin-left: 70px;
	}
	.body .body-middle .middle .beforeMonth .data{
		margin-left: 15px; color:black;
	}
	.body .body-middle .middle .auction-list{
		float: left; width: 500px;  height: 50px; margin-top: 30px; margin-left: 110px;
	}
	.body .body-middle .Result-Data{
		width: 900px; height: 500px; margin-top: 60px; margin-left: 5px; 
	}
	.body .body-middle .Result-Data table{
		border: 1px solid black; border-collapse: collapse; width: 1350px; height: 50px;
	}
	.body .body-middle table th{
		border: 1px solid black; text-align: center;
	}
	.body .body-middle table th:nth-child(1){
		width: 70px;
  }
  .body .body-middle table th:nth-child(2){
    width: 90px;
  }
  .body .body-middle table th:nth-child(3){
    width: 250px;
  }
  .body .body-middle table th:nth-child(4){
    width: 100px;
  }
  .body .body-middle table th:nth-child(5){
    width: 200px;
  }
  .body .body-middle table th:nth-child(6){
    width: 200px;
  }
  .body .body-middle table th:nth-child(7){
		width: 120px;
    }
    .body .body-middle table th:nth-child(8){
			width: 120px;
    }
    .body .body-middle table td{
		border: 1px solid black; text-align: center; height: 30px;
		}
    .body .body-middle table td .auction{
        color: blue;
    }
    .body .body-middle table td .product{
        color: green;
    }
    .body .body-middle .search{
        margin-left: 500px; 
    }
    .body .body-middle .search button{
        border-radius: 10px; background: black;
        color: #fff; cursor: pointer;
    }
    #modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index:2;
    }
    .modal_layer {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        height: 100%;
        background:rgba(0, 0, 0, 0.5);
        z-index:1;
    }
    .modal_layer5 .modal_content3 {
        display: block;
        width:600px;
        height: 500px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    }
    #modal_close_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_confirm_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 30px; font-weight: bold; cursor: pointer;
    }
    .textarea_container{
        width: 100%; overflow: hidden;height: 290px; margin-top: 10px; border: 2px solid #ccc; border-radius: 20px;
    }

</style>

<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'></c:url>">


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
			<div class="middle">	
				<div class="beforeMonth">	
					<ul class="Month">	
						<li style="text-align: center;">기간별 데이터 조회</li>	
					</ul>
					<form name="searchFrm" style="width:350px; height:30px; margin-left: 65px;">
						<input type="text" class="fromDate" name="fromDate" id="fromDate" style="width: 120px;" value="${pm.criteria.fromDate_str}"> ~ &nbsp;
						<input type="text" class="toDate" name="toDate" id="toDate" style="width: 120px;" value="${pm.criteria.toDate_str}">
						<button type="submit" class="btn-success" id="btnSearch">검색</button>
					</form>
				</div>	
				<div class="auction-list">	
					<h1 style="text-align: center;">경매 개최 내역 - 역경매</h1>
				</div>	
			</div>
			<div class="Result-Data">
				<table>
					<thead>
						<tr>
							<th>선택</th>
							<th>경매 번호</th>
							<th>경매 물품명</th>
							<th>최초 입찰가</th>
							<th>경매 시작 시간</th>
							<th>경매 종료 시간</th>
							<th>경매 상태</th>
              <th>즉시 가격</th>
						</tr>
					</thead>
          	<tbody>
          		<c:forEach items="${list}" var="pa">
            		<tr>
					<td>
						<c:if test = "${pa.pr_state ne '경매 취소'}">
                			<input type="radio" name="radio" value="${pa.au_num}">
                		</c:if>
            		</td>
              		<td>
                		<a href="#" class="auction">${pa.au_num}</a>
                	</td>
                	<td>${pa.pr_name}</td>
                	<td>${pa.pr_start_price}</td>
                	<td>${pa.au_start_date}</td>
					<td>${pa.au_final_date}</td>
                	<td>${pa.pr_state}</td>
                	<td>${pa.au_immediate}</td>
                	
             	 </tr>
              </c:forEach>
            </tbody>
            
				</table>
				
			</div>
            <form class="input-group" action="<c:url value='/MyPage/heldAuctionList'></c:url>">
            	
                <select class="input-group-prepend" name="type">
                	
                    <option value="0">분류</option>
                    	
                    <option value="${pr_name}">판매물품명</option>
                    	
            	</select>
            		
            	<input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
            	<div class="input-group-append">	
            		<button class="btn btn-success" type="submit">검색</button>
            		<button type="button" id="modal_open_btn5" style="display:none">취소</button>
            		<a href="./구매등록.html">
                		<button class="btn-update" style="display:none">경매 수정</button>
            		</a>
            	</div>
            	
            </form>
					
					 <div class="modal_layer modal_layer5">
        		<div id="modal">
            <div class="modal_content3">
            		<input type="hidden" name="pr_state" value="경매 취소">
                    <div class="textarea_container">
                        <textarea name="ac_reason" id="" cols="30" rows="10" style="border: none; width: 100%; height: 100%; border-radius: 20px; padding: 10px; box-sizing: border-box; border: 1px solid #ccc;" placeholder="내용을 입력해주세요."></textarea>
                    </div>
               
            </div>
            <button type="button" id="modal_close_btn5" class="close_btn2">닫기</button>
            <button type="submit" id="modal_confirm_btn5" class="confirm_btn2">취소 확정</button>
           
        </div>
    	</div>
            <div class="container" style="margin-top: 10px;">
            
            <ul class="pagination justify-content-center">
                
            	<c:if test = "${pm.prev}">
                	
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/heldAuctionList?page=${pm.startPage - 1}&search=${pm.criteria.search}&fromDate=${pm.criteria.fromDate}&toDate=${pm.criteria.toDate}'></c:url>">이전</a>
                    	
                    </li>
                    
                </c:if>
                
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                
                    <li>
                    	
                    	<a class="page-link" href="<c:url value='/MyPage/heldAuctionList?page=${i}&search=${pm.criteria.search}&fromDate=${pm.criteria.fromDate}&toDate=${pm.criteria.toDate}'></c:url>">${i}</a>
                    	
                    </li>
                    
                </c:forEach>
                
                <c:if test="${pm.next}">
                
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/heldAuctionList?page=${pm.endPage + 1}&search=${pm.criteria.search}&fromDate=${pm.criteria.fromDate}&toDate=${pm.criteria.toDate}'></c:url>">다음</a>
                    
                    </li>
                    
                </c:if>
                
            </ul>
            </div>
		</div>
    </div>

<script src="<c:url value='/resources/js/jquery-ui.js'></c:url>"></script>

    <script>
    
    	$(function(){
    		
    		$(".fromDate").datepicker({
    			
    			dateFormat : 'yy-mm-dd'
    			
    		});
    		
			$(".toDate").datepicker({
    			
    			dateFormat : 'yy-mm-dd'
    			
    		});
    		
    	})
    	
    	$("input[name='radio']").change(function(){
    		
        if($("input[name=radio]:checked")){
        	
            $('#modal_open_btn5').show();
            $('.btn-update').show();
        }else{
            $('#modal_open_btn5').hide();
            $('.btn-update').hide();
        }})
    	
    	$(function(){
        const modal1 = document.querySelector('.modal_layer5')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
        
        const btnModal = document.getElementById("modal_open_btn5")
        btnModal.addEventListener("click", e => {
            modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn5")
        closeBtn.addEventListener("click", e => {
            modalOff1()
        })
    })
    
    $("#modal_open_btn5").click(function(){
    	
    	const au_num = $("input[name='radio']:checked").val();
    	
    	let pr_state = $("input[name='pr_state']").val();
    	
    	console.log(au_num);
    	
    	console.log(pr_state);
    	
    	$('.confirm_btn2').click(function(){
    		
    		let ac_reason = $('[name=ac_reason]').val();
    		
    		if(ac_reason.trim().length == 0){
    			
    			alert('취소 사유를 입력하세요.');
    			
    			return;
    			
    		}
    		
    		let cancle = {
    				
    				ac_reason : ac_reason,
    				
    				ac_au_num : au_num
    				
    			}
    		
    		let update = {
    				
    				pr_state : pr_state,
    				
    				au_num : au_num
    				
    		}
    		
    		console.log(cancle);
    		
    		console.log(update);
    		
    		insertCancle(cancle);
    		
    		updateAuction(update);
    		
    	})
    	
    })
    
    function insertCancle(cancle){
	
	ajax('POST', cancle, '<c:url value="/AuctionCancle/insert"></c:url>', function(data){
		
			if(data.result){
				
				alert('해당 경매를 취소했습니다.');
				
				
				
			}else{
				
				alert('해당 경매 취소에 실패했습니다.');
				
			}
			
		});
	
	}
    	
    function updateAuction(update){
    		
    	ajax('POST', update, '<c:url value="/Auction/update"></c:url>', function(data){
    		
    		if(data.res){
    			location.href = '<c:url value="/MyPage/heldAuctionList"></c:url>';
    		
    		} else{
    			
    		}
    		
    	});
    		
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
    