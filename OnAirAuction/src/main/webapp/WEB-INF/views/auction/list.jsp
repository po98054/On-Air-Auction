<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
 
<style>
 	.container{
 		height: 800px;
 	}
 	.container-h1{
 		margin-top: 40px; margin-bottom: 30px;
 	}
 	.auction{
 		 text-align: center;	
	}
</style>       
<div class="container">
	<div class="container-h1">
		<h1>경매 등록 리스트</h1>
	</div>
	<div class="container-table">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>경매카테고리이름</th>
					<th>경매번호</th>	
					<th>경매시작일</th>
					<th>경매종료일</th>
					<th>경매시작가</th>
					<th>즉시가</th>
					<th>배송방법</th>
					<th>입찰제한시간</th>
					<th>제한등급</th>
				</tr>
			</thead>
			<tbody class="auction">
				<c:forEach items="${list}" var="auction">
					<tr>
						<th>${auction.ac_name}</th>
						<td>${auction.au_num}</td>
						<td>${auction.au_startdate} </td>
						<td>${auction.au_finaldate}</td>
	              		<td>${auction.au_calculation} <span>원</span> </td>
						<td>${auction.au_immediate} <span>원</span></td>
						<td>${auction.au_deliveryway}</td>
						<td>${auction.au_limitbidtime}</td>
						<td>${auction.au_limitlevel}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<ul class="pagination justify-content-center">
		<c:if test="${pm.prev}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/auction/list?page=${pm.startPage-1}&search=${pm.cri.search}&type=${pm.cir.type}'></c:url>">이전</a>
			</li>
		</c:if>
		<c:forEach begin="${pm.startPage }" end="${pm.endPage }" var="i">
			<li class="page-item <c:if test="${pm.cri.page == i}"> active</c:if>">
				<a class="page-link" href="<c:url value='/auction/list?page=${i}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">${i}</a>
			</li>
		</c:forEach>	
		<c:if test="${pm.next}">
			<li class="page-item">
				<a class="page-link" href="<c:url value='/auction/list?page=${pm.endPage+1}&search=${pm.cri.search}&type=${pm.cri.type}'></c:url>">다음</a>
			</li>
		</c:if>
	</ul>
</div>


