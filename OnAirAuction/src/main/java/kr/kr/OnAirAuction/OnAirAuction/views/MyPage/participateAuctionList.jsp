<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>

<!-- 경매 참가 내역 (일반/실시간 경매 화면) -->

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
		margin-top: 5px; margin-bottom: 20px; margin-left: 70px;
	}
	.body .body-middle .middle .beforeMonth .data{
		margin-left: 15px; color:black;
	}
	.body .body-middle .middle .auction-list{
		float: left; width: 350px;  height: 50px; margin-top: 30px; margin-left: 180px;
	}
	.body .body-middle .middle .TotalData{
		float: right; width: 400px; height: 50px;
	}
	.body .body-middle .middle .TotalData .Total{
		margin-top: 10px; margin-bottom: 20px; margin-left: 90px;
	}
	.body .body-middle .middle .TotalData .ten{
		margin-left: 100px; color:black;
	}
	.body .body-middle .middle .TotalData .total-data{
		margin-left: 90px; color:black;
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
        width: 110px;
    }
    .body .body-middle table th:nth-child(2){
        width: 280px;
    }
    .body .body-middle table th:nth-child(3){
        width: 130px;
    }
    .body .body-middle table th:nth-child(4){
        width: 250px;
    }
    .body .body-middle table th:nth-child(5){
        width: 130px;
    }
    .body .body-middle table th:nth-child(6){
        width: 250px;
    }
    .body .body-middle table th:nth-child(7){
        width: 180px;
    }
    .body .body-middle table th:nth-child(8){
        width: 150px;
    }
    .body .body-middle table th:nth-child(9){
        width: 150px;
    }
    .body .body-middle table th:nth-child(10){
        width: 220px;
    }
    .body .body-middle table th:nth-child(11){
        width: 250px;
    }
    .body .body-middle table th:nth-child(12){
        width: 250px;
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

</style>

<link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'></c:url>">

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
					<ul>
                        <li style="text-align: center; font-size: 20px;">경매 참가 내역<br>
                        </li>
                    </ul>
				</div>
			<div class="Result-Data">
			
				<table class="auction"> 
					<thead>
					<tr>
						<th>경매 번호</th>
						<th>경매 카데고리 명</th>
						<th>판매자명</th>
						<th>판매 물품명</th>
						<th>최초 입찰가</th>
						<th>경매 시작 시간</th>
						<th>경매 상태</th>
    					<th>낙찰 가격</th>
    				</tr>
    				</thead>
    				<tbody>
    				<c:forEach items="${list}" var="pa">
    				<tr>
    					<td>
    						<a href="#" class="auction">${pa.au_num}</a>
    					</td>
    					<td>${pa.ac_name}</td>
    					<td>
    						<a href="#" class="product">${pa.au_me_id}</a>
    					</td>
    					<td>${pa.pr_name}</td>
						<td>${pa.pr_start_price}</td>
						<td>${pa.au_start_date}</td>
						<td>${pa.pr_state}</td>
						<td>${pa.ar_bid_price}</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
			
			</div>
			
            <form class="input-group" action="<c:url value='/MyPage/participateAuctionList'></c:url>">
            	
                <select class="input-group-prepend" name="type">
                	
                    <option value="0">분류</option>
                    	
                    <option value="${pr_name}">판매물품명</option>
                    	
                    <option value="${au_me_id}">판매자명</option>
                    	
            	</select>
            		
            	<input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
            	
            	<div class="input-group-append">
            		
            		<button class="btn btn-success" type="submit">검색</button>
            			
            	</div>
            </form>	
            <div class="container" style="margin-top: 10px;">
            
            <ul class="pagination justify-content-center">
                
            	<c:if test = "${pm.prev}">
                	
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/participateAuctionList?page=${pm.startPage - 1}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">이전</a>
                    	
                    </li>
                    
                </c:if>
                
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                
                    <li>
                    	
                    	<a class="page-link" href="<c:url value='/MyPage/participateAuctionList?page=${i}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">${i}</a>
                    	
                    </li>
                    
                </c:forEach>
                
                <c:if test="${pm.next}">
                
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/participateAuctionList?page=${pm.endPage + 1}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">다음</a>
                    
                    </li>
                    
                </c:if>
                
            </ul>
            </div>
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
    	
    	
    	
    </script>