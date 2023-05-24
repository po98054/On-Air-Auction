<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
 
<style>
 	.container{
 		height: 1500px;
 	}
 	.container-h1{
 		margin-top: 40px; margin-bottom: 30px;
 	}
 	.container-table{
 		width: 1400px; height: 500px;
	}
	.product{
		 text-align: center;
	}
</style>       
<div class="container">
	<div class="container-h1">
		<h1>물품 등록 리스트</h1>
	</div>
	<div class="container-table">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품번호</th>
					<th>상품명</th>
					<th>상품소개</th>
					<th>상품상태</th>
					<th>상세정보</th>
					<th>상품위치</th>
					<th>반품수용여부</th>
					<th>반품수용기간</th>
					<th>환불가능조건</th>
					<th>경매시작가격</th>
					<th>원산지</th>
					<th>물품크기</th>		
				</tr>
			</thead>
			<tbody class="product">
				<c:forEach items="${list}" var="vo">
					<tr>
	              		<td>
	                		<a href="<c:url value='/product/detail/${vo.pr_code}'></c:url>" class="auction">${vo.pr_code}</a>
	                	</td>
						<td>${vo.pr_name } </td>
						<td>${vo.pr_intro }</td>
						<td>${vo.pr_condition }</td>
						<td>${vo.pr_detail }</td>
						<td>${vo.pr_location }</td>
						<td>${vo.pr_refund_ok }</td>
						<td>${vo.pr_refund_date }</td>
						<td>${vo.pr_refund_reason }</td>
						<td>${vo.pr_start_price } <span>원</span></td>
						<td>${vo.pr_origin }</td>
						<td>${vo.pr_size }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/product/list?page=${pm.startPage-1}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
			<li class="page-item <c:if test="${pm.criteria.page == i}"> active</c:if>">
				<a class="page-link" href="<c:url value='/product/list?page=${i}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">${i}</a>
			</li>
		</c:forEach>	
		<c:if test="${pm.next}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/product/list?page=${pm.endPage+1}&search=${pm.criteria.search}&type=${pm.criteria.type}'></c:url>">다음</a>
			</li>
		</c:if>
	</ul>
</div>