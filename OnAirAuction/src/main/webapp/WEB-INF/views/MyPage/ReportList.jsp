<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		display: inline-block; padding-top: 2px; color:black; margin-top: 6px; font-weight: normal;
	}
    .body .body-middle{
		float:left; width: 1400px; height: 700px; border-right: 1px solid black;
	}
    .body .body-middle .Result-Data{
		width: 900px; height: 500px; margin-top: 20px; margin-left: 5px; 
	}
	.body .body-middle .Result-Data table{
		border: 1px solid black; border-collapse: collapse; width: 1350px; height: 50px;
	}
	.body .body-middle table th{
		border: 1px solid black; text-align: center;
	}
	.body .body-middle table th:nth-child(1){
        width: 90px;
    }
    .body .body-middle table th:nth-child(2){
        width: 110px;
    }
    .body .body-middle table th:nth-child(3){
        width: 230px;
    }
    .body .body-middle table th:nth-child(4){
        width: 60px;
    }
    .body .body-middle table th:nth-child(5){
        width: 100px;
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

<!-- 신고 조회 화면 -->

<div class="body">
        <div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="#" class="item-a">경매 참가 내역(일반/실시간 경매)</a><br>
                    <a href="#" class="item-a">경매 참가 내역(인원수 제한 경매)</a><br>
                    <a href="#" class="item-a">경매 개최 내역</a><br>
                    <a href="#" class="item-a">주문 내역</a><br>
                    <a href="#" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
					<a href="#" class="item-a">경매 참가 내역</a><br>
                    <a href="#" class="item-a">경매 개최 내역</a><br>
                    <a href="#" class="item-a">판매 내역</a>
				</li>	
				<li class="list-li">후기<br>
					
                    <a href="#" class="item-a">후기 조회</a>	
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
            <h1 style="text-align: center; margin-top: 5px;">신고 내역</h1>
        <div class="Result-Data">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>신고 번호</th>
                        <th>신고 카데고리명</th>
                        <th>내용</th>
                        <th>신고 피의자</th>
                        <th>상품 명</th>
                        <th>신고자</th>
                        <th>신고 날짜</th>
                        <th>신고 여부</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="pa">
                    <tr>
                        <td>
                             <a href="<c:url value='/MyPage/ReportDetail/${pa.re_num}'></c:url>" class="auction">${pa.re_num}</a>
                        </td>
                        <td>${pa.rc_name}</td>
                        <td>${pa.re_content}</td>
                        <td>${pa.re_report_id}</td>
                        <td>${pa.pr_name}</td>
                        <td>${pa.re_me_id}</td>
                        <td>${pa.re_date_str}</td>
                        <td>${pa.re_result}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="container" style="margin-top: 10px;">
            
            <ul class="pagination justify-content-center">
                
            	<c:if test = "${pm.prev}">
                	
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/ReportList?page=${pm.startPage - 1}'></c:url>">이전</a>
                    	
                    </li>
                    
                </c:if>
                
                <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
                
                    <li>
                    	
                    	<a class="page-link" href="<c:url value='/MyPage/ReportList?page=${i}'></c:url>">${i}</a>
                    	
                    </li>
                    
                </c:forEach>
                
                <c:if test="${pm.next}">
                
                    <li class="page-item">
                    
                    	<a class="page-link" href="<c:url value='/MyPage/ReportList?page=${pm.endPage + 1}'></c:url>">다음</a>
                    
                    </li>
                    
                </c:if>
                
            </ul>
            
            </div>
    </div>
	</div>