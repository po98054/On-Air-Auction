<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반경매</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<style>
*{
  font-family: Arial, Helvetica, sans-serif;
  margin: 0; padding: 0; text-decoration: none;
  font-size: inherit; border-collapse: collapse; line-height: inherit;
  word-break: inherit; list-style: none;
}
.content-view{
  width: 1249px; padding: 0 0 60px; margin: 0 auto;
}
.product-category{
  margin-left: 10px;
  width: 100%; display: table;
  font-size: 0; margin: 4px 0 0 0;
}
.product-category ul{
  display: table-cell; vertical-align: middle;
  height: 36px; line-height: 36px;
}
.product-category li{
  display: inline-block; vertical-align: top;
  font-family: Helvetica, 'Apple SD Gothic Neo', sans-serif;
}
.product-category a{
  display: inline-block; font-size: 0.87rem; color: #777; line-height: 36px;
  text-decoration: none;
}
.product-category span{
  display: inline-block; padding-left: 17px;;
  background-image: url(http://static.itrcomm.com/img/sub/home_ico.gif);
  background-position: 0 center; background-repeat: no-repeat;
}
.product-category i{
  padding: 0 10px;
  display: inline-block; width: 4px; height: 36px;
  background-image: url(http://static.itrcomm.com/img/sub/dot_arrow.gif);
  background-position: center; background-repeat: no-repeat;
  vertical-align: middle;
}
.content-view .product-name{
  font-size: 1.7rem; font-weight: 700; color: #080808;
  padding: 0 0 7px; line-height: 29px; font-family: Arial, Helvetica, sans-serif;
  display: block; 
  margin-block-start: 0.67em;
  margin-block-end: 0.67em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}
.content-view .product-subname{
  font-size: 1.2rem; color: #666;
  font-family: Arial, Helvetica, sans-serif;
  margin-block-start: 0.83em;
  margin-block-end: 0.83em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}
/* product-simple-area 시작 */
.product-simple-area{
  margin-top: 10px; font-family: Arial, Helvetica, sans-serif;
}
/* 상품 정보 상단 왼쪽 썸네일 시작 */
.simple-layout-left{
  width: 557px; display: inline-block;
}
.simple-layout-left .thumnail-area{
  width: 557px; display: inline-block;
}
.thumnail-area .box-thumnail{
  position: relative;
}
.thumnail-area .inner-thumnail{
  position: relative; width: 100%; height: 0; padding-top: 100%;
  overflow: hidden; border: 1px solid #ccc;
}
.item-thumnail .zoo-item{
  position: absolute; top: 0; left: 0; width: 100%; height: 100%;
  overflow: hidden; transition: all 150ms linear;
  display: flex; align-items: center; justify-content: center;
}
.item-thumnail .zoo-img{
  cursor: pointer; 
  position: absolute; top: 0; left: 0; width: 100%; height: 100%; 
  background-repeat: no-repeat; background-position: center;
  background-size: contain; transition: transform 0.5s ease-out;
}
.box-thumnail .zoombox{
  position: absolute; color: #5a5a5a;
  font-size: 1em; background: #fff; width: 228px; height: 49px;
  left: 50%; transform: translateX(-50%); 
  bottom: -24px; text-align: center; line-height: 49px;
  cursor: pointer; border: 0; padding: 0;
}
.zoombox span{
  position: relative; top: 9px; width: 17px; height: 28px;
  background-position: -54px -23px; margin-right: 15px;
}
.mouse-icon{
  background-repeat: no-repeat; 
  background-image: url(http://static.itrcomm.com/img/sub/view_icon_all.png);
  display: inline-block;
}
.thumnail-area .mini-thumnail{
  position: relative; height: 85px; margin-top: 50px;
  overflow: hidden; list-style: none;
  padding: 0; z-index: 1;
}
.thumnail-swiper-wrapper{
  transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);
  position: absolute; top: 0; left: 0; text-align: center;
  margin: 0 auto; width: 100%; height: 100%; z-index: 1;
  display: flex; box-sizing: content-box;
}
.swiper-slide-img{
  width: 99.4px; margin-right: 15px;
  height: 100%; position: relative;
}
.swiper-slide-img img{
  border: 1px solid #e1e1e1;
  vertical-align: top; margin: 0 7px; position: relative;
  width: 85px; height: 85px; border-radius: 0;
  background: #fff; opacity: 1; box-sizing: border-box;
  background-position: left top; background-size: 85px 85px; cursor: pointer;
}
.swiper-slide-img img.selected{
  border: 3px solid #ca6565;
}
.control-wrap button{
  position: absolute; top: 50%; transform: translateY(-50%);
  z-index: 99; width: 25px; height: 80px; background-color: #fff;
  opacity: 0.9;
  cursor: pointer; border: 0; padding: 0;
  background-repeat: no-repeat; 
  background-image: url(http://static.itrcomm.com/img/sub/view_icon_all.png);
}
.control-wrap .prev-btn{
  left: 0; background-position: -97px 0;
  display: block; width: 15px; height: 29px; ;
}
.control-wrap .next-btn{
  right: 0; background-position: -119px 0;
  display: block; width: 15px; height: 29px;
}
.control-wrap button:focus{
  outline: none;
}
/* 상품 정보 상단 왼쪽 썸네일 끝 */
/* simple-layout-right 시작 */
.simple-layout-right{
 width: 635px; float: right; border-top: 1px solid #ccc;
}
.product-info .info-step01{
  padding: 10px 0 10px 0;
  position: relative; border-bottom: 1px solid #ccc;
}
/* info-stop01 시작 */
.info-step01 .product-id{
  position: relative; line-height: 40px; margin-bottom: 20px;
  text-align: left; padding-inline-start: 40px;
}
.info-step01 .product-id strong{
  position: relative; font-size: 15px; color: #9b9b9b;
  padding-right: 8px; margin-right: 4px;
}
.info-step01 .product-id strong::before{
  content: ''; position: absolute; top: 6px;
  right: 0; width: 1px; height: 12px; background: #bbb;
  display: block;
}
.info-step01 .product-id button{
  width: 36px; height: 36px; border: 1px solid #d7d7d7;
  position: absolute; top: 0; border-radius: 20px;
  cursor: pointer; background-color: #fff;
}
.info-step01 .product-id i{
  width: 17px; height: 18px; display: inline-block;
  margin: 0 auto;
  background-image: url(http://static.itrcomm.com/img/sub/view_icon_all_sel2.png);
  background-repeat: no-repeat;
}
.info-step01 .product-id .product-copy{
  margin-right: 5px; text-decoration: underline; color: #000;
  text-decoration-color: cornflowerblue; text-decoration-style: dotted;
  text-underline-position:under;
}
.info-step01 .product-id .copy-icon{
  width: 16px; height: 20px; margin-left: 5px;
}
.info-step01 .product-id .btn-share{
  right: 45px;
}
.info-step01 .product-id .share-icon{
  background-position: -52px 0; border-bottom: 0;
}
.info-step01 .product-id .btn-product-like{
  right: 0px;
}
.info-step01 .product-id .like-icon{
  background-position: -75px 0; border-bottom: 0;
}
.info-step01 .product-id .like-icon.sel{
  background-position: -115px -38px; border-bottom: 0;
}
.info-step01 .box-share{
  display: none;
  position: absolute; padding: 20px 30px;
  border: 1px solid #a6a6a6; background-color: #fff;
  right: 45px; height: 89px; top: 50px; z-index: 10;
}
.info-step01 .box-share ul{
  display: block; list-style: none;
}
.info-step01 .box-share li{
  display: inline-block; margin-right: 12px; vertical-align: top;
  list-style: none;
}
.info-step01 .box-share a{
  width: 48px; height: 48px; display: block;
  background-image: url(http://static.itrcomm.com/img/sub/sns_ico.png);
  background-repeat: no-repeat; background-position: 0 0;
  margin-left: 10px; margin-top: -4px;
}
.info-step01 .box-share .btn-twitter{
  background-position: -60px 0;
}
.info-step01 .box-share .btn-kakao{
  background-position: -180px 0; margin-right: 24px;
}
.info-step01 .box-share .box-share_close{
  display: block; width: 23px; height: 23px;
  background-image: url(http://static.itrcomm.com/img/sub/sns_ico.png);
  background-repeat: no-repeat; background-position: -253px -12px;
  top: 50%; transform: translateY(-50%);
  border: 1px solid #d7d7d7; position: absolute;
  border-radius: 20px;
}
.info-step01 .product-id dday{
  float: right;
}
.info-step01 .btn-deadline,.btn-bidlist{
  background-color: #000; color: #fff; border: 1px solid #6d6e71;
  display: inline-block; padding: 6px 12px; margin-bottom: 0; 
  font-size: 14px; line-height: 1.5; text-align: center; white-space: nowrap;
  vertical-align: middle; cursor: pointer; touch-action: manipulation;
  margin-top: 5px; margin-left: 10px; border-radius: 5px;
}
.info-step01 .deadline-icon,.bidlist-icon{
  color: #c5b799; display: inline-block; font: normal 14px;
  font-size: inherit; text-rendering: auto;
}
.info-step01 .btn-deadline:hover,.btn-bidlist:hover{
  background: #6d6e71;
}
.info-step01 span{
  color: #262626; padding-bottom: 1px; 
  height: 17px; height: 18px; display: block; margin: 0 auto;
}
.info-step01 ul{
  list-style: none; display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
}
.info-step01 li{
  padding-bottom: 16px; list-style: none; display: list-item; 
}
.info-step01 dl{
  display: block;
  margin-block-start: 1em; margin-block-end: 1em;
  margin-inline-start: 0px; margin-inline-end: 0px;
  text-align: left;
}
.info-step01 dt{
  color: #666; display: inline-block; font-size: 14px;
}
.info-step01 dd{
  width: 420px; text-align: right;
  position: relative; float: right;
  font-size: 14px; color: #666;
  display: block; margin-inline-start: 40px;
}
/* info-stop01 끝 */
/* info-step02 시작 */
.info-step02 ul{
  list-style: none; display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
  padding-inline-start: 40px;
}
.info-step02 li{
  padding-bottom: 16px; list-style: none; display: list-item; 
}
.info-step02 dl{
  display: block;
  margin-block-start: 1em; margin-block-end: 1em;
  margin-inline-start: 0px; margin-inline-end: 0px;
  text-align: left;
}
.info-step02 dt{
  color: #666; display: inline-block; font-size: 14px;
}
.info-step02 dd{
  width: 420px; text-align: right;
  position: relative; float: right;
  font-size: 14px; color: #666;
  display: block; margin-inline-start: 40px;
}
.info-step02 .start-price{
  font-weight: 600; font-size: 18px; color: #000;
}
.info-step02 .current-price{
  font-weight: 600; font-size: 18px; color: #eb000a;
}
/* info-step02 끝 */
/* product-info-btn-area 시작 */
.product-info-btn-area{
  padding-top: 15px; text-align: center; clear: both;
}
.product-info-btn-area button{
  display: inline-block; text-align: center; cursor: pointer; border: 0; padding: 0;
  width: 300px; height: 48px; color: #fff; font-size: 18px; border-radius: 18px;
  line-height: 48px; 
}
.product-info-btn-area span{
  vertical-align: middle; background-repeat: no-repeat;
  background-image: url(http://static.itrcomm.com/img/sub/view_icon_all.png);
  display: inline-block;
}
.product-info-btn-area .btn-bid{
  background: #0053a0; display: inline-block; text-align: center; margin-left: 10px;
}
.product-info-btn-area .bid-icon{
  width: 26px; height: 20px; background-position: -207px 0px;
  margin-top: -3px; margin-left: 13px;
}
.product-info-btn-area .btn-bid:hover{
  background: #247fd2;
}
.product-info-btn-area .btn-imme{
  background: #38a000; display: inline-block;
  text-align: center; margin-left: 10px; margin-bottom: 5px;
}
.product-info-btn-area .imme-icon{
  width: 26px; height: 20px; background-position: -207px 0px;
  margin-top: -3px; margin-left: 13px;
}
.product-info-btn-area .btn-imme:hover{
  background: #93dc6b;
}

/* product-info-btn-area 끝 */
/* store-info-area 시작 */
.store-info-area{
  position: relative; margin-top: 10px; border: 1px solid #ddd;
  border-radius: 18px; padding: 15px 10px 15px 10px;
}
.store-info-area .store-img{
  display: inline-block; width: 60px; height: 60px;
  border: 1px solid #ccc; background-image: url(http://static.itrcomm.com/img/sub/medal.png);
  background-position: center; background-repeat: no-repeat;
  border-radius: 40px; margin-right: 8px;
}
.store-info-area ul{
  display: inline-block; vertical-align: top;
  margin-block-start: 5px; margin-block-end: 5px;
  margin-inline-start: 0px; margin-inline-end: 0px;
}
.store-info-area .store-id{
  font-size: 15px; color: #000;
}
.store-info-area li{
  line-height: 26px; font-size: 13px; color: #666;
}
.store-info-area .store{
  font-size: 13px;
}
.store-info-area strong{
  font-size: 18px; font-weight: 600; color: #000;
}
.store-info-area .buy-satisfaction strong{
  margin-left: 20px;
}
.store-info-area a{
  position: absolute; padding-left: 17px; display: block;
  text-align: left; font-size: 14px; color: #444;
  width: 170px; height: 36px; border: 1px solid #ccc;
  line-height: 32px; border-radius: 6px; text-decoration: none;
}
.store-info-area a span{
  position: absolute; width: 23px; right: 12px; top: 50%;
  transform: translateY(-50%);
  background-repeat: no-repeat; 
  background-image: url(http://static.itrcomm.com/img/sub/view_icon_all_sel2.png);
  display: inline-block;
}
.store-info-area .btn-store-favorite{
  top: 10px; right: 10px;
}
.store-info-area .btn-store-favorite.sel{
  top: 10px; right: 10px;
}
.store-info-area .store-favorite-icon{
  background-position: -75px 0; height: 21px;
}
.store-info-area .store-favorite-icon.sel{
  background-position: -115px -38px; height: 21px;
}
.store-info-area .btn-store-more{
  top: 52px; right: 10px;
}
.store-info-area .store-icon{
  background-position: -257px 0; height: 25px;
}
/* store-info-area 끝 */
/* product-img-area 시작 */
.product-img-area{
  display: flex; flex-direction: column;
  justify-content: center; align-items: center;
}
.product-img-area img:first-child {
  margin-top: 10px;
}
.product-img-area img{
  margin-bottom: 5px;
}

/* product-img-area 끝*/
/* simple-layout-right 끝 */
.product-tab-wrap{
  font-family: Arial, Helvetica, sans-serif;
  width: 100%; margin: 0 auto; padding: 50px 0 0 0;
}
.product-tab-wrap .tab-area{
  font-size: 0; margin-top: 20px;
  font-family: Arial, Helvetica, sans-serif;
  width: 100%;
}
.tab-area ul{
  display: block;
  margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}
.tab-area li{
  color: #171717; border: 1px solid #707070;
  border-bottom: 0; border-top: 2px solid #000;
  width: 33%; display: inline-block;
  text-align: center; height: 54px; line-height: 54px;
  border-right: 1px solid #707070;
  border-bottom: 1px solid #707070;
}
.tab-area a{
  color: #343434; font-weight: 500;
  font-size: 15px; display: block;
  text-decoration: none; cursor: pointer;
}
.tab-area .product-description-tab{
  border-bottom: 0; 
}
.tab-area .product-review-tab{
  border-bottom: 0; 
}
.tab-area .product-inquiry-tab{
  border-bottom: 0; 
}

<%--
.product-img01{
  width: inherit; max-width: 100%; height: auto; vertical-align: top;
  border-style: none; padding-top: 40px 
}
.product-img02{
  width: inherit; max-width: 100%; height: auto; vertical-align: top;
  border-style: none; padding-bottom: 70px;
}
--%>

.product-review-area{
  display: table; table-layout: fixed; width: 100%;
}
.product-review-area .feedback-table{
  box-sizing: border-box; text-indent: initial;
  border-color: grey; width: 990px
}
.product-review-area .colgroup{
  display: table-caption; 
}

.product-review-area .review-layout-left{
  display: table-cell; width: 250px; padding: 60px 0 20px 0;
  text-align: center; cursor: default; 
  float: left; 
   
}
.product-review-area h4{
  font-size: 12px; color: #808991; font-weight: 700;
  display: block; 
  margin-block-start: 11px;
  margin-block-end: 11px;
  margin-inline-start: 0px;
  margin-inline-end: 0px;;
}
.product-review-area .buyer-score{
  display: inline-block; margin-top: 15px;
}
.product-review-area .buyer-star-score{
  margin-top: 11px; 
}
.product-review-area .score{
  display: block; margin-top: 10px; font-size: 35px; 
  color: #212529; font-weight: 700;
}
.product-review-area .buyer-star-score{
  margin-top: 11px;
}
.product-review-area .score-star-rate{
  color: #999; font-size: 16px; line-height: 16px;
}
.product-review-area .star-rate-box{
  position: relative; margin-top: -1px; margin-right: 1px;
  width: 75px; height: 15px; vertical-align: -11%;
  display: inline-block; text-indent: -444px; 
  font-size: 0; overflow: hidden; 
  background: url(data:image/svg+xml,%3Csvg%20viewBox%3D%220%200%2050%2010%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20fill%3D%22%23d1d5d9%22%3E%3Cpath%20d%3D%22M8.089,9.755L5,8.308L1.91,9.755l0.423-3.387L0,3.876l3.352-0.645L5,0.245l1.647,2.987L10,3.876L7.666,6.368L8.089,9.755z%20M28.09,9.755L25,8.308l-3.09,1.447l0.423-3.387L20,3.876l3.352-0.645L25,0.245l1.647,2.987L30,3.876l-2.334,2.492L28.09,9.755z%20M18.09,9.755L15,8.308l-3.09,1.447l0.423-3.387L10,3.876l3.352-0.645L15,0.245l1.647,2.987L20,3.876l-2.334,2.492L18.09,9.755z%20M38.09,9.755L35,8.308l-3.09,1.447l0.422-3.387L30,3.876l3.352-0.645L35,0.245l1.647,2.987L40,3.876l-2.334,2.492L38.09,9.755z%20M48.09,9.755L45,8.308l-3.09,1.447l0.422-3.387L40,3.876l3.352-0.645L45,0.245l1.647,2.987L50,3.876l-2.334,2.492L48.09,9.755z%22/%3E%3C/svg%3E);
  background-size: 100% 100%;
}
.product-review-area .star-rate-fill{
  width: 80%;
  display: block; position: relative; overflow: hidden;
  height: 15px;
}
.product-review-area .star-rate-fill::after{
  text-indent: -444px; font-size: 0; overflow: hidden;
  background: url(data:image/svg+xml,%3Csvg%20viewBox%3D%220%200%2050%2010%22%20xmlns%3D%22http%3A//www.w3.org/2000/svg%22%20fill%3D%22%23fa722e%22%3E%3Cpath%20d%3D%22M8.089,9.755L5,8.308L1.91,9.755l0.423-3.387L0,3.876l3.352-0.645L5,0.245l1.647,2.987L10,3.876L7.666,6.368L8.089,9.755z%20M28.09,9.755L25,8.308l-3.09,1.447l0.423-3.387L20,3.876l3.352-0.645L25,0.245l1.647,2.987L30,3.876l-2.334,2.492L28.09,9.755z%20M18.09,9.755L15,8.308l-3.09,1.447l0.423-3.387L10,3.876l3.352-0.645L15,0.245l1.647,2.987L20,3.876l-2.334,2.492L18.09,9.755z%20M38.09,9.755L35,8.308l-3.09,1.447l0.422-3.387L30,3.876l3.352-0.645L35,0.245l1.647,2.987L40,3.876l-2.334,2.492L38.09,9.755z%20M48.09,9.755L45,8.308l-3.09,1.447l0.422-3.387L40,3.876l3.352-0.645L45,0.245l1.647,2.987L50,3.876l-2.334,2.492L48.09,9.755z%22/%3E%3C/svg%3E);
  background-size: 100% 100%; display: block; position: absolute;
  left: 0; top: 0; width: 75px; height: 15px; content: '';
}
.product-review-area .score-people-num{
  width: 94px; margin: 0 auto; padding-top: 8px;
  border-top: 1px solid #e5e5e5; font-size: 14px;
  color: #94a2b8; letter-spacing: 0.5px;
}
.product-review-area .score-people-num strong{
  font-weight: bold;
}

.review-layout-left p{
  margin-block-start: 16px;
  margin-block-end: 16px;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}


.review-layout-right{
  position: relative;
  display: inline-block; 
  font-size: 12px;
  margin-bottom: 10px;
}
.review-layout-right .review-area{
  display: inline-block; line-height: 18px;
  box-sizing: border-box; text-indent: initial; border-color: grey;
}
.review-layout-right table{
  width: 900px
}
/* 
.review-layout-right colgroup{
  display: table-column-group;
} 
*/
.review-layout-right thead{
  display: table-header-group; vertical-align: middle; 
  border-color: inherit;
}
.review-layout-right tr{
  display: table-row; vertical-align: inherit; border-color: inherit;
}
.review-layout-right th{
  padding: 0; text-align: left;
  border-top: none;
  border-bottom: 1px solid rgb(204, 204, 204);
  background-color: rgb(247, 245, 245);
  font: 11px; display: table-cell; vertical-align: inherit;
}
.review-layout-right tbody{
  display: table-row-group; vertical-align: middle; border-color: inherit;
}
.review-layout-right td{
  border-bottom: 1px solid #dbdbdb;
  padding: 20px 0; display: table-cell;
  text-align: center; vertical-align: middle;
}





.review-layout-right .badge-icon{
  text-align: center;
}
.review-layout-right .box-feedback-star-rate{
  line-height: 26px;
}
.review-layout-right .star-image{
  margin: 3px 0 0 0; vertical-align: top; width: 18px;
}
.review-layout-right .box-rating{
  display: inline-block; font-size: 20px; color: #999; line-height: 26px;
}
.review-layout-right .star-current{
  color: #333;  
}
.review-layout-right .box-coment{
  display: inline-block; position: relative; width: 100%; 
  border-right: 1px solid #e2e2e2; 
  text-align: left;
}
.review-layout-right .coment-title{
  padding-right: 21px; text-decoration: none;
}
.review-layout-right .box-coment strong{
  margin-bottom: 3px; display: inline-block; width: 100%; font-weight: bold;
}
.review-layout-right .box-coment a{
  color: #4d90fe
}
.review-layout-right .box-coment p{
  padding-top: 0; padding-right: 21px;
  min-height: 30px; max-height: 195px; overflow: hidden;
}
.review-layout-right .coment-user tr{
  display: table-row; vertical-align: inherit; border-color: inherit;
}
.review-layout-right .coment-user td{
  border-bottom: 1px solid #dbdbdb; 
}

.review-layout-right .coment-user ul{
  padding-left: 21px; color: #999; line-height: 18px; list-style: none;
  display: block;
  margin-block-start: 16px;
  margin-block-end: 16px;
  margin-inline-start: 0px;
  margin-inline-end: 0px;
}
.review-layout-right .coment-user li{
  display: list-item; 
}
.review-layout-right .coment-user strong{
  color: #666; 
}



/* 상품문의 구현 시작 */
.product-qna-area{
  margin-bottom: 10px;
}
.product-qna-area .qna-layout-right{
  float: right; padding: 10px 5px 15px 0;
}
.product-qna-area .qna-layout-right a{
  padding: 7px 20px 7px 20px; border: 1px solid #9ba0a8; border-radius: 2px;
  line-height: 30px; height: 30px; 
  font-size: 13px; font-weight: bold; color: #fff;
  background: #5d5b5b; text-align: center; margin-left: 12px; margin-right: 9px;
  cursor: pointer;
}
.product-qna-area .qna-layout-right a:hover{
  background: #a4a9b0;
  
}
.product-qna-area table{
  table-layout: fixed; width: 100%; border-collapse: collapse;
  border-top: 1px solid #a4a9b0; border-bottom: 1px solid #ececec;
  margin-bottom: 10px;
}
.product-qna-area thead{
  display: table-header-group; vertical-align: middle; border-color: inherit;
}
.product-qna-area tr{
  display: table-row; vertical-align: inherit; border-color: inherit;
}
.product-qna-area th{
  padding: 13px 0; text-align: center; font-size: 14px; line-height: 20px;
  color: #222; background-color: #f8f9fa;
}
.product-qna-area tbody{
  display: table-row-group; vertical-align: middle; border-color: inherit;
}
.product-qna-area td{
  padding: 16px 0 16px 12px; border-top: 1px solid #ececec;
  font-size: 14px; line-height: 14px; color: #5e636d;
  word-wrap: break-word; text-align: center;
}
.product-qna-area tr th{
  padding-left: 10px; 
}
.product-qna-area a{
  text-decoration: none;
  color: #000;
}
.product-qna-area tr .htit{
  padding-right: 15px;
}
.product-qna-area tbody .ing{
  color: #94989f; padding-right: 18px;
}
.product-qna-area tbody .done{
  color: #2e8de5; padding-right: 18px;
}
.product-qna-area .qna-title a{
  position: relative; color: #222; float: left; margin-left: 30px;
}
.product-qna-area .qna-title span{
  background: url(http://pics.gmarket.co.kr/pc/ko/item/vip/sp_vipgroup.png?v=20220427);
  background-size: 1000px 1000px; background-position: -252px 0;
  width: 10px; height: 13px; display: inline-block;
  font-size: 0; 
  margin-left: 5px; margin-bottom: -1px; padding-top: 6px;
}
/* 상품문의 구현 끝 */
/* 페이지 상단으로 이동하기 구현 시작 */
.content-top{
  position: fixed; right: 24px; bottom: 20px; z-index: 100;
  border: 1px solid #ccc; outline: none;
  width: 50px; height: 50px; border-radius: 100%;
  text-align: center; line-height: 50px;
  text-decoration: none; font-size: 25px;
  background-color: #000; cursor: pointer;
  color: #fff; opacity: 70%;
  text-decoration: none;
}
/* 페이지 상단으로 이동하기 구현 끝 */
/* 마감연장 모달창 시작 */
#deadline-modal {
  position: fixed; display: none;
  top: 20%; left: 40%;
  z-index:2;
}
#deadline-modal h2 {
  margin:0;   
}
#deadline-modal .btn-close {
  display: block; cursor: pointer;
  width: 50px; height: 30px; float: right;
  background-color: #fff;
  border: 0
}
#deadline-modal .deadline-content {
  width: 500px; margin: 0 auto;
  padding: 20px; background:#fff;
  border: 1px solid #e5e5e5; border-radius: 15px;
}
#deadline-modal .modal_layer {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background: rgba(0, 0, 0, 0.5);
  z-index: -1;
}   
/* 마감연장 모달창 끝 */
/* 경매기록 모달창 시작 */
#bidlist-modal {
  position: fixed; display: none;
  top: 20%; left: 40%;
  z-index: 2; 
}
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
  margin: 0 auto;
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
  padding: 0 0 0 10px; font-size: 16px; color: #000;
  font-weight: 600; margin-bottom: 5px; 
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
#bidlist-modal .modal_layer {
  position:fixed;
  top:0; left:0;
  width:100%; height:100%;
  background:rgba(0, 0, 0, 0.6);
  z-index:-1;
} 
/* 경매기록 모달창 끝 */
/* 즉시 경매 입찰하기 모달창 시작 */
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
  padding-top: 15px; list-style: none;
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
  text-align: center; text-decoration: none;
}
/* 즉시 구매 입찰하기 모달창 끝 */
/* 입찰하기 모달창 시작 */
#bid-modal {
  position: fixed; display: none;
  top: 20%; left: 40%;
  z-index:2;
}
#bid-modal h2 {
  margin:0;   
}
#bid-modal button {
  display: block; cursor: pointer;
  width: 50px; height: 30px; float: right;
  background-color: #fff;
  border: 0
}
#bid-modal .bid-content {
  width: 500px; margin: 0 auto;
  padding: 20px; background:#fff;
  border: 1px solid #e5e5e5; border-radius: 15px;
}
#bid-modal .modal_layer {
  position:fixed;
  top:0; left:0;
  width:100vw; height:100vh;
  background:rgba(0, 0, 0, 0.6);
  z-index:-1;
}
#bid-modal .bid-content ul{
  padding-top: 15px; list-style: none;
}
#bid-modal .bid-content li{
  clear: both; font-size: 15px; color: #333;
  vertical-align: middle; padding-bottom: 8px;
  list-style: none; margin-bottom: 10px;
}
#bid-modal .bid-content dt{
  display: inline-block; line-height: 26px; font-size: 15px;
  margin-left: 15px;
}
#bid-modal .bid-content dd{
  text-align: right; float: right; width: 330px;
  line-height: 26px; font-weight: 600; margin-right: 30px;
}
#bid-modal .bid-content input{
  text-align: right;
}
#bid-modal .bid-content .label{
  text-align: center; color: #ff0000; font-size: 14px; padding: 5px 0 13px;
}
#bid-modal .bid-content .bid-btn{
  cursor: pointer;
}
#bid-modal .bid-content .bid-btn a{
  background-color: #0053a0;
  color: #fff; border-radius: 6px; display: block;
  font-size: 15px; height: 62px; width: 100%; line-height: 62px;
  text-align: center;
}
#bid-modal .bid-content .bid-btn .question{
  font-size: 15px; text-align: center; font-weight: 700; cursor: default;
  margin-bottom: 15px;
}
#bid-modal .bid-content .btn-area{
  clear: both;
}
#bid-modal .bid-content .btn-area ul{
  list-style: none;
}
#bid-modal .bid-content .btn-area li{
  clear: both; font-size: 16px; color: #333; 
  vertical-align: middle; padding-bottom: 8px;
  width: 48.5%; display: inline-block;
}
#bid-modal .bid-content .btn-area a{
  background: #333a39; 
  color: #fff; border-radius: 6px;
  display: block; font-size: 15px; 
  height: 62px; width: 100%; line-height: 62px;
  text-align: center; text-decoration: none;
}


/* 입찰하기 모달창 끝 */
/* 문의하기 모달창 시작 */
#qna-modal {
  position: fixed; display: none;
  top: 20%; left: 40%;
  z-index:2;
}
#qna-modal h2 {
  margin:0;   
}
#qna-modal button {
  display: block; cursor: pointer;
  width: 50px; height: 30px; float: right;
  background-color: #fff;
  border: 0
}
#qna-modal .qna-content {
  width: 700px; margin: 0 auto;
  padding: 20px; background:#fff;
  border: 1px solid #e5e5e5; border-radius: 15px;
}
#qna-modal .modal_layer {
  position:fixed;
  top:0; left:0; width:100%; height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}
#qna-modal .qna-table{
  table-layout: fixed;
  width: 100%; border-collapse: collapse;
  border-top: 1px solid #ececec;
   line-height: 20px; color: #5e636d;
}
#qna-modal .qna-table th{
  padding: 13px 0 13px 20px;
  text-align: left; vertical-align: middle;
  color: #222; font-weight: 400;
  background-color: #f8f9fa;
  border-bottom: 1px solid #ececec;
  width: 80px;
}
#qna-modal .qna-table span{
  margin-right: 30px;
}
#qna-modal .qna-table .title{
  width: 450px;
  padding: 7px 18px 5px 12px; height: 18px;
  border: 1px solid #d6d7d8; border-radius: 2px; color: #000;
  font-size: 12px;
}
#qna-modal .qna-table .content{
  width: 450px; height: 118px;
  padding: 6px 18px 6px 12px; border: 1px solid #d6d7d8;
  border-radius: 2px; font-size: 12px;
  text-transform: none; display: inline-block; text-align: start;
  cursor: text;
}
#qna-modal .qna-table .check-secret{
  display: block; position: absolute; 
  top: 0; right: 0; width: 100%; height: 100%; 
}
#qna-modal span{
  display: inline-block; vertical-align: middle;
  padding-left: 1px; font-size: 14px;
}
#qna-modal .bottom-btns{
  margin-top: 15px; text-align: center; cursor: pointer;
}
#qna-modal .bottom-btns a{
  width: 50px; height: 30px;
}
#qna-modal .bottom-btns span{
  display: inline-block; vertical-align: middle;
  padding-left: 1px; font-size: 14px;
  line-height: 8px; padding: 11px 0;
}
#qna-modal .bottom-btns .btn-confirm{
  border: 1px solid #2383dc; background-color: #2e8de5;
  border-radius: 5px; 
}
#qna-modal .bottom-btns .btn-cancel{
  margin-left: 8px;
  border: 1px solid #a4a9b0; background-color: #a4a9b0;
  border-radius: 5px;
  position: relative;
}
/* 문의하기 모달창 끝 */
</style>
<body>
<div class="body">
  <!-- 상품 상세페이지 구현 시작-->
  <div class="content-view">
    <!-- 상단 상품 카테고리 위치 표시 시작 -->
    <div class="product-category">
      <ul>
        <li>
          <a href="">
            <span>On-Air 쇼핑</span>
          </a>
        </li>
        <li>
          <i></i>
        </li>
        <li>
        <!-- 카테고리 수정 필요 ${prodCategory.pmc_name } -->
          <a href="">${prodCategory.pmc_name }</a>
        </li>
        <li>
          <i></i>
        </li>
        <li>
          <a href="">${prodCategory.psc_name }</a>
        </li>
        <li>
          <i></i>
        </li>
        <li>
          <a href="">${prodCategory.pc_name }</a>
        </li>
      </ul>
      <!-- 상단 상품 카테고리 위치 표시 끝 -->
      </div>
        <h1 class="product-name">
          ${product.pr_name }
        </h1>
        <h2 class="product-subname">
          ${product.pr_intro }
        </h2>
      <!-- product-simple-area 시작 -->
      <div class="product-simple-area">
        <!-- 상품 정보 상단 왼쪽 썸네일 시작 -->
        <div class="simple-layout-left">
          <div class="thumnail-area">
            <div class="box-thumnail">
              <div class="inner-thumnail">
                <div class="item-thumnail">
                  <figure class="zoo-item" id="zoo-item">
                    <img src="http://static.itrcomm.com/img/common/loading_360.png" id="loading_image" style="display: none;">
                    <div class="zoo-img"></div>
                  </figure>
                </div>
              </div>
              <button type="button" class="zoombox">
                <span class="mouse-icon"></span>
                Mouse over to Zoom
              </button>
            </div> 
            <div class="mini-thumnail">
              <div class="thumnail-swiper-wrapper">
                <c:forEach items="${prodFile}" var="prodFile">
                  <div class="swiper-slide-img">
					<img src="<c:url value="/file${prodFile.fi_save_name}"></c:url>" class="thumbnail" height="400" width="600">
                  </div>
			    </c:forEach>
              </div>
              <div class="control-wrap">
                <div class="swiper-control">
                  <button type="button" class="prev-btn" id="prev">
                    <span class="prev-icon"></span>
                  </button>
                  <button type="button" class="next-btn" id="next">
                    <span class="next-icon"></span>
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- 상품 정보 상단 왼쪽 썸네일 끝 -->
        <!-- simple-layout-right 시작 -->
        <div class="simple-layout-right">
          <div class="product-info">
            <!-- info-step01 시작 -->
            <div class="info-step01">
              <div class="product-id">
                <strong>Item ID</strong>
                  <a class="product-copy" onclick="copyToClipboard('${product.pr_code}')">${product.pr_code}
                  	<img class="copy-icon" src="https://cdn.pixabay.com/photo/2012/04/16/13/10/document-35941_640.png">
                  </a>
                  <button type="button" class="btn-share" id="btn-share">
                    <i class="share-icon"></i>
                  </button>
                  <button type="button" class="btn-product-like" id="btn-product-like">
                    <i class="like-icon" id="btnProductLike"></i>
                  </button>
                  <div class="box-share" id="box-share">
                    <ul>
                      <li>
                        <a href="javascript:shareFacebook();" class="btn-facebook"></a>
                      </li>
                      <li>
                        <a href="javascript:shareTwitter();" class="btn-twitter"></a>
                      </li>
                      <li>
                        <a href="javascript:shareKakao();" class="btn-kakao"></a>
                      </li>
                      <li>
                        <button class="box-share_close" id="box-share_close"></button>
                      </li>
                    </ul>
                  </div>
              </div>
              <ul class="list-info">
                <li> 
                  <dl>
                    <dt>
                      입찰수
                    </dt>
                    <dd class="bid-count">
                     ${lastAuctionRecord.getAr_num()} 회
                    </dd>
                  </dl>
                </li>
                <li>
                  <dl>
                    <dt>
                      판매종료시간
                    </dt>
                    <dd>
                    	<a id="countDday"></a>
                    	<span id="dday">( ${auction.au_final_date} )</span>
                      	<!-- 
                      	<button class="btn-deadline" id="btn-modal-deadline_open">
                        	<i class="deadline-icon"></i>
                        	마감연장
                      	</button>
                      	 -->
                     	 <button class="btn-bidlist" id="btn-modal-bidlist_open">
	                       	 <i class="bidlist-icon"></i>
	                        	경매기록보기 >
                      	</button>
                    </dd>
                  </dl>
                </li>
              </ul>
            </div>
            <!-- 마감연장 모달창 시작 -->
            <div id="deadline-modal">
               <div class="deadline-content">
                <button type="button" id="btn-modal-deadline_close" class="btn-close">X</button> 
                <h3>마감연장 창</h3>
                <span>판매종료시간</span>
                <span>${auction.au_final_date}</span>
                <a>+3</a>
                <a>+5</a>
                <a>+7</a>
                <button>마감연장하기</button>
              </div>
              <div class="modal_layer"></div>
            </div>
          </div>
          <!-- 마감연장 모달창 끝 -->
          <!-- 경매기록 모달창 시작 -->
            <div id="bidlist-modal">
              <div class="bidlist-content">
                <button type="button" id="btn-modal-bidlist_close">X</button> 
                <h3>경매기록</h3>
                <br>
                  <table border="1" style="width:400px" class="product-table">
                    <h2 class="bid">■ 입찰상품</h2>
                    <tr>
                      <th>상품명</th>
                      <td>${product.pr_name }</td>
                    </tr>
                    <tr>
                      <th width="100px">경매마감일자</th>
                      <td>${auction.au_final_date}</td>
                    </tr>
                    <tr>
                      <th>판매지역</th>
                      <td>${product.pr_location }</td>
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
                 	<c:forEach items="${auctionRecord }" var="ar">
                      <tr>
                        <td>${ar.ar_me_id}</td>
                        <td>${ar.ar_bid_time}</td>
                        <td><fmt:formatNumber value="${ar.ar_bid_price}" type="currency" currencySymbol="$" /></td>
                      </tr>
                    </c:forEach>
                  </table>
                  <br>
              </div>
              <div class="modal_layer"></div>
            </div>
            <!-- 경매기록 모달창 끝 -->
            <!-- info-step01 끝 -->
            <!-- info-step02 시작--> 
            <div class="info-step02">
              <ul class="list-price">
                <li>
                  <dl>
                    <dt>시작가</dt>
                    <dd class="start-price">
                   		<fmt:formatNumber value="${product.pr_start_price}" type="currency" currencySymbol="$" />
                    </dd>
                  </dl>
                </li>
                <li>
                  <dl>
                    <dt>현재가</dt>
                    <dd class="current-price">
						<fmt:formatNumber value="${lastAuctionRecord.getAr_bid_price()}" type="currency" currencySymbol="$" />                    
                    </dd>
                  </dl>
                </li>
              </ul>
            </div>
            <!-- info-step02 끝--> 
            <!-- product-info-btn-area 시작--> 
            <div class="product-info-btn-area">
           	  <button class="btn-imme" id="btn-modal-imme_open" onclick="btnImme()">즉시 구매
                <span class="imme-icon"></span>
           	  </button>
              <button class="btn-bid" id="btn-modal-bid_open" onclick="btnBid()">입찰하기
                <span class="bid-icon"></span>
              </button>
            </div>
            <!-- 즉시 구매 입찰 모달창 시작 -->
            <form action="<c:url value='/general/imme'></c:url>" method="post">
            <div id="imme-modal">
              <div class="modal_layer"></div>
              <div class="imme-content">
                <button type="button" id="btn-modal-imme-close">X</button> 
                <h2>즉시 구매 신청</h2>
                <br>
                <ul>
                  <li>
                    <dl>
                      <dt>즉시구매 희망가</dt>
                      <dd>
                        <b>$</b>
                        <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                      </dd>
                    </dl>
                  </li>
                </ul>
                <div class="imme-btn">
                  <a id="immeConfirm" onclick="immeSuccess();">즉시 구매하기</a>
                </div>
              </div>
            </div>
            </form>
            <!-- 즉시 구매 입찰하기 모달창 끝 -->
            <!-- 입찰하기 모달창 시작 -->
            <div id="bid-modal">
              <div class="modal_layer"></div>
              <div class="bid-content">
                <button type="button" id="btn-modal-bid-close">X</button> 
                <h3>입찰신청</h3>
                <br>
                <ul>
                  <li>
                    <dl>
                      <dt>현재 입찰가</dt>
                      <dd id="currentPrice"> $ ${lastAuctionRecord.getAr_bid_price() }</dd>
                    </dl>
                  </li>
                </ul>
                <div class="bid-btn">
                  <div class="question">
                  	입찰 신청 가격은 $ ${lastAuctionRecord.getAr_next_bid_price()} 입니다. 입찰하시겠습니까?
                  </div>
                  <input type="hidden" id="nextPrice" value="${lastAuctionRecord.getAr_next_bid_price()}">
                  <a id="bid-confirm" onclick="bidConfirm();">입찰하기</a>
                  <div class="label">경매 입찰에 성공할 경우 낙찰된 상품은 반드시 구매해 주셔야 합니다.</div>
                </div>
              </div>
            </div>
            <!-- 입찰하기 모달창 끝 -->
            <!-- product-info-btn-area 끝 -->
            <!-- store-info-area 시작 -->
            <div class="store-info-area">
              <div class="store-img"></div>
              <ul>
                <li class="store-id">
                  <div class="store" style="width: 84px; display: inline-block;">판매자</div>
                  <strong>${store.st_name }</strong>
                </li>
                <li class="buy-satisfaction">
                  구매만족도
                  <strong>99.6</strong>% 
                  <font class="buyer-number">
                    (246)
                  </font>
                </li>
              </ul>
              <a href="javascript:void(0)" class="btn-store-favorite" id="btn-store-like">
                판매자 찜
                <span class="store-favorite-icon" id="btnStoreLike"></span>
              </a>
              <a href="<c:url value='/like/seller'></c:url>" class="btn-store-more" onclick="btnStoreMore()">
                판매자 상품보기
                <span class="store-icon"></span>
              </a>
            </div>
            <!-- store-info-area 끝 -->
            <!-- product-info-step03 끝--> 
          </div>
        <!-- simple-layout-right 끝 -->
      </div>
      <!-- product-simple-area 끝-->
      <!-- 상품 세부 설명 시작 -->
      <div class="product-tab-wrap">
        <div class="tab-area">
          <ul>
            <li>
              <a class="tab" id="btn-tab-product" data-target="#tab1" style="background-color: #dcdcdc; display: block; height: 100%; font-weight: 600">상품설명</a></li>
            <li>
              <a class="tab" id="btn-tab-review" data-target="#tab2">구매후기</a></li>
            <li>
              <a class="tab" id="btn-tab-qna" data-target="#tab3">상품문의</a></li>
          </ul>
        </div>
        <!-- 상품 설명 시작 -->
        <div class="product-img-area" id="tab1">
	        <c:forEach items="${prodFile}" var="prodFile">
				<img src="<c:url value="/file${prodFile.fi_save_name}"></c:url>" height="400" width="600">
			</c:forEach>
        </div>
        <!-- 상품 설명 끝 -->
        <!-- 구매 후기 시작 -->
        <div class="tab-area">
          <ul>
            <li>
              <a class="tab" id="btn-tab-product" data-target="#tab1">상품설명</a></li>
            <li>
              <a class="tab" id="btn-tab-review" data-target="#tab2" style="background-color: #dcdcdc; display: block; height: 100%; font-weight: 600">구매후기</a></li>
            <li>
              <a class="tab" id="btn-tab-qna" data-target="#tab3">상품문의</a></li>
          </ul>
        </div>
        <div class="product-review-area" id="tab2">
          <div class="review-layout-left">
            <h4>구매자 별점</h4>
            <p class="buyer-score">
              <span class="score">4.0</span>
            </p>
            <p class="buyer-star-score">
              <span class="score-star-rate">
                <span class="star-rate-box">
                  <span class="star-rate-fill"></span>
                </span>
              </span>
            </p>
            <p class="score-people-num">
              <strong>(246)</strong>
            </p>
          </div>
          <div class="review-layout-right">
            <table class="feedback-table">
              <div class="review-area">
                <colgroup>
                  <col style="width: 20%">
                  <col style="width: 50%">
                  <col style="width: 18%">
                 </colgroup>
                <thead>
                  <tr>
                    <th colspan="3"></th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${review }" var="re">
	                  <tr>
	                    <td class="badge-icon">
	                      <span class="box-feedback-star-rate">
	                        <img src="http://pics.auction.co.kr/pc/single/used-market/vip__star2.png" class="star-image">
	                        <span class="box-rating">
	                          <span class="star-current">${re.re_satisfaction }</span> /
	                          <span class="star-max">5</span>
	                        </span>
	                      </span>
	                    </td>
	                    <td class="coment">
	                      <div class="box-coment">
	                        <div class="coment-title">
	                          <strong>
	                            <a href="">${re.re_title }</a>
	                          </strong>
	                        </div>
	                        <p class="coment-detail">${re.re_content }</p>
	                      </div>
	                    </td>
	                    <td class="coment-user">
	                      <ul>
	                        <li class="id">
	                          <strong>kh112***</strong>
	                        </li>
	                        <li class="date">${re.re_registration }</li>
	                      </ul>
	                    </td>
	                  </tr>
                  </c:forEach>
                </tbody>
              </div>
            </table>
          </div>
          <ul class="review pagination justify-content-center" id="review-page">
          	<li class="page-item disabled"><a class="page-link active" href="#">&laquo;</a></li>
   		   	<li class="page-item"><a class="page-link" href="#">1</a></li>
        	<li class="page-item"><a class="page-link" href="#">2</a></li>
       		<li class="page-item"><a class="page-link" href="#">3</a></li>
       		<li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
          </ul>
        </div>
        <!-- 구매 후기 끝 -->
        <!-- 상품 문의 시작 -->
        <div class="tab-area">
          <ul>
            <li>
              <a class="tab" id="btn-tab-product" data-target="#tab1">상품설명</a></li>
            <li>
              <a class="tab" id="btn-tab-review" data-target="#tab2">구매후기</a></li>
            <li>
              <a class="tab" id="btn-tab-qna" data-target="#tab3" style="background-color: #dcdcdc; display: block; height: 100%; font-weight: 600">상품문의</a></li>
          </ul>
        </div>
        <div class="product-qna-area" id="tab3">
          <div class="box-qna-area">
            <div class="qna-layout-right">
              <a id="btn-modal-qna_open">문의하기</a>
              <div id="qna-modal">
                <div class="qna-content">
                  <button type="button" id="btn-modal-qna_close">X</button> 
                  <h3>판매자에게 문의하기</h3>
                  <br>
                  <!-- 
                  <form action="<c:url value="/inquiry"></c:url>" method="post" enctype="multipart/form-data">
                    <table class="qna-table">
                      <tr>
                        <th>문의유형</th>
                        <td>
                          <div class="qna-category">
                            <input type="radio" name="qna-kind" value="product" checked>
                              <span>상품</span>
                            <input type="radio" name="qna-kind" value="delivery">
                              <span>배송</span>
                            <input type="radio" name="qna-kind" value="etc">
                              <span>기타</span>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <th>제목</th>
                        <td>
                          <input type="text" class="title">
                        </td>
                      </tr>
                      <tr>
                        <th>내용</th>
                        <td>
                          <input type="text" class="content">
                        </td>
                      </tr>
                    </table>
                    <div class="bottom-btns">
                      <a class="btn-confirm">
                        <span>등록</span>
                      </a>
                      <a class="btn-cancel" id="btn-cancel">
                        <span>취소</span>
                      </a>
                    </div>
                  </form>
                 -->
                </div>
                <div class="modal_layer"></div>
              </div>
            </div>
            <div class="list-qna">
              <table class="table-qna">
                <colgroup>
                  <col style="width: 80px">
                  <col style="width: 120px">
                  <col style="width: 120px">
                  <col>
                  <col style="width: 200px">
                  <col style="width: 150px;">
                </colgroup>
                <thead>
                  <tr>
                    <th class="hnum">
                      <a href="#">번호</a>
                    </th>
                    <th class="htype">
                      <a href="#">문의종류</a>
                    </th>
                    <th class="htit">
                      <a href="#">답변상태</a>
                    </th>
                    <th>제목</th>
                    <th>문의자</th>
                    <th>등록일</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                	<c:forEach items="${inquiry }" var="inqu">
	                    <td>${inqu.in_num }</td>
                    	<%-- 
                    	<td>${inqu.ic_name }</td>
                    	--%>
	                    <td>${inqu.in_state }</td>
	                    <td>${inqu.in_title }</td>
	                    <td>${inqu.in_me_id }</td>
	                    <td>${inqu.in_register_date }</td>
	                </c:forEach>
                  </tr>
                  <%--
                  <tr>
                	<c:forEach items="${list }" var="inqu">
	                    <td>${inqu.in_num }</td>
	                </c:forEach>
		                    <c:forEach items="${list}" var="inquCate">
			                    <td>${inquCate.ic_num }</td>
			                 </c:forEach>
	                    <!-- td class="ing" or "done" -->
	                    <c:forEach items="${list }" var="inqu">
		                    <td class="ing">${inqu.in_state }</td>
		                    <td>${inqu.in_title }</td>
		                    <td>${inqu.in_me_id }</td>
		                    <td>${inqu.in_register_date }</td>
		                </c:forEach>
                  </tr>
                  --%>
                </tbody>
              </table>
	            <ul class="qna pagination justify-content-center" id="qna-page">
	      		  <li class="page-item disabled"><a class="page-link active" href="#">&laquo;</a></li>
		   		  <li class="page-item"><a class="page-link" href="#">1</a></li>
	    		  <li class="page-item"><a class="page-link" href="#">2</a></li>
	   			  <li class="page-item"><a class="page-link" href="#">3</a></li>
	   			  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	     	    </ul>
            </div>
          </div>
        </div>
        <!-- 상품 문의 끝 -->
      </div>
      <!-- 상품 세부 설명 끝 -->
    </div>
    <button class="content-top" onclick="topBtn()">↑</button>
  </div>
</body>
<script>
//상단바로 부드럽게 이동
function topBtn() {
  document.body.scrollIntoView({behavior : 'smooth'});
}
// 탭 클릭 시 해당 특정 위치로 스크롤
$(function(){
  const tabs = document.querySelectorAll('.tab');
	tabs.forEach(tab => {
	  tab.addEventListener('click', () => {
	    const targetId = tab.dataset.target;
	    const targetElement = document.querySelector(targetId);
	    if (targetElement) {
	      setTimeout(() => {
	        targetElement.scrollIntoView({ behavior: 'smooth'});
	      }, 100);
	    }
	  });
	});
})


function immeSuccess(){
	document.getElementById("imme-modal").style.display = "none";
 
}


// 썸네일 이미지 표시
$(function(){
  let selectedImage = null;
  let images = document.querySelectorAll(".swiper-slide-img img"); // 이미지 선택을 위한 변수 선언
  let currentIndex = 0;

  function selectImage(image) {
    if (selectedImage !== null) {
      selectedImage.classList.remove("selected");
    }
    image.classList.add("selected");
    selectedImage = image;
  }
  
  images.forEach((image, index) => {
    image.addEventListener("click", () => {
      currentIndex = index; // 이미지 클릭 시 현재 인덱스 업데이트
      selectImage(image);
    });
  });
  
 // 첫 번째 이미지를 선택 상태로 설정
  selectImage(images[currentIndex]);

 // 이전, 다음 버튼 클릭 시 선택된 테두리 색상 변경
  let prevButton = document.querySelector(".prev-btn");
  let nextButton = document.querySelector(".next-btn");

  prevButton.addEventListener("click", () => {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = images.length - 1;  // 맨 마지막 이미지로 이동
    }
    selectImage(images[currentIndex]);
  });

  nextButton.addEventListener("click", () => {
    if (currentIndex < images.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;  // 첫 번째 이미지로 이동
    }
    selectImage(images[currentIndex]);
  });
});
  // 이미지 슬라이드 관련 변수 설정
  var slideIndex = 0;
  var images = document.querySelectorAll('.swiper-slide-img img');
  var zoomImage = document.querySelector('.zoo-img');
	
  // 이전 버튼 클릭 이벤트 처리
  document.getElementById('prev').addEventListener('click', function() {
    showSlide(slideIndex - 1);
  });
  // 다음 버튼 클릭 이벤트 처리
  document.getElementById('next').addEventListener('click', function() {
  	showSlide(slideIndex + 1);
  });
  // 이미지 슬라이드 보여주기
  function showSlide(index) {
	if (index < 0) {
      index = images.length - 1;
    } else if (index >= images.length) {
      index = 0;
    }
    slideIndex = index;
	  
  // 이미지 변경
  zoomImage.style.backgroundImage = 'url("' + images[slideIndex].src + '")';
  }
  // 초기에 첫 번째 이미지 보여주기
  showSlide(slideIndex);
  
  // 마우스 상품 이미지 확대 기능
  var img = document.getElementById("zoo-item");
  
  img.addEventListener("mousemove", function(event) {
    var mouseX = event.clientX;
    var mouseY = event.clientY;
    
    var imageX = img.offsetLeft;
    var imageY = img.offsetTop;
    
    var offsetX = mouseX - imageX;
    var offsetY = mouseY - imageY;
    
    var zoom = 2;
    
    img.style.transform = "scale(" + zoom + ")";
    img.style.transformOrigin = offsetX + "px " + offsetY + "px";
  });
  
  img.addEventListener("mouseleave", function(event) {
    img.style.transform = "none";
  });

// 상품 찜하기 버튼 클릭 시 이벤트 발생
$(function(){
  	const btnProductLike = document.getElementById("btn-product-like");
  	const btnProductlikeSel = document.getElementById("btnProductLike");
  	
  	btnProductLike.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 상품 찜하기가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	// location.href="<c:url value='/login'></c:url>"
	    	let returnUrl = encodeURIComponent(window.location.href);
	        let loginUrl = '<c:url value="/login" />';
	        location.href = loginUrl + '?returnUrl=' + returnUrl;
	    }
	    return;
	}
	let pl_state = 1;
	
  	// 페이지 로딩 시 서버에서 찜한 상태를 확인하고, 버튼의 CSS를 수정
	$.ajax({
 		async: true,
 		type: 'GET',
 		url: "<c:url value='/like/product/${product.pr_code}/" + pl_state + "'></c:url>",
 		dataType:"json",
 		success: function(data){
 			console.log(data);
 		}
 	});
    const hasClass = btnProductlikeSel.classList.toggle("sel");
	if(hasClass){
  		if(confirm("상품 찜하기를 등록했습니다.\n찜한 상품 페이지로 이동하시겠습니까?")){
  			location.href = "${pageContext.request.contextPath}/like/product"	
		}
    }else{
      alert("상품 찜하기를 취소했습니다.");
    }
});
	// 스토어 찜하기 버튼 클릭 시 이벤트 발생
	const btnStoreLike = document.getElementById("btn-store-like");
	const btnStoreLikeSel = document.getElementById("btnStoreLike");
	  
	btnStoreLike.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 판매자 찜하기가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	let returnUrl = encodeURIComponent(window.location.href);
	        let loginUrl = '<c:url value="/login" />';
	        location.href = loginUrl + '?returnUrl=' + returnUrl;
	    }
	    return;
	}
	let sl_state = 1;
	$.ajax({
		async: true,
		type: 'GET',
		url: "<c:url value='/like/product/${product.pr_code}/" + sl_state + "'></c:url>",
		dataType:"json",
		success: function(data){
			console.log(data);
		}
	});
  	const hasClass = btnStoreLikeSel.classList.toggle("sel");
  	
  	if(hasClass){
  		if(confirm("판매자 찜하기를 등록했습니다.\n찜한 판매자 페이지로 이동하시겠습니까?")){
  			location.href = "${pageContext.request.contextPath}/like/seller"
	    }else{
	   	alert("판매자 찜하기를 취소했습니다.");
		}
  	}
  })
});




// SNS 공유하기
$(function(){
  const modal = document.getElementById("box-share")
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-share")
  btnModal.addEventListener("click", e => {
      modalOn()
  })
  const closeBtn = modal.querySelector("#box-share_close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
})


// 마감연장 모달창
$(function(){
	// 마감연장 창 요소 가져오기
	const deadlineModal = document.getElementById("deadline-modal");
	const deadlineOpenBtn = document.getElementById("btn-modal-deadline_open");
	const deadlineCloseBtn = deadlineModal.querySelector("#btn-modal-deadline_close");
	const deadlineExtendBtns = deadlineModal.querySelectorAll("a");
	const deadlineExtendBtn = deadlineModal.querySelector("button");

	// 마감연장 창 열기
	deadlineOpenBtn.addEventListener("click", function() {
	  deadlineModal.style.display = "flex";
	});

	// 마감연장 창 닫기
	deadlineCloseBtn.addEventListener("click", function() {
	  deadlineModal.style.display = "none";
	});

	// 마감 연장 버튼 클릭 이벤트 처리
	deadlineExtendBtns.forEach(function(btn) {
	  btn.addEventListener("click", function() {
	    const extendTime = parseInt(btn.textContent); // 연장할 시간 (ex: 3, 5, 7)
	    
	    // 서버로 마감 연장 요청 전송
	    // ...

	    // 서버 응답 받아서 경매 종료 시간 갱신
	    const newDeadline = ""; // 서버로부터 받은 새로운 종료 시간
	    // 경매 종료 시간 갱신
	    const deadlineElement = deadlineModal.querySelector("span");
	    deadlineElement.textContent = newDeadline;
	  });
	});

	// 마감연장하기 버튼 클릭 이벤트 처리
	deadlineExtendBtn.addEventListener("click", function() {
	  // 서버로 마감 연장 요청 전송
	  // ...

	  // 서버 응답 받아서 경매 종료 시간 갱신
	  const newDeadline = ""; // 서버로부터 받은 새로운 종료 시간
	  // 경매 종료 시간 갱신
	  const deadlineElement = deadlineModal.querySelector("span");
	  deadlineElement.textContent = newDeadline;

	  // 마감연장 창 닫기
	  deadlineModal.style.display = "none";
	});
});


// 경매기록 모달창
$(function(){
  const modal = document.getElementById("bidlist-modal")
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-modal-bidlist_open")
  btnModal.addEventListener("click", e => {
      modalOn()
  })
  const closeBtn = modal.querySelector("#btn-modal-bidlist_close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
})


// 즉시구매 입찰하기 페이지 이동
$(function() {
	const btnImme = document.getElementById("btn-imme");
  
	btnImme.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 즉시 구매가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	let returnUrl = encodeURIComponent(window.location.href);
	        let loginUrl = '<c:url value="/login" />';
	        location.href = loginUrl + '?returnUrl=' + returnUrl;
		    }
		}
	})
})

// 즉시구매 입찰하기 모달창
$(function(){
  const modal = document.getElementById("imme-modal")
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-modal-imme_open")
  btnModal.addEventListener("click", e => {
      modalOn()
  })
  const closeBtn = modal.querySelector("#btn-modal-imme-close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
})

// 즉시구매 모달창에서 즉시구매 버튼 클릭 시 기능 구현
function immeConfirm(){
  alert('즉시구매에 성공했습니다.')
  document.getElementById("imme-modal").style.display = "none";
}
$('.btn-confirm').click(function(e){
  e.preventDefault();
});

// 입찰하기 기능 구현
// 입찰하기 모달창
$(function() {
  const btnBid = document.getElementById("btn-modal-bid_open");
  const modal = document.getElementById("bid-modal");
  
  btnBid.addEventListener("click", function() {
  	if ('${user.me_id}' == '') {
      let res = confirm('로그인한 회원만 즉시 구매가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
      if (res) {
    	  let returnUrl = encodeURIComponent(window.location.href);
	      let loginUrl = '<c:url value="/login" />';
	      location.href = loginUrl + '?returnUrl=' + returnUrl;
      }
   	} else {
      	modal.style.display = "flex";
    }
 });

  const closeBtn = modal.querySelector("#btn-modal-bid-close");
  closeBtn.addEventListener("click", function() {
    modal.style.display = "none";
  });

  $('#bid-confirm').click(function(e) {
	let price = $("#nextPrice").val();
	
	$.ajax({
		type: 'POST',
		url: '<c:url value="/generalBid"></c:url>',
		data: JSON.stringify({ price: price }),
		dataType: "JSON",
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			if(result.res){
				let str = '';
				str +=
					'<div class="bid-content">' +
					'입찰 신청 가격은 ' + '$' + result.nextPrice + ' 입니다. 입찰하시겠습니까?' + 
					'</div>';
				$('.bid-content').html(str);
				$("#nextPrice").val(result.nextPrice);
				alert("입찰하였습니다.")
				
				// 현재가 업데이트
			    $("#currentPrice").text('$' + result.nextPrice);
			}
			else if(result.bidPossible == false){
				alert("경매시작 전입니다.")
			}
			else{
				alert("보유계좌에 잔액이 부족합니다.");
			}
		},
		error: function(){
			console.log("error");
		}
	});
    document.getElementById("bid-modal").style.display = "none";
  });
});

/*
 
$(function(){
  const modal = document.getElementById("bid-modal")
    
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-modal-bid_open")
  btnModal.addEventListener("click", e => {
	  if('${user.me_id}' == ''){
		let res = confirm('로그인한 회원만 입찰하기가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
		  if(res){
		    location.href="<c:url value='/login'></c:url>"
		  }
	  }else{
      	modalOn()
	  }
  })
  const closeBtn = modal.querySelector("#btn-modal-bid_close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
});
// 입찰하기 모달창 내에서의 기능 구현
$('#bidConfirm').click(function(){
	// 입찰가격과 회원의 보유계좌잔액을 비교하여 입찰 진행 유무 코드 구현 해야함
	
	$.ajax({
		type: 'POST',
		url: '<c:url value="/general/bid"></c:url>',
		data: JSON.stringify(price),
		dataType: "JSON",
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			if(result.res){
				let str = '';
				str +=
					'<div class="bid-content">' +
					'입찰 신청 가격은 ' + '$' + result.nextPrice + ' 입니다. 입찰하시겠습니까?' + 
					'</div>';
					$('.bid-content').html(str);
					$("#nextPrice").val(result.nextPrice);
					alert("입찰하였습니다.")
			}
			else if(result.bidPossible == false){
				alert("경매시작 전입니다.")
			}
			else{
				alert("보유계좌에 잔액이 부족합니다.");
			}
		},
		error: function(){
			console.log("error");
		}
	});
	if(num == 0)
		alert("종료된 경매이므로 입찰할 수 없습니다.");
});
// 입찰하기 모달창에서 입찰하기 버튼 클릭 시 기능 구현
function bidConfirm(){
  alert('입찰에 성공했습니다.')
  document.getElementById("bid-modal").style.display = "none";
}
$('.btn-confirm').click(function(e){
  e.preventDefault();
});

*/






// 문의하기 모달창
$(function() {
  const modal = document.getElementById("qna-modal");
  const form = document.getElementById("qna-form");

  function modalOn() {
    modal.style.display = "flex";
  }

  function modalOff() {
    modal.style.display = "none";
  }

  const btnModal = document.getElementById("btn-modal-qna_open");
  btnModal.addEventListener("click", function(e) {
    modalOn();
  });

  const closeBtn = modal.querySelector(".close");
  closeBtn.addEventListener("click", function(e) {
    modalOff();
  });

  const cancelBtn = modal.querySelector(".btn-cancel");
  cancelBtn.addEventListener("click", function(e) {
    modalOff();
  });

  form.addEventListener("submit", function(e) {
    e.preventDefault(); // 기본 제출 동작 방지

    // 입력 값 가져오기
    const category = document.querySelector(
      "input[name='qna-kind']:checked"
    ).value;
    const title = document.getElementById("qna-title").value.trim();
    const content = document.getElementById("qna-content").value.trim();

    // 유효성 검사
    if (title === "") {
      alert("제목을 입력하세요.");
      return;
    }

    if (content === "") {
      alert("내용을 입력하세요.");
      return;
    }

    // 여기서 AJAX 또는 fetch를 사용하여 서버에 데이터 전송 및 처리
    // ...

    // 모달창 닫기
    modalOff();
  });
});



/*
$(function(){
  const modal = document.getElementById("qna-modal")
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-modal-qna_open")
  btnModal.addEventListener("click", e => {
      modalOn()
  })
  const closeBtn = modal.querySelector("#btn-modal-qna_close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
  const cancelBtn = modal.querySelector("#btn-cancel")
  cancelBtn.addEventListener("click", e => {
      modalOff()
  })
})
// 문의하기
$('form').submit(function(){
	let title = $('.title').val();
	if(title.trim().length == 0){  
		alert('제목을 입력하세요.');
		return false;
	}
	
	let content = $('.content').val();
	if(content.trim().length == 0){ 
		alert('내용을 입력하세요.');
		return false;
	}
});
*/
// 문의하기 페이지 번호 클릭 시 번호 색상 변경
$(document).ready(function() {
  $('#qna-page .page-link').click(function(event) {
    event.preventDefault();
    var page = $(this).text();
    $(this).removeClass('active');
    $(this).addClass('active').siblings().removeClass('active');
  })
});
// 후기 페이지 번호 클릭 시 번호 색상 변경
$(document).ready(function() {
  $('#review-page .page-link').click(function(event) {
    event.preventDefault();
    var page = $(this).text();
    $(this).removeClass('active');
    $(this).addClass('active').siblings().removeClass('active');
  })
});

// 판매종료시간 카운트다운
const countDownTimer = function (id, date) {
	var _vDate = new Date(date); // 전달 받은 일자
	var _second = 1000;
	var _minute = _second * 60;
	var _hour = _minute * 60;
	var _day = _hour * 24;
	var timer;

	function showRemaining() {
		var now = new Date();
		var distDt = _vDate - now;

		if (distDt < 0) {
			clearInterval(timer);
			document.getElementById(id).textContent = '해당 경매가 종료 되었습니다!';
			return;
		}

		var days = Math.floor(distDt / _day);
		var hours = Math.floor((distDt % _day) / _hour);
		var minutes = Math.floor((distDt % _hour) / _minute);
		var seconds = Math.floor((distDt % _minute) / _second);

		//document.getElementById(id).textContent = date.toLocaleString() + "까지 : ";
		document.getElementById(id).textContent = days + '일 ';
		document.getElementById(id).textContent += hours + '시간 ';
		document.getElementById(id).textContent += minutes + '분 ';
		document.getElementById(id).textContent += seconds + '초';
	}
	timer = setInterval(showRemaining, 1000);
}

var dateObj = new Date();
dateObj.setDate(dateObj.getDate() + 1);

countDownTimer('countDday', `${auction.au_final_date}`);

// 페이스북 공유하기
function shareFacebook() {
    var sendUrl = "onairauction.com"; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

// 트위터 공유하기
function shareTwitter() {
    var sendText = "[공유]일반 경매"; // 전달할 텍스트
    var sendUrl = "blog.naver.com"; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

// 카카오톡 공유하기
function shareKakao(){
	// 사용할 앱의 JavaScript 키 설정
	  Kakao.init('39cf8f060602cd52760b50470a9c192b');

	  // 카카오링크 버튼 생성
	  Kakao.Link.createDefaultButton({
	    container: '.btn-kakao', // 카카오공유버튼ID
	    objectType: 'feed',
	    content: {
	      title: "테스트", // 보여질 제목
	      description: "[공유] 일반 경매 상품 공유", // 보여질 설명
	      imageUrl: "blog.naver.com/", // 콘텐츠 URL
	      link: {
	         mobileWebUrl: "blog.naver.com/",
	         webUrl: "blog.naver.com/"
	      }
	    }
	  });
}
// 제품 코드 선택 시 텍스트 자동 복사 이벤트
function copyToClipboard(text) {
    navigator.clipboard.writeText(text);
    alert(text + " is copied to clipboard.");
}

</script>
</html>
