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
  background-image: url(https://i.ebayimg.com/00/s/MTQ5NVgxNjAw/z/lOIAAOSw7npiMlXw/$_57.JPG?set_id=880000500F);
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
  transition-duration: 0ms; transform: translate3d(15px, 0px, 0px);
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
  border: 2px solid #ca6565;
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
  border-right: 1px solid #dfdfdf;
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

.product-img01{
  width: inherit; max-width: 100%; height: auto; vertical-align: top;
  border-style: none; padding-top: 40px 
}
.product-img02{
  width: inherit; max-width: 100%; height: auto; vertical-align: top;
  border-style: none; padding-bottom: 70px;
}

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

.review-layout-right .photo-review{
  text-align: center; 
}
.review-layout-right .thumnail{
  width: 80px; height: 80px; display: inline-block;
}
.review-layout-right .photo-review img{
  width: 80px; height: 80px; border-radius: 2px; outline: none;
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
  padding-right: 21px;
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
  background: #a4a9b0; text-align: center; margin-left: 12px;
}
.product-qna-area table{
  table-layout: fixed; width: 100%; border-collapse: collapse;
  border-top: 1px solid #a4a9b0; border-bottom: 1px solid #ececec;
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
  background-color: #fff; cursor: pointer;
  color: black; opacity: 85%;
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
  text-align: center;
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
}
#bid-modal .bid-content dd{
  text-align: right; float: right; width: 330px;
  line-height: 26px; font-weight: 600;
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
  text-align: center;
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
  margin-top: 15px; text-align: center;
}
#qna-modal .bottom-btns a{
  display: inline-block; width: 50px; height: 30px;
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
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTUwMFgxNTAw/z/MiQAAOSwv41ix2EB/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTUwMFgxNTAw/z/SAgAAOSwVOpix2EB/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTUwMFgxNTAw/z/MiQAAOSwv41ix2EB/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTQwMFgxNDAw/z/QcsAAOSw6TVix2EC/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTUwMFgxNTAw/z/awAAAOSwlptix2EB/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
                <div class="swiper-slide-img">
                  <img src="https://i.ebayimg.com/00/s/MTMwMFgxMzAw/z/8o0AAOSwA5Fix2EB/$_0.JPG?set_id=880000500F" class="thumbnail">
                </div>
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
                      
                      회
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
                    	<span id="dday">${auction.au_final_date}</span>
                      	<button class="btn-deadline" id="btn-modal-deadline_open">
                        	<i class="deadline-icon"></i>
                        	마감연장
                      	</button>
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
                <button type="button" id="btn-modal-deadline-close" class="btn-close">X</button> 
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
                 	<c:forEach items="${list }" var="auRecord">
                      <tr>
                        <td>${auRecord.ar_me_id}</td>
                        <td>${auRecord.ar_bid_time}</td>
                        <td>${auRecord.ar_bid_price}</td>
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
						<fmt:formatNumber value="${auRecord.getAr_bid_price()}" type="currency" currencySymbol="$" />                    
                    </dd>
                  </dl>
                </li>
              </ul>
            </div>
            <!-- info-step02 끝--> 
            <!-- product-info-btn-area 시작--> 
            <div class="product-info-btn-area">
           	  <!-- 
              <button class="btn-imme" id="btn-modal-imme_open" onclick="btnImme()">즉시 구매하기
              </button>
           	   -->
           	  <button class="btn-imme" id="btn-modal-imme_open" onclick="btnImme()'">즉시 구매
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
                        <input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        <b>원</b>
                      </dd>
                    </dl>
                  </li>
                </ul>
                <div class="imme-btn">
                  <a onclick="immeSuccess();">입찰하기</a>
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
                      <dd>
                      	$ <input type="hidden" id="nextPrice" value="${lastAuctionRecord.getAr_bid_price() }">
                      </dd>
                    </dl>
                  </li>
                </ul>
                <div class="bid-btn">
                  <div class="question">
                  	입찰 신청 가격은 $ ${lastAuctionRecord.getAr_next_bid_price()} 입니다. 입찰하시겠습니까?
                  </div>
                  <a id="bidConfirm" onclick="bidConfirm();">입찰하기</a>
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
              <a href="javascript:void(0)" class="btn-store-more" onclick="btnStoreMore()">
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
              <a class="tab" id="btn-tab-product" data-target="#tab1" >상품설명</a></li>
            <li>
              <a class="tab" id="btn-tab-review" data-target="#tab2">구매후기</a></li>
            <li>
              <a class="tab" id="btn-tab-qna" data-target="#tab3">상품문의</a></li>
          </ul>
        </div>
        <!-- 상품 설명 시작 -->
        <div class="product-img-area" id="tab1">
          <img src="https://www.lge.co.kr/kr/images/monitors/md08922028/usp/usp_0101.jpg" alt="" class="product-img01">
          <img src="https://www.lge.co.kr/kr/images/monitors/md08922028/usp/usp_0201.jpg" alt="" class="product-img02">
        </div>
        <!-- 상품 설명 끝 -->
        <!-- 구매 후기 시작 -->
        <div class="tab-area">
          <ul>
            <li>
              <a class="tab" id="btn-tab-product" data-target="#tab1">상품설명</a></li>
            <li>
              <a class="tab" id="btn-tab-review" data-target="#tab2">구매후기</a></li>
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
                  <col style="width: 130px">
                  <col style="width: 100px">
                  <col style="width: 450px">
                  <col style="width: 120px">
                </colgroup>
                <thead>
                  <tr>
                    <th colspan="4"></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="photo-review">
                      <a href="" class="thumnail">
                        <img src="https://cdn.pixabay.com/photo/2023/03/10/14/59/external-hard-drive-7842510_960_720.jpg">
                      </a>
                    </td>
                    <td class="badge-icon">
                      <span class="box-feedback-star-rate">
                        <img src="http://pics.auction.co.kr/pc/single/used-market/vip__star2.png" class="star-image">
                        <span class="box-rating">
                          <span class="star-current">4 </span>/
                          <span class="star-max">5</span>
                        </span>
                      </span>
                    </td>
                    <td class="coment">
                      <div class="box-coment">
                        <div class="coment-title">
                          <strong>
                            <a href="">[구매상품] USB 3.0 백업용 외장하드 디스크 500GB</a>
                          </strong>
                        </div>
                        <p class="coment-detail">감사합니다</p>
                      </div>
                    </td>
                    <td class="coment-user">
                      <ul>
                        <li class="id">
                          <strong>kh112***</strong>
                        </li>
                        <li class="date">2023-02-18</li>
                      </ul>
                    </td>
                  </tr>
                  <tr>
                    <td class="photo-review">
                      <a href="" class="thumnail">
                        <img src="https://cdn.pixabay.com/photo/2021/11/11/22/07/ipad-6787365_960_720.jpg">
                      </a>
                    </td>
                    <td class="badge-icon">
                      <span class="box-feedback-star-rate">
                        <img src="http://pics.auction.co.kr/pc/single/used-market/vip__star2.png" class="star-image">
                        <span class="box-rating">
                          <span class="star-current">4 </span>/
                          <span class="star-max">5</span>
                        </span>
                      </span>
                    </td>
                    <td class="coment">
                      <div class="box-coment">
                        <div class="coment-title">
                          <strong>
                            <a href="#">[구매상품] 아이패드 프로11(M2) wifi 256GB</a>
                          </strong>
                        </div>
                        <p class="coment-detail">좋은 가격에 구매했습니다. 감사합니다.</p>
                      </div>
                    </td>
                    <td class="coment-user">
                      <ul>
                        <li class="id">
                          <strong>kh132***</strong>
                        </li>
                        <li class="date">2023-02-18</li>
                      </ul>
                    </td>
                  </tr>
                  <tr>
                    <td class="photo-review">
                      <a href="" class="thumnail">
                        <img src="https://cdn.pixabay.com/photo/2019/05/02/04/52/ipad-4172648_960_720.png">
                      </a>
                    </td>
                    <td class="badge-icon">
                      <span class="box-feedback-star-rate">
                        <img src="http://pics.auction.co.kr/pc/single/used-market/vip__star2.png" class="star-image">
                        <span class="box-rating">
                          <span class="star-current">3 </span>/
                          <span class="star-max">5</span>
                        </span>
                      </span>
                    </td>
                    <td class="coment">
                      <div class="box-coment">
                        <div class="coment-title">
                          <strong>
                            <a href="#">[구매상품] 애플 펜슬 2세대</a>
                          </strong>
                        </div>
                        <p class="coment-detail">포장 상태 좋아요. 잘 받았습니다.</p>
                      </div>
                    </td>
                    <td class="coment-user">
                      <ul>
                        <li class="id">
                          <strong>k71g2***</strong>
                        </li>
                        <li class="date">2023-02-18</li>
                      </ul>
                    </td>
                  </tr>
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
              <a class="tab" id="btn-tab-qna" data-target="#tab3">상품문의</a></li>
          </ul>
        </div>
        <div class="product-qna-area" id="tab3">
          <div class="box-qna-area">
            <div class="qna-layout-right">
              <a href="javascript:void(0)" id="btn-modal-qna_open">문의하기</a>
              <div id="qna-modal">
                <div class="qna-content">
                  <button type="button" id="btn-modal-qna_close">X</button> 
                  <h1>판매자에게 문의하기</h1>
                  <br>
                  <form action="" method="post">
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
                    <input type="checkbox" class="check-secret">
                      <span>비밀글로 문의하기</span>
                    <div class="bottom-btns">
                      <a href="javascript:void(0)" class="btn-confirm">
                        <span>등록</span>
                      </a>
                      <a href="javascript:void(0)" class="btn-cancel" id="btn-cancel">
                        <span>취소</span>
                      </a>
                    </div>
                  </form>
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
                    <td>23</td>
                    <td>상품</td>
                    <td class="ing">답변대기</td>
                    <td class="qna-title">
                      <a href="#">상품 문의입니다.
                        <span class="lock-icon">비밀글</span>
                      </a>
                    </td>
                    <td>qwe*****</td>
                    <td>2023-02-21</td>
                  </tr>
                  <tr>
                    <td>22</td>
                    <td>상품</td>
                    <td class="done">답변완료</td>
                    <td class="qna-title">
                      <a href="#">상품 문의입니다.
                        <span class="lock-icon">비밀글</span>
                      </a>
                    </td>
                    <td>wog***</td>
                    <td>2023-02-15</td>
                  </tr>
                  <tr>
                    <td>21</td>
                    <td>배송</td>
                    <td class="done">답변완료</td>
                    <td class="qna-title">
                      <a href="#">배송 문의입니다.
                      </a>
                    </td>
                    <td>dog****</td>
                    <td>2023-02-01</td>
                  </tr>
                  <tr>
                    <td>20</td>
                    <td>상품</td>
                    <td class="done">답변완료</td>
                    <td class="qna-title">
                      <a href="#">상품 문의입니다.
                        <span class="lock-icon">비밀글</span>
                      </a>
                    </td>
                    <td>qc1d****</td>
                    <td>2023-01-28</td>
                  </tr>
                  <tr>
                    <td>19</td>
                    <td>상품</td>
                    <td class="done">답변완료</td>
                    <td class="qna-title">
                      <a href="#">상품 문의입니다.
                        <span class="lock-icon">비밀글</span>
                      </a>
                    </td>
                    <td>cat2***</td>
                    <td>2023-01-24</td>
                  </tr>
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

function btnStoreMore(){
  alert('<페이지 이동 구현후 알림창 삭제 예정>\n판매자 상품보기 페이지로 이동합니다.')
}


function immeSuccess(){
	document.getElementById("imme-modal").style.display = "none";
 
}


// 썸네일 이미지 표시
$(function(){
  let selectedImage = null;

  function selectImage(image) {
    if (selectedImage !== null) {
      selectedImage.classList.remove("selected");
    }
    image.classList.add("selected");
    selectedImage = image;
  }
  let images = document.querySelectorAll(".swiper-slide-img img");
  images.forEach((image) => {
    image.addEventListener("click", () => {
      selectImage(image);
    });
  });
  // 이전, 다음 버튼 클릭 시 선택된 테두리 색상 변경
  let prevButton = document.querySelector(".prev-btn");
  let nextButton = document.querySelector(".next-btn");
  
  prevButton.addEventListener("click", () => {
    let images = document.querySelectorAll(".swiper-slide-img img");
    let currentIndex = Array.from(images).indexOf(selectedImage);
    if (currentIndex > 0) {
      selectImage(images[currentIndex - 1]);
    }
  });

  nextButton.addEventListener("click", () => {
    let images = document.querySelectorAll(".swiper-slide-img img");
    let currentIndex = Array.from(images).indexOf(selectedImage);
    if (currentIndex < images.length - 1) {
      selectImage(images[currentIndex + 1]);
    }
  });
});
// 썸네일 이미지 클릭 시 큰 화면 표시 (구현중)
$(function(){
  const images = $('.zoom img');
  const currentIndex = 0;

  $('.prev-btn').click(function() {
    currentIndex = (currentIndex === 0) ? images.length - 1 : currentIndex - 1;
    $('.thumbnail').attr('src', images.eq(currentIndex).attr('src'));
  });

  $('.next-btn').click(function() {
    currentIndex = (currentIndex === images.length - 1) ? 0 : currentIndex + 1;
    $('.thumbnail').attr('src', images.eq(currentIndex).attr('src'));
  });
});


// 마우스 상품 이미지 확대 기능
$(function(){
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
})

// 상품 찜하기 버튼 클릭 시 이벤트 발생
$(function(){
  	const btnProductLike = document.getElementById("btn-product-like");
  	const btnProductlikeSel = document.getElementById("btnProductLike");
  	
  	btnProductLike.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 상품 찜하기가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	location.href="<c:url value='/login'></c:url>"
	    }
	    return;
	}
	let pl_state = 1;
	
  	// 페이지 로딩 시 서버에서 찜한 상태를 확인하고, 버튼의 CSS를 수정
	$.ajax({
 		async: true,
 		type: 'GET',
 		url: "<c:url value='/like/product/${product.pr_code}/"+pl_state+"'></c:url>",
 		dataType:"json",
 		success: function(data){
 			console.log(data);
 		}
 	})
    const hasClass = btnProductlikeSel.classList.toggle("sel");
	if(hasClass){
  		if(confirm("상품 찜하기를 등록했습니다.\n찜한 상품 페이지로 이동하시겠습니까?")){
  			location.href = "${pageContext.request.contextPath}/like/product"	
		}
    }else{
      alert("상품 찜하기를 취소했습니다.");
    }
  })
});

// 스토어 찜하기 버튼 클릭 시 이벤트 발생
$(function(){
	const btnStoreLike = document.getElementById("btn-store-like");
	const btnStoreLikeSel = document.getElementById("btnStoreLike");
  
  	btnStoreLike.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 판매자 찜하기가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	location.href="<c:url value='/login'></c:url>"
	    }
	    return;
	}
	let sl_state = 1;
	$.ajax({
 		async: true,
 		type: 'GET',
 		url: "<c:url value='/like/product/${product.pr_code}/"+sl_state+"'></c:url>",
 		dataType:"json",
 		success: function(data){
 			console.log(data);
 		}
 	})
   	const hasClass = btnStoreLikeSel.classList.toggle("sel");
   	
   	if(hasClass){
   		if(confirm("판매자 찜하기를 등록했습니다.\n찜한 판매자 페이지로 이동하시겠습니까?")){
   			location.href = "${pageContext.request.contextPath}/like/seller"
   		}
    }else{
    	alert("판매자 찜하기를 취소했습니다.");
   	}
  })
});

// 공유하기
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
  const modal = document.getElementById("deadline-modal")
  function modalOn() {
    modal.style.display = "flex"
  }
  function modalOff() {
    modal.style.display = "none"
  }
  const btnModal = document.getElementById("btn-modal-deadline_open")
  btnModal.addEventListener("click", e => {
	  // 구현 완료 하면 user.me_id == '' 삭제
	 <%-- 
	  if('${user.me_id}' == '${user.st_me_id}'){
	 --%>
	  if('${user.me_id}' == ''){
		let res = alert('판매자만 마감연장이 가능합니다. \n로그인하면 모달창 열림. 수정 예정');
	  }else{
      	modalOn()
	  }
  })
  const closeBtn = modal.querySelector("#btn-modal-deadline_close")
  closeBtn.addEventListener("click", e => {
      modalOff()
  })
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
// 즉시 구매 입찰하기 페이지 이동
$(function() {
	
	const btnImme = document.getElementById("btn-imme");
  
	btnImme.addEventListener("click", function() {
	if('${user.me_id}' == ''){
	    let res = confirm('로그인한 회원만 즉시 구매가 가능합니다.\n로그인 페이지로 이동하겠습니까?');
	    if(res){
	    	location.href="<c:url value='/login'></c:url>"
		    }
		}
	})
})

// 즉시 구매 입찰하기 모달창
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

// 입찰하기 기능 구현
// 입찰하기 모달창
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
		url: '<c:url value="/auctionBid"></c:url>',
		data: JSON.stringify(price),
		dataType: "JSON",
		contentType: "application/json; charset=UTF-8",
		success: function(result){
			if(result.res){
				alert("입찰되었습니다.")
				let str = '';
				str +=
					'<div class="bid-content">' +
					'입찰 신청 가격은 ' + result.nextPrice + ' 입니다. 입찰하시겠습니까?' + 
					'</div>';
					$('.bid-content').html(str);
					$("#nextPrice").val(result.nextPrice);
			}
			else{
				alert("보유계좌에 잔액이 부족합니다.");
			}
		},
		error: function(){
			console.log("error");
		}
	});
});
// 입찰하기 모달창에서 입찰하기 버튼 클릭 시 기능 구현
function bidConfirm(){
  alert('입찰에 성공했습니다.')
  document.getElementById("bid-modal").style.display = "none";
}
$('.btn-confirm').click(function(e){
  e.preventDefault();
});







// 문의하기 모달창
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

countDownTimer('countDday', '05/31/2023 11:59 PM');

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
