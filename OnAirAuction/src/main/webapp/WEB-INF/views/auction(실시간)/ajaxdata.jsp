<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="indexListAjax">
		<c:forEach items="${list}" var="item" varStatus="status">
	    <li style="font-size: 12px; margin: 1px">${item.ar_num}. 입찰시간:${item.ar_bid_time} 입찰가격:${item.ar_bid_price} 입찰자:${item.ar_me_id}</li>
	    </c:forEach>
    </div> 
    
    <font class="f18" id="indexListAjax2">
    	$ ${last.getAr_bid_price()}       
    </font>
    
    <div class="chat-top" id="indexListAjax3">현재 입찰자: ${last.getAr_me_id()} 님	입찰가격: $ ${last.getAr_bid_price()}	입찰시간: ${last.getAr_bid_time()}</div>
    
    <div class="modal_content1" id="indexListAjax4">
                    회원님의 입찰신청 가격은 : $ ${last.getAr_next_bid_price()} 입니다. <br> <!-- get안쓰고 .ar_next_bid_price-->
                    입찰하시겠습니까?
    </div>
    
    
</body>
</html>