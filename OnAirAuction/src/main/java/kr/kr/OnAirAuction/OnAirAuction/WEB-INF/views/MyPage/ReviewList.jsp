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
		margin-top: 10px; margin-bottom: 20px; margin-left: 70px;
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
        width: 70px;
    }
    .body .body-middle table th:nth-child(2){
        width: 300px;
    }
    .body .body-middle table th:nth-child(3){
        width: 230px;
    }
    .body .body-middle table th:nth-child(4){
        width: 100px;
    }
    .body .body-middle table th:nth-child(5){
        width: 130px;
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
				<div class="auction-list">	
					<h1 style="text-align: center; margin-top: 5px;">후기 내역</h1>
				</div>	
			</div>
			<div class="Result-Data">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>후기 번호</th>
                        <th>제목</th>
                        <th>별점</th>
                        <th>등록 일자</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="pa">
                    <tr>
                        <td>
                            <a href="<c:url value='/MyPage/ReviewDetail/${pa.re_num}'></c:url>" class="auction">${pa.re_num}</a>
                        </td>
                        <td>${pa.re_title}</td>
                        <td>
                        	<c:if test="${pa.re_satisfaction == 1}">★☆☆☆☆</c:if>
                        	<c:if test="${pa.re_satisfaction == 2}">★★☆☆☆</c:if>
                        	<c:if test="${pa.re_satisfaction == 3}">★★★☆☆</c:if>
                        	<c:if test="${pa.re_satisfaction == 4}">★★★★☆</c:if>
                        	<c:if test="${pa.re_satisfaction == 5}">★★★★★</c:if>
                        </td>
                        <td>${pa.re_registration_str}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        
         <div class="container" style="margin-top: 10px;">
            
            <ul class="pagination justify-content-center">
                
            	<c:if test = "${pm.prev}">
                	
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/ReviewList?page=${pm.startPage - 1}'></c:url>">이전</a>
                    	
                    </li>
                    
                </c:if>
                
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                
                    <li>
                    	
                    	<a class="page-link" href="<c:url value='/MyPage/ReviewList?page=${i}'></c:url>">${i}</a>
                    	
                    </li>
                    
                </c:forEach>
                
                <c:if test="${pm.next}">
                
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/ReviewList?page=${pm.endPage + 1}'></c:url>">다음</a>
                    
                    </li>
                    
                </c:if>
                
            </ul>
            
            </div>
            
            </div>
            
            </div>