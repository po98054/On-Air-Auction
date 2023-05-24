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
		width: 900px; height: 500px; margin-top: 60px; margin-left: 350px; 
	}
	.body .body-middle .Result-Data table{
		border: 1px solid black; border-collapse: collapse; width: 600px; height: 50px; 
	}
	.body .body-middle table th{
		border: 1px solid black; text-align: center;
	}
	.body .body-middle table th:nth-child(1){
        width: 300px;
    }
    .body .body-middle table th:nth-child(2){
        width: 190px;
    }
    .body .body-middle table th:nth-child(3){
        width: 250px;
    }
    .body .body-middle table th:nth-child(4){
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
					<h1 style="text-align: center;">환불 내역</h1>
				</div>	
			</div>
			<div class="Result-Data">
				<table>
					<thead>
						<tr>
							<th>환불 물품명</th>
							<th>환불 진행 상태</th>
							<th>환불 신청 날짜</th>
							<th>환불 확정 날짜</th>
						</tr>
					</thead>
          	<tbody>
          		<c:forEach items="${list}" var="pa">
            		<tr>
                	<td>${pa.pr_name}</td>
					<td>${pa.re_progress}</td>
                	<td>${pa.re_apply_date}</td>
                	<td>${pa.re_confirm_date}<td>
                	
             	 </tr>
              </c:forEach>
            </tbody>
            
				</table>
				
			</div>
            <form class="input-group" action="<c:url value='/MyPage/RefundList'></c:url>">
            	
                <select class="input-group-prepend" name="type">
                	
                    <option value="0">분류</option>
                    	
                    <option value="${pr_name}">환불 물품명</option>
                    	
            	</select>
            		
            	<input type="text" class="form-control" placeholder="Search" name="search" value="${pm.criteria.search}">
            	<div class="input-group-append">	
            		<button class="btn btn-success" type="submit">검색</button>
            	</div>
            	
            </form>
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