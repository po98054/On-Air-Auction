<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>

</head>
<body>
	<h1>TEST</h1>
	<form action="<c:url value='/testPage/insert'></c:url>" method="post" enctype="multipart/form-data">
	    <div id="bid-modal">
	      <div class="modal_layer"></div>
	      <div class="bid-content">
	        <h2>입찰신청</h2>
	        <br>
	        <ul>
	          <li>
	            <dl>
	              <dt>현재 입찰가</dt>
	              <dd>1,200,000 원</dd>
	            </dl>
	          </li>
	          <li>
	            <dl>
	              <dt>즉시구매 희망가</dt>
	              <dd>
	                <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
	                <b>원</b>
	              </dd>
	            </dl>
	          </li>
	        </ul>
	        <div class="bid-btn">
	          <button class="btn btn-outline-success col-12 mb-2">입찰하기</button>
	          <div class="label">경매 입찰에 성공할 경우 낙찰된 상품은 반드시 구매해 주셔야 합니다.</div>
	        </div>
	        <div class="btn-area">
	          <ul>
	            <li>
	              <a href="http://es.auction.co.kr/cs/faq/view/82" onclick="popup_close();" target="_blank">경매보증금안내</a>
	            </li>
	            <li>
	              <a href="http://es.auction.co.kr/my/assets?tabCode=deposit" onclick="popup_close();" target="_blank">보증금충전</a>
	            </li>
	          </ul>
	        </div>
	      </div>
	    </div>
	</form>
</body>
</html>
