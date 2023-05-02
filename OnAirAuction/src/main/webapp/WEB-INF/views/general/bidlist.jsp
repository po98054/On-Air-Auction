<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
</head>
<style>
#bidlist-modal h2 {
  margin:0;   
}
#bidlist-modal button {
  display: block; cursor: pointer;
  width: 50px; height: 30px; float: right;
  background-color: #fff;
  border: 0
}
#bidlist-modal .bidlist-content {
  width: 400px; margin: 0 auto;
  padding: 20px 10px; background:#fff;
  border: 1px solid #e5e5e5; border-radius: 15px;
}
#bidlist-modal .bidlist-content .product-table{
  font-size: 13px; text-align: center; margin-bottom: 5px;
  width: 100%; border: solid 1px #e6e6e6; color: #666;
}
#bidlist-modal .bidlist-content .product-table th{
  background-color: #f8f8f8; border-bottom: solid 1px #e6e6e6;
  padding: 7px 0 5px 10px;
}
#bidlist-modal .bidlist-content .product-table td{
  padding: 8px 0 6px 10px; border-bottom: solid 1px #e6e6e6;
}
#bidlist-modal .bidlist-content .h1{
  font-size: 16px; color: #000; font-weight: bold;
}
#bidlist-modal .bidlist-content .bid{
  padding: 0 0 0 10px; font-size: 13px; color: #000;  
}
#bidlist-modal .bidlist-content .bidlist-table{
  font-size: 13px; text-align: center;
  border-top: solid 2px #cbcbcb; border-bottom: solid 2px #cbcbcb; 
  color: #737373; font-size: 11px;
}
#bidlist-modal .bidlist-content .bidlist-table th{
  background-color: #efefef; 
  border-bottom: solid 1px #e6e6e6; border-right: solid 1px #e6e6e6; 
  padding: 10px 0 8px 3px;
}
#bidlist-modal .bidlist-content .bidlist-table td{
  padding: 10px 0 8px 3px;
  border-bottom: solid 1px #e6e6e6; border-right: solid 1px #e6e6e6;
  text-align: center;
}
#bidlist-modal .bid-text{
  margin-top: 12px; text-align: right; font-size: 12px;
}
#bidlist-modal .bidlist-content .bid-text .org{
  color: #ff6600;
}
#bidlist-modal .bidlist-content .bid-text .blue{
  color: #004eff;
}
</style>
<body>
	<h1>TEST</h1>
	<div id="bidlist-modal">
       	<div class="bidlist-content">
           	<button type="button" id="btn-modal-bidlist_close">X</button> 
               <h1>경매기록</h1>
               <br>
               	<table border="1" style="width:400px" class="product-table">
                   	<h2 class="bid">입찰상품</h2>
                   	<tr>
                		<th>상품명</th>
               			<td>LG UltraGear 4K UHD Nano IPS 1ms 144Hz G-Sync Gaming Monitor</td>
                   	</tr>
                   	<tr>
                   		<th width="100px">경매마감일자</th>
                   		<td>${auction.ac_finaldate}</td>
                   	</tr>
                   	<tr>
                   		<th>판매지역</th>
                     	<td>전국</td>
                    </tr>
               	</table>
               	<div class="bid-text">
                   		구분: 
                    <strong class="org">● 낙찰자</strong>
                    <strong class="blue">● 낙찰가능자</strong>
               	</div>
               	<table border="1" style="width:400px" class="bidlist-table">
           			<tr>
                    	<th>입찰자ID</th>
	                    <th>입찰일자</th>
	                    <th>입찰가격</th>
                    </tr>
                   	<c:forEach items="${list }" var="auction_record">
                    	<tr>
		                    <td>${auction_record.ar_me_id}</td>
		                    <td>${auction_record.ar_bidtime}</td>
		                    <td><fmt:formatNumber value="${auction_record.ar_bidprice}" pattern="#,###"/> 원</td>
                   		</tr>
           			</c:forEach>
       			</table>
           		<br>
           		<ul class="pagination pagination-justify-center">
					<li class="page-item <c:if test="${!pm.prev}"> disabled</c:if>">
						<a href="<c:url value='/board/list?page=${pm.startPage-1}'></c:url>" class="page-link">이전</a>
					</li>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<li class="page-item <c:if test="${i == pm.cri.page }"> active</c:if>">
							<a href="<c:url value='/board/list?page=${i}'></c:url>" class="page-link">${i}</a>
						</li>
					</c:forEach>
					<li class="page-item <c:if test="${!pm.next}"> disabled</c:if>">
						<a href="<c:url value='/board/list?page=${pm.endPage+1}'></c:url>" class="page-link">다음</a>
					</li>
				</ul>
       		</div>
   		</div>
</body>
</html>
