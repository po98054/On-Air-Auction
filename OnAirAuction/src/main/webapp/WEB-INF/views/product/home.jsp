<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">
<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>
<script src="https://kit.fontawesome.com/e411ce92be.js" crossorigin="anonymous"></script>

<style>
	/* 1번 제목*/
    .container3{
       height: 1300px;
    }
    .container3-box1{
        font-size: 13px; color: #555; margin: 30px 0 50px 0;
    }
    .container3-box1-box{
        width: 1000px; margin-left: auto; margin-right: auto;
    }
    .container3-box1-row:first-child {
        padding-left: 20px;
    }
    .fa-house{
        margin-left: -20px; width: 20px;
    }
    .container3-box1-row > a{ 
        color: #337ab7; text-decoration: none; background-color: transparent;
    }
    .fcBlue{
        color: #114da5 !important;
    }
    strong{
        font-weight: bold;
    }
    /* 2번 카테고리 선택 */
    .container3-box2::after{
        clear: both; content: ''; display: block;
    }
    .container3-box2-box{
        width: 1000px; margin-left: auto; margin-right: auto;
    }
    .containerbox2-category, container-box3-category{
        margin-top: 10px !important;
    }
    .subTitle-h3{
      background: url(https://www.kobay.co.kr/kobay/images/subTitle-bullet.png) no-repeat left center; background-size: auto 80% !important;
    	padding-left: 24px; font-weight: bold; margin-bottom: 30px; margin-top: 0; margin-right: 10px;
    }
    h3{
        font-size: 24px;
    }
    .container-box2-list{
        margin-left: -5px; margin-right: -5px; margin-top: 20px;
    }
    .container-box2-list > div{
        float: left; width: 23%; padding: 0 10px;
    }
    .container-box2-list > div > select{
        width: 100%; font-size: 14px; padding: 0;
    }
    .form-control{
        display: block; width: 100%; height: 34px; padding: 6px 12px; font-size: 14px;
        line-height: 1.42857143; color: #555; background-color: #fff; background-image: none;
        border: 1px solid #dbdbdb; vertical-align: baseline;
    }
    .container-box2-list > div > select option{
        padding: 10px 15px; word-break: break-all;
    }
    option {
        font-weight: normal; display: block; white-space: nowrap; min-height: 1.2em; padding: 0px 2px 1px;
    }
    .container-box2-list::after{
        clear: both; content: ''; display: block; 
    }
    /* 3번 물품 정보 */
    .container3-box3-box{
        width: 1000px; margin-left: auto; margin-right: auto; margin-top: 40px !important;
    }
    table{
        background-color: transparent;
    }
    table{
        border-spacing: 0; border-collapse: collapse;
    }
    table{
        display: table; border-collapse: separate; box-sizing: border-box;
        text-indent: initial; border-spacing: 2px; border-color: grey;
    }
    colgroup {
        display: table-column-group;
    }
    col{
        display: table-column;
    }
    tbody {
        display: table-row-group; vertical-align: middle; border-color: inherit;
    }
    tr{
        display: table-row; vertical-align: inherit; border-color: inherit;
    }
    button, input, optgroup, select, textarea {
        margin: 0; font: inherit; color: inherit;
    }
    * {
        -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;
    }
    .container3-box3-th {
        background: #f8f8f8; color: #444444; font-weight: bold; height: 45px;
        text-align: center; width: 200px; padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd; font-size: 15px;
    }
    .container3-box3-th::before, .container4-box4-th::before {
        content: "* "; color: #114da5; 
    }
    .container3-box3-td{
        font-size: 14px; padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
        border-left: 1px solid #ddd; height: 45px; border-right: 1px solid #ddd;
    }
    .container3-box3-th, .container3-box3-td
    {
		padding: 7px 25px; vertical-align: middle; border-bottom: 1px solid #ddd;
		border-left: 1px solid #ddd; height: 45px;
    }
    .container3-box3-list > table{
        width: 100%; border-top: 1px solid #111 !important;
    }
   .container3-textarea{
        height: 300px; position: relative; margin: 0; padding: 0; width: 100%;
   }
   .ct{
        text-align: center; 
   }
   .container3-box3-bts{
        height: 30px; margin-top: 10px !important;
   }
   .container3-box3-bts > div::after{
        clear: both; content: ''; display: block; 
   }
   .select-td{
        width: 450px;
   }
   /* 첨부 파일 */   
   .file-box{
        width : 150px; height : 200px;
        border : 1px solid #ddd; font-size : 50px;
        text-align: center; line-height: 200px; font-weight: 300;
        border-radius: 5px; float: left; cursor: pointer;
    }
    #image>div::after{
        display: block; content: ''; clear: both;
    }
    #image [type=file]{
        display: none;
    }
    #image>div>div{
        float:left; margin-right: 20px;
    }
    .camera{
        font-size: 30px; margin-top: 80px;
    }
    .btn-submit{
			width: 1000px; margin-left: auto; margin-right: auto; margin-top: 40px !important;
	}
	.btn-blue{
		background: #114da5; border-radius: 10px; float: right; color: #fff;
		font-size: 15px !important; padding: 10px 16px; width: 10% !important;
	}
  
</style>
<body>
	<form action=/onAirAuction/savePurchase method="post" enctype="multipart/form-data">
	 	<div class="container3">
			<div class="container3-box1">
				<div class="container3-box1-box">
					<div class="container3-box1-row">
							<i class="fa-solid fa-house"></i>
							<a href="/">홈</a> 
							<i class="fa-solid fa-greater-than"></i>
							<a href="#"> 물품등록 </a>
							<i class="fa-solid fa-greater-than"></i>
							<strong class="fcBlue">온라인 물품등록</strong>
					</div>
					<div class="container3-box1-title">
							<h2>온라인 물품등록</h2>
					</div>	
				</div>
			</div>
			<div class="container3-box2">
				<div class="container3-box2-box">
					<div class="container-box2-category">
						<h3 class="subTitle-h3">카테고리 선택</h3>
					</div>
					<div class="container-box2-list">
						<div>
							<select class="form-control" id="category1" size="6" style="height:250px;" onchange="changeFn()"  name="plc_name">
	                               <option value="category1-1">의류/신발/가방</option>
	                               <option value="category1-2">식품</option>
	                               <option value="category1-3">생활잡화</option>
	                               <option value="category1-4">가전</option>
							</select>
						</div>
						<div>
	                        <select class="form-control" id="category2" size="6" style="height:250px; display: none;" onchange="changeRemove()" onchange="changeFn()"  name="pmc_name">
	                               <option value="category2-1" class="category1-1">여성의류</option>
	                               <option value="category2-2" class="category1-1">남성의류</option>
	                               <option value="category2-3" class="category1-1">신발</option>
	                               <option value="category2-4" class="category1-2">신선식품</option>
	                               <option value="category2-5" class="category1-2">건강식품</option>
	                               <option value="category2-6" class="category1-2">커피/음료</option>
	                               <option value="category2-7" class="category1-3">생활용품</option>
	                               <option value="category2-8" class="category1-3">주방용품</option>
	                               <option value="category2-9" class="category1-3">생필품</option>
	                               <option value="category2-10" class="category1-4">영상가전</option>
	                               <option value="category2-11" class="category1-4">노트북/PC</option>
	                               <option value="category2-12" class="category1-4">모니터/프린터</option>
	                           </select>
						</div>
						<div>
	                        <select class="form-control" id="category3" size="6" style="height: 250px; display: none;" onchange="changeFn()"  name="psc_name">
	                               <option value="category3-1" class="category2-1">셔츠/블라우스</option>
	                               <option value="category3-2" class="category2-1">가디건</option>
	                               <option value="category3-3" class="category2-1">원피스</option>
	                               <option value="category3-4" class="category2-2">드레스셔츠</option>
	                               <option value="category3-5" class="category2-2">긴팔티셔츠</option>
	                               <option value="category3-6" class="category2-2">캐주얼셔츠</option>
	                               <option value="category3-7" class="category2-3">오픈슈즈</option>
	                               <option value="category3-8" class="category2-3">부츠</option>
	                               <option value="category3-9" class="category2-3">샌들</option>
	                               <option value="category3-10" class="category2-4">쌀</option>
	                               <option value="category3-11" class="category2-4">과일</option>
	                               <option value="category3-12" class="category2-4">해산물</option>
	                               <option value="category3-13" class="category2-5">홍삼/인삼</option>
	                               <option value="category3-14" class="category2-5">영양제</option>
	                               <option value="category3-15" class="category2-5">건강즙</option>
	                               <option value="category3-16" class="category2-6">탄산/청량음료</option>
	                               <option value="category3-17" class="category2-6">주스/과즙음료</option>
	                               <option value="category3-18" class="category2-6">우유/두유</option>
	                               <option value="category3-19" class="category2-7">욕실인테리어</option>
	                               <option value="category3-20" class="category2-7">청소용품</option>
	                               <option value="category3-21" class="category2-7">세탁용품</option>
	                               <option value="category3-22" class="category2-8">냄비/솥</option>
	                               <option value="category3-23" class="category2-8">프라이팬</option>
	                               <option value="category3-24" class="category2-8">식기</option>
	                               <option value="category3-25" class="category2-9">세제/세정제</option>
	                               <option value="category3-26" class="category2-9">살충제/방충제</option>
	                               <option value="category3-27" class="category2-9">탈취/제습</option>
	                               <option value="category3-28" class="category2-10">TV</option>
	                               <option value="category3-29" class="category2-10">프로젝터</option>
	                               <option value="category3-30" class="category2-10">영상플레이어</option>
	                               <option value="category3-31" class="category2-11">노트북</option>
	                               <option value="category3-32" class="category2-11">노트북용품</option>
	                               <option value="category3-33" class="category2-11">PC</option>
	                               <option value="category3-34" class="category2-12">스캐너</option>
	                               <option value="category3-35" class="category2-12">모니터</option>
	                               <option value="category3-36" class="category2-12">프린터</option>
	                           </select>
						</div>
	                    <div>
	                        <select class="form-control" id="category4" size="6" style="height: 250px; display: none;"  onchange="changeFn()"  name="pc_name">
	                               <option value="category4-1" class="category3-1">레이스</option>
	                               <option value="category4-2" class="category3-1">스프라이프셔츠</option>
	                               <option value="category4-3" class="category3-1">솔리드셔츠</option>
	                               <option value="category4-4" class="category3-2">미니가디건</option>
	                               <option value="category4-5" class="category3-2">롱가디건</option>
	                               <option value="category4-6" class="category3-2">루즈핏가디언</option>
	                               <option value="category4-7" class="category3-3">면원피스</option>
	                               <option value="category4-8" class="category3-3">럭셔리원피스</option>
	                               <option value="category4-9" class="category3-3">니모원피스</option>
	                               <option value="category4-10" class="category3-4">솔리드셔츠</option>
	                               <option value="category4-11" class="category3-4">스트라이프셔츠</option>
	                               <option value="category4-12" class="category3-4">프린트/체크셔츠</option>
	                               <option value="category4-13" class="category3-5">라운드넥티셔츠</option>
	                               <option value="category4-14" class="category3-5">브이넥티셔츠</option>
	                               <option value="category4-15" class="category3-5">카라넥티셔츠</option>
	                               <option value="category4-16" class="category3-6">솔리드셔츠</option>
	                               <option value="category4-16" class="category3-6">스트라이프셔츠</option>
	                               <option value="category4-17" class="category3-6">체크/프린트셔츠</option>
	                               <option value="category4-18" class="category3-7">하이힐</option>
	                               <option value="category4-19" class="category3-7">웨딩/파티슈즈</option>
	                               <option value="category4-20" class="category3-7">킬힐</option>
	                               <option value="category4-21" class="category3-8">레인부츠</option>
	                               <option value="category4-22" class="category3-8">니트부츠</option>
	                               <option value="category4-23" class="category3-8">털부츠</option>
	                               <option value="category4-24" class="category3-9">웨지샌들</option>
	                               <option value="category4-25" class="category3-9">슬리퍼</option>
	                               <option value="category4-26" class="category3-9">플랫샌들</option>
	                               <option value="category4-27" class="category3-10">백미</option>
	                               <option value="category4-28" class="category3-10">찹쌀</option>
	                               <option value="category4-29" class="category3-10">현미</option>
	                               <option value="category4-30" class="category3-11">사과</option>
	                               <option value="category4-31" class="category3-11">배</option>
	                               <option value="category4-32" class="category3-11">과일세트</option>
	                               <option value="category4-33" class="category3-12">새우</option>
	                               <option value="category4-34" class="category3-12">전복</option>
	                               <option value="category4-35" class="category3-12">오징어</option>
	                               <option value="category4-36" class="category3-13">수삼</option>
	                               <option value="category4-37" class="category3-13">홍삼</option>
	                               <option value="category4-38" class="category3-13">산삼</option>
	                               <option value="category4-39" class="category3-14">스쿠알렌</option>
	                               <option value="category4-40" class="category3-14">쏘팔메토</option>
	                               <option value="category4-41" class="category3-14">초유</option>
	                               <option value="category4-42" class="category3-15">양파즙</option>
	                               <option value="category4-43" class="category3-15">마늘즙</option>
	                               <option value="category4-44" class="category3-15">복분자즙</option>
	                               <option value="category4-45" class="category3-16">콜라</option>
	                               <option value="category4-46" class="category3-16">사이다</option>
	                               <option value="category4-47" class="category3-16">무알콜음료</option>
	                               <option value="category4-48" class="category3-17">매실주스</option>
	                               <option value="category4-49" class="category3-17">오렌지주스</option>
	                               <option value="category4-50" class="category3-17">토마토주스</option>
	                               <option value="category4-51" class="category3-18">우유</option>
	                               <option value="category4-52" class="category3-18">요구르트</option>
	                               <option value="category4-53" class="category3-18">두유</option>
	                               <option value="category4-54" class="category3-19">욕실선반</option>
	                               <option value="category4-55" class="category3-19">욕실거울</option>
	                               <option value="category4-56" class="category3-19">욕실수납장</option>
	                               <option value="category4-57" class="category3-20">매직블럭</option>
	                               <option value="category4-58" class="category3-20">청소솔</option>
	                               <option value="category4-59" class="category3-20">걸레</option>
	                               <option value="category4-60" class="category3-21">빨래바구니</option>
	                               <option value="category4-61" class="category3-21">빨래판</option>
	                               <option value="category4-62" class="category3-21">빨래집게</option>
	                               <option value="category4-63" class="category3-22">냄비</option>
	                               <option value="category4-64" class="category3-22">압력솥</option>
	                               <option value="category4-65" class="category3-22">가마솥</option>
	                               <option value="category4-66" class="category3-23">일반프라이팬</option>
	                               <option value="category4-67" class="category3-23">구이팬</option>
	                               <option value="category4-68" class="category3-23">양면팬</option>
	                               <option value="category4-69" class="category3-24">접시</option>
	                               <option value="category4-70" class="category3-24">찬기</option>
	                               <option value="category4-71" class="category3-24">공기</option>
	                               <option value="category4-72" class="category3-25">살균소독제</option>
	                               <option value="category4-73" class="category3-25">욕실세정제</option>
	                               <option value="category4-74" class="category3-25">곰팡이제거제</option>
	                               <option value="category4-75" class="category3-26">살충제</option>
	                               <option value="category4-76" class="category3-26">방충제</option>
	                               <option value="category4-77" class="category3-27">섬유탈취제</option>
	                               <option value="category4-78" class="category3-27">옷장탈취제</option>
	                               <option value="category4-79" class="category3-27">신발탈취제</option>
	                               <option value="category4-80" class="category3-28">TV</option>
	                               <option value="category4-81" class="category3-28">해외직구TV</option>
	                               <option value="category4-82" class="category3-29">프로젝터램프</option>
	                               <option value="category4-83" class="category3-29">프로젝터삼각대</option>
	                               <option value="category4-84" class="category3-29">프로젝터브래킷</option>
	                               <option value="category4-85" class="category3-30">DVD플레이어</option>
	                               <option value="category4-86" class="category3-30">셋톱박스</option>
	                               <option value="category4-87" class="category3-30">VTR</option>
	                               <option value="category4-88" class="category3-31">노트북</option>
	                               <option value="category4-89" class="category3-32">노트북보호필름</option>
	                               <option value="category4-90" class="category3-32">노트북배터리</option>
	                               <option value="category4-91" class="category3-32">노트북가방</option>
	                               <option value="category4-92" class="category3-33">조립PC</option>
	                               <option value="category4-93" class="category3-33">올인원PC</option>
	                               <option value="category4-94" class="category3-33">미니PC</option>
	                               <option value="category4-95" class="category3-34">명함스캐너</option>
	                               <option value="category4-96" class="category3-34">바코드스캐너</option>
	                               <option value="category4-97" class="category3-34">문서스캐너</option>
	                               <option value="category4-98" class="category3-35">모니터</option>
	                               <option value="category4-99" class="category3-35">DID</option>
	                               <option value="category4-100" class="category3-35">키오스크</option>
	                               <option value="category4-101" class="category3-36">3D프린터</option>
	                               <option value="category4-102" class="category3-36">플로터</option>
	                               <option value="category4-103" class="category3-36">포토프린터</option>
	                           </select>
						</div>
					</div>	
				</div>    
			</div>
		    <div class="container3-box3">
		    	 <div class="container3-box3-box">
		    	 	<div class="container-box3-category">
	                    <h3 class="subTitle-h3">물품 정보</h3>
	                </div>
	                <div class="container3-box3-list">
                		<table>
               				<tr>
								<td class="container3-box3-th">상품명</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control" id="name" name="pr_name">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품소개</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="intro" name="pr_intro">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품상태</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="condition" name="pr_condition">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상세정보</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="detail" name="pr_detail">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품위치</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="location" name="pr_location">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">경매시작가격</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="startprice" name="pr_startprice">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">원산지</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="origin" name="pr_origin">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">상품크기</td>
								<td colspan="2" class="container3-box3-td">
										<input type="text" class="form-control"  id="size" name="pr_size">
								</td>
							</tr>
							<tr>
								<td class="container3-box3-th">이미지</td>
                                <td colspan="3" class="container3-box3-td">
                                    <div id="image">
                                        <div class="form-group mt-3">
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                            <div>
                                                <div class="file-box"><i class="fa-solid fa-camera camera"></i></div>
                                                <input type="file" class="form-control" name="files" accept="image/*" onchange="readURL(this);">
                                                <img class="preview" height="200" width="auto">
                                            </div>
                                        </div>
                                    </div> 
                           	 	</td>
							</tr>
						</table>
						<div class="btn-submit">
							<button type="submit" class="btn-blue">등록하기</button>			
						</div>
                	</div>	
		    	 </div>   
		    </div>
		</div>
	</form>
</body>
<script>
$('form').submit(function(){
	let pr_name = $('[name=pr_name]').val();
	if(pr_name.trim().length  == 0){
		alert('상품명을 입력하세요.');
		$('[name=pr_name]').focus();
		return false;
	}
	let pr_intro = $('[name=pr_intro]').val();
	if(pr_intro.trim().length  == 0){
		alert('상품소개를 입력하세요.');
		$('[name=pr_intro]').focus();
		return false;
	}
	let pr_condition = $('[name=pr_condition]').val();
	if(pr_condition.trim().length  == 0){
		alert('상품상태를 입력하세요.');
		$('[name=pr_condition]').focus();
		return false;
	}
	let pr_detail = $('[name=pr_detail]').val();
	if(pr_detail.trim().length  == 0){
		alert('상세정보를 입력하세요.');
		$('[name=pr_detail]').focus();
		return false;
	}	
	let pr_location = $('[name=pr_location]').val();
	if(pr_location.trim().length  == 0){
		alert('상품위치를 입력하세요.');
		$('[name=pr_location]').focus();
		return false;
	}
	let pr_startprice = $('[name=pr_startprice]').val();
	if(pr_startprice.trim().length  == 0){
		alert('경매시작가격을 입력하세요.');
		$('[name=pr_startprice]').focus();
		return false;
	}
	let pr_origin = $('[name=pr_origin]').val();
	if(pr_origin.trim().length  == 0){
		alert('원산지를 입력하세요.');
		$('[name=pr_origin]').focus();
		return false;
	}
	let pr_size = $('[name=pr_size]').val();
	if(pr_size.trim().length  == 0){
		alert('상품크기를 입력하세요.');
		$('[name=pr_size]').focus();
		return false;
	}
	
	const images = image.querySelectorAll('input[type=file]');
	  let imageSelected = false;
	  
	  for (let i = 0; i < images.length; i++) {
	    if (images[i].files.length > 0) {
	      imageSelected = true;
	      break;
	    }
	  }
	  if (!imageSelected) {
	    alert('이미지를 1개 이상 선택하세요.');
	    return false;
	  }
	  // 유효성 검사를 통과한 경우에는 true를 반환하여 폼을 제출합니다.
	  return true;
	
});

	$('.file-box, .preview').click(function(){
	    $(this).siblings('input').click();
	});
	
	function readURL(input){
	    if(!input.files || !input.files[0]){
	        input.nextElementSibling.src ='';
	        input.previousElementSibling.style.display = 'block';
	        return;
	    }
	    let reader = new FileReader();
	    reader.onload = function(e){
	        input.previousElementSibling.style.display = 'none';
	        input.nextElementSibling.src = e.target.result;
	    }
	    reader.readAsDataURL(input.files[0]);
	}
</script>

<script>

    var category1 = document.getElementById("category1");
    var category2 = document.getElementById("category2");
    var category3 = document.getElementById("category3");
    var category4 = document.getElementById("category4");

    category1.addEventListener("change", function() {
    if (this.value == "") {
        category2.style.display = "none";
        category3.style.display = "none";
        category4.style.display = "none";
    } else {
        category2.style.display = "block";
        category3.style.display = "none";
        category4.style.display = "none";
        // 중분류의 옵션 중 선택한 대분류의 클래스와 일치하는 것만 보여줌
        for (var i = 0; i < category2.options.length; i++) {
        if (category2.options[i].classList.contains(this.value)) {
            category2.options[i].style.display = "block";
        } else {
            category2.options[i].style.display = "none";
        }
        }
    }
    });
    
    category2.addEventListener("change", function() {
    if (this.value == "") {
        category3.style.display = "none";
    } else {
        category3.style.display = "block";
        // 소분류의 옵션 중 선택한 중분류의 클래스와 일치하는 것만 보여줌
        for (var i = 0; i < category3.options.length; i++) {
            if (category3.options[i].classList.contains(this.value)) {
                category3.options[i].style.display = "block";
            } else {
                category3.options[i].style.display = "none";
            }
        }
    }
    });
    
    category3.addEventListener("change", function() {
    if (this.value == "") {
        category4.style.display = "none";
    } else {
        category4.style.display = "block";
        // 소분류의 옵션 중 선택한 중분류의 클래스와 일치하는 것만 보여줌
        for (var i = 0; i < category4.options.length; i++) {
        if (category4.options[i].classList.contains(this.value)) {
            category4.options[i].style.display = "block";
        } else {
            category4.options[i].style.display = "none";
        }
        }
    }
    });
    
    function changeRemove(){
        $('#category4').hide();
    }
</script>

<script>
function changeFn(){
	var plc_name  = document.getElementById('category1');
	var option = select.options[select.selectedIndex];
	document.getElementById('text').value = option.text;
	
	var pmc_name  = document.getElementById('category2');
	var option = select.options[select.selectedIndex];
	document.getElementById('text').value = option.text;
	
	var psc_name  = document.getElementById('category3');
	var option = select.options[select.selectedIndex];
	document.getElementById('text').value = option.text;
	
	var pc_name  = document.getElementById('category4');
	var option = select.options[select.selectedIndex];
	document.getElementById('text').value = option.text;
};
</script>
