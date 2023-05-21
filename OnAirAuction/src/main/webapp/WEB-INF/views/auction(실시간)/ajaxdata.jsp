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
		<c:forEach items="${auctionRecordList}" var="item" varStatus="status">
	    <li style="font-size: 12px; margin: 1px">${item.ar_num}. 입찰시간:${item.ar_bid_time} 입찰가격:${item.ar_bid_price} 입찰자:${item.ar_me_id}</li>
	    </c:forEach>
    </div> 
    
    <font class="f18" id="indexListAjax2">
    	$ ${lastAuctionRecord.getAr_bid_price()}       
	    </font>
	    
    <div class="chat-top" id="indexListAjax3">현재 입찰자: ${lastAuctionRecord.getAr_me_id()} 님	입찰가격: $ ${lastAuctionRecord.getAr_bid_price()}	입찰시간: ${lastAuctionRecord.getAr_bid_time()}</div>
    
    <div class="modal_content1" id="indexListAjax4">
                    회원님의 입찰신청 가격은 : $ ${lastAuctionRecord.getAr_next_bid_price()} 입니다. <br> <!-- get안쓰고 .ar_next_bid_price-->
                    입찰하시겠습니까?
    </div>
    
    <ul id="indexListAjax5">
	    <li>현재 입찰가($) : $ ${lastAuctionRecord.getAr_bid_price()}</li>
	    <li>환율 : </li>
	    <li>₩표시 가격 :</li>
    </ul>
    
    <ul class="list-unstyled" id="indexListAjax6">
	     <li class="timer">
	         <span>${nowTime}</span>
	     </li>
	     <li class="clearFix">
	         <p>
	             <i class="lock">로그인하시면 다양한 정보를 보실 수 있습니다.</i>
	         </p>
	     </li>
  	</ul>
  	
  	<dl id="indexListAjax7">
      <dt>입찰가능시간</dt>
      <dd class="korEndTime" style="font-weight: bold; color: green;">
       	입찰시간은 ${endTime}에 종료됩니다.
      </dd>
    </dl>
  	
  	
  	
    
</body>
</html>