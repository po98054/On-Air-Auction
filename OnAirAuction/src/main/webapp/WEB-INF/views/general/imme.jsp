<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즉시 구매 입찰하기</title>
</head>
<style>
#imme-modal {
  position: fixed; display: none;
  top: 20%; left: 40%;
  z-index:2;
}
#imme-modal h2 {
  margin:0;   
}

#imme-modal button {
  display: block; cursor: pointer;
  width: 50px; height: 30px; float: right;
  background-color: #fff;
  border: 0
}
#imme-modal .imme-content {
  width: 500px; margin: 0 auto;
  padding: 20px; background:#fff;
  border: 1px solid #e5e5e5; border-radius: 15px;
}
#imme-modal .modal_layer {
  position:fixed;
  top:0; left:0;
  width:100vw; height:100vh;
  background:rgba(0, 0, 0, 0.6);
  z-index:-1;
}
#imme-modal .imme-content ul{
  padding-top: 15px; 
  padding-bottom: 10px; list-style: none;
}
#imme-modal .imme-content li{
  clear: both; font-size: 15px; color: #333;
  vertical-align: middle; padding-bottom: 8px;
  list-style: none; margin-bottom: 10px;
}
#imme-modal .imme-content dt{
  display: inline-block; line-height: 26px; font-size: 15px;
}
#imme-modal .imme-content dd{
  text-align: right; float: right; width: 330px;
  line-height: 26px; font-weight: 600;
}
#imme-modal .imme-content input{
  text-align: right;
}
#imme-modal .imme-content .label{
  text-align: center; color: #ff0000; font-size: 14px; padding: 5px 0 13px;
}
#imme-modal .imme-content .imme-btn{
  cursor: pointer;
}
#imme-modal .imme-content .imme-btn a{
  margin-top: 15px; background-color: #38a000;
  color: #fff; border-radius: 6px; display: block;
  font-size: 15px; height: 62px; width: 100%; line-height: 62px;
  text-align: center;
}
#imme-modal .imme-content .btn-area{
  clear: both;
}
#imme-modal .imme-content .btn-area ul{
  list-style: none;
}
#imme-modal .imme-content .btn-area li{
  clear: both; font-size: 16px; color: #333; 
  vertical-align: middle; padding-bottom: 8px;
  width: 48.5%; display: inline-block;
}
#imme-modal .imme-content .btn-area a{
  margin-top: 15px; background: #333a39; 
  color: #fff; border-radius: 6px;
  display: block; font-size: 15px; 
  height: 62px; width: 100%; line-height: 62px;
  text-align: center;
}
</style>
<body>
	<form action="<c:url value='/general/imme'></c:url>" method="post">
	    <div id="bid-modal">
	      <div class="modal_layer"></div>
	      <div class="bid-content">
	        <h2>즉시 구매 입찰하기 신청</h2>
	        <br>
	        <ul>
	          <li>
	            <dl>
	              <dt>현재 입찰가</dt>
	              <dd> 원</dd>
	            </dl>
	          </li>
	          <li>
	            <dl>
	              <dt>즉시구매 희망가</dt>
	              <dd>
	                <input id="ar_bidprice" name="ar_bidprice" type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
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
