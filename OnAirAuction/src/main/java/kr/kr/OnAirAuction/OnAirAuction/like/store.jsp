<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html> 
<html>
<head>
	<title>판매자 좋아요</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<style>
  /* 공통양식 시작 */
*{
  font-family: Arial, Helvetica, sans-serif;
  margin: 0; padding: 0; text-decoration: none;
  font-size: inherit; border-collapse: collapse; line-height: inherit;
  word-break: inherit; list-style: none;
}
/* 공통양식 끝 */
/* 찜한 스토어 시작*/
.content-view{
  width: 1249px; padding: 0 0 60px; margin: 0 auto;
}
.like-store-area .box-title{
  padding: 18px 0 15px; border-bottom: 1px solid #e0e0e0;
}
.like-store-area .box-title .title{
  display: inline-block; margin-right: 12px; font-size: 24px;
  line-height: 32px; 
}
.like-store-area .box-select-edit{
  padding: 16px; margin-left: 12px; 
}
.like-store-area .box-select-edit input{
  width: 18px; height: 18px; 
}
.like-store-area .box-input-check label{
  font-size: 14px; line-height: 25px; color: #91949a;
  line-height: 30px;
}
.like-store-area .box-input-check::after{
  display: inline-block; width: 1px; height: 10px; 
  margin: 1px 12px -1px; background-color: #d8d8d8; vertical-align: middle;
  content: '';
}
.like-store-area .btn-select-delete{
  font-size: 14px; line-height: 20px; color: #91949a;
  border: 0; cursor: pointer; background-color: #fff;
}
.like-store-area .box-store{
  border-top: 1px solid #e0e0e0; list-style: none; display: block;
}
.like-store-area .list-item{
  position: relative; clear: both; min-height: 130px;
  padding: 16px 76px 16px 48px;
  border-bottom: 1px solid #e0e0e0; list-style: none;
}
.like-store-area .list-item a{
  color: #444; text-decoration: none;
}
.like-store-area .list-item .box-image{
  float: left; width: 100px; height: 100px; margin-right: 12px; background: #eee;
}
.like-store-area .list-item .box-image img{
  width: 100%; height: 100%; overflow: clip;
}
.like-store-area .box-store .box-info{
  overflow: hidden; color: #616161;
}
.box-store .box-info .box-info-title{
  display: block; font-size: 15px; line-height: 22px; color: #222;
}
.box-store .box-info .box-info-price{
  display: block; height: 22px; margin: 8px 0;
  font-size: 15px; line-height: 22px; color: #000;
}
.box-store .list-item .box-edit{
  padding: 8px; overflow: hidden; position: absolute; top: 16px; left: 10px;
}
.box-store .list-item .box-edit input{
  width: 18px; height: 18px; 
}
.box-store .list-item .box-edit::before{
  position: absolute; top: 0; left: 0; width: 50px; height: 20px; 
}
/* 찜한 스토어 끝*/
</style>
<body>
<div class="body">
<!-- 찜한 스토어 구현 시작-->
  <div class="content-view">
    <div class="like-store-area">
      <div class="box-title">
        <h4 class="title">찜한 스토어</h4>
      </div>
      <div class="box-select-edit">
        <span class="box-input-check">
          <label class="form-check-label" for="input-check-all">
            <input type="checkbox" class="form-check-input" id="input-check-all" name="all" value="something">전체선택
          </label>
        </span>
        <button type="button" class="btn-select-delete" onclick="btnSelectDel()">선택삭제</button>
      </div>
      <ul class="box-store">
        <li class="list-item">
          <div class="box-edit">
            <input type="checkbox" id="check">
          </div>
          <a href="http://minishop.gmarket.co.kr/cjfresh1" class="link">
            <div class="box-image">
              <img src="https://cdn.pixabay.com/photo/2013/07/12/12/56/home-146585__340.png" alt="">
            </div>
            <div class="box-info">
              <span class="box-info-title">스토어이름</span>
              <span class="box-info-price">
                <strong class="box-info-value">가격</strong>
                원
              </span>
            </div>
          </a>
        </li>
        <li class="list-item">
          <div class="box-edit">
            <input type="checkbox" id="check">
          </div>
          <a href="http://minishop.gmarket.co.kr/cjfresh1" class="link">
            <div class="box-image">
              <img src="https://cdn.pixabay.com/photo/2013/07/12/12/56/home-146585__340.png" alt="">
            </div>
            <div class="box-info">
              <span class="box-info-title">스토어이름</span>
              <span class="box-info-price">
                <strong class="box-info-value">가격</strong>
                원
              </span>
            </div>
          </a>
        </li><li class="list-item">
          <div class="box-edit">
            <input type="checkbox" id="check">
          </div>
          <a href="http://minishop.gmarket.co.kr/cjfresh1" class="link">
            <div class="box-image">
              <img src="https://cdn.pixabay.com/photo/2013/07/12/12/56/home-146585__340.png" alt="">
            </div>
            <div class="box-info">
              <span class="box-info-title">스토어이름</span>
              <span class="box-info-price">
                <strong class="box-info-value">가격</strong>
                원
              </span>
            </div>
          </a>
        </li>
      </ul>
      <ul class="pagination justify-content-center" id="page">
        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
      </ul>
    </div>
  </div>


</div>
<!-- 찜한 스토어 구현 끝 -->
</body>
<script>
//페이지 번호 클릭 시 번호 색상 변경
$(document).ready(function() {
  $('#page .page-item').click(function(event) {
    event.preventDefault();
    var page = $(this).text();
    $(this).removeClass('active');
    $(this).addClass('active').siblings().removeClass('active');
  })
});
// 페이지 좌우 버튼 클릭 시 번호 색상 변경

// 체크박스 전체 선택, 전체 해제, 모든 항목 체크 시 전체 선택 체크박스 선택
$(document).ready(function() {
	$("#input-check-all").click(function() {
		if($("#input-check-all").is(":checked")) $("input[id=check]").prop("checked", true);
		else $("input[id=check]").prop("checked", false);
	});
	$("input[id=check]").click(function() {
		var total = $("input[id=check]").length;
		var checked = $("input[id=check]:checked").length;
		
		if(total != checked) $("#input-check-all").prop("checked", false);
		else $("#input-check-all").prop("checked", true); 
	});
});

// 선택 삭제 클릭 시 alert
function btnSelectDel(){
  confirm('<선택 삭제 구현 예정>\n선택한 찜한 상품 항목을 삭제하시겠습니까?')
}
</script>
</html>
