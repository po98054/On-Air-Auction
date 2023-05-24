<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<style>
	* {
		margin: 0; padding: 0; text-decoration: none; color: inherit; box-sizing: border-box; font-size: inherit; font-weight: inherit; font-style: normal;
		border-collapse: collapse; border: 0; list-style: none; line-height: inherit; outline: none; word-break: inherit;
	}	
	.list-main{
		height: 1500px;
	}
	.container-main {
		width: 1248px; margin: 0 auto; position: relative; height: auto;
	}
 	/* 광고 */
 	.body-top{
        width: 100%; height: 331px;
    }
    .swiper-body {
        position: relative; height: 331px; width: 1100px; margin: 0 auto; border-radius: 20px; overflow: hidden;
    }
    
    .swiper-slide1 img {
        width: 1100px; position: absolute; top: 0; left: 0; bottom: 0; right: 0;
    }
    .swiper1 .swiper-button-next{
        background-position: -40px 0; right: 40px; height: 70px; width: 40px; background-image: url(http://static.itrcomm.com/img/main/visual_arrow.png);
        background-repeat: no-repeat; background-size: auto; margin-top: -35px;
    }
    .swiper1  .swiper-button-prev{
        height: 70px; width: 40px; background-image: url(http://static.itrcomm.com/img/main/visual_arrow.png);
        background-repeat: no-repeat; background-size: auto; margin-top: -35px; background-position: 0 0; left: 40px;
    }
    .swiper1{
     	width: auto; height: auto; position: relative;
    }
    .img-box-view{
    	border: 1px solid #ddd;
    }
    .img-box-view img{
    	width: 200px; height: 120px;
    }
    /* 메인 리스트*/
	.container1-right {
    	display: inline-block; vertical-align: top; width: 1000px;
    	margin-left: 120px; height: 450px; 
	}
	.container1-right-h2{
		font-size: 20px; color: #000; padding-top: 30px; padding-bottom: 16px;
    	border-bottom: 2px solid #1b1b1b;
	}
	.list-sub{
	  	display: none; padding-top: 8px; padding-left: 8px;
    	margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;
	}
	.hidden{
		display: none;
	}
	.item-sub{
		padding-bottom: 6px;
	}
	.link-sub{
		font-size: 13px; color: #444; letter-spacing: -0.7px;
	}
	.container-artwork-list{
		font-size: 0; border-left: 1px solid #ddd;
	}
	.container-artwork-list li{
		display: inline-block; width: 25%; text-align: center;
    	border-right: 1px solid #ddd; border-bottom: 1px solid #ddd;
	}
	.container-artwork-list li a{
		color: #333; font-size: 0.95rem; display: block; padding: 12px 0;
	}
	.container-artwork-slide{
		padding: 20px 0 20px 0; border-top: 0; 
	}
	.container-artwork-category{
		display: inline-block; width: 18%; padding-left: 30px; color: #333; vertical-align: top;
	}
	.container-artwork-category h2{
		font-size: 1.2rem; font-weight: 400; padding-top: 22px;
	}
	.container-artwork-category p{
		font-size: 14px; padding-top: 10px; color: #888;
	}
	.direct_btn{
		font-size: 14px; display: block; margin-top: 30px; color: #7f7f7f;
    	padding-left: 15px; width: 117px; height: 36px; border: 1px solid #d2d2d2;
    	line-height: 34px; border-radius: 6px;
	}
	.container-artwork-swiper{
		display: inline-block; width: 82%;
	}
	.container-artwork-swiper-box{
		margin: 0 30px; height: 170px;
	} 
	.l-area{
		    width: 22%; display: inline-block; padding: 30px 0 0 25px; background: #fff;
	}
	.r-area{
		width: 77%; float: right;
	}
	.money{
		padding-top: 20px; color: #131a22; font-size: 15px; font-weight: 600;
	}
	.mt30{
		margin-top:30px;	
	}
	.product{
		text-align: center;
	}
    /* 스와이퍼 */
    .swiper {
     	width: auto; height: auto; position: relative;
    }
    .swiper .swiper-slide {
        height: 300px; display: flex; justify-content: center;
        align-items: center; font-size: 24px; font-weight: bold;
		display: flex; flex-direction: column; align-items: center;
    }
    .swiper-button-next{
        background-position: -26px 0; right: 0; height: 42px; width: 26px; background-image: url(http://static.itrcomm.com/img/sub/swiper_arrow.png);
        background-repeat: no-repeat; background-size: auto; left: auto; position: absolute; top: 50%;
		--swiper-navigation-color: transparent;
    }
     .swiper-button-prev{
        background-position: 0 0; left: 0; height: 42px; width: 26px; background-image: url(http://static.itrcomm.com/img/sub/swiper_arrow.png);
        background-repeat: no-repeat; background-size: auto; right: auto; position: absolute; top: 50%;
		--swiper-navigation-color: transparent;
    }
	</style>
</head>
<body>
	<script src="https://kit.fontawesome.com/e411ce92be.js" crossorigin="anonymous"></script>

	<div class="list-main">
		<div class="container-main">
			 <div class="body-top">
	            <div class="swiper-body">
	                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper1">
	                    <div class="swiper-wrapper">
	                        <div class="swiper-slide">
	                            <img src="http://static.itrcomm.com/img/main/banner/126068177_1675040776.jpg" />
	                        </div>
	                        <div class="swiper-slide">
	                            <img src="http://static.itrcomm.com/img/main/banner/1037101639_1680250847.jpg" />
	                        </div>
	                    </div>
	                    <div class="swiper-button-next" role="button" tabindex="0"></div>
	                    <div class="swiper-button-prev"></div>
	                </div>
	            </div>
	        </div>
			<div class="container1-right">
				<div>
					<h2 class="container1-right-h2" style="clear:both">일반 경매</h2>
				</div>
				<div class="container-artwork-slide">
					<div class="container-artwork-category l-area">
							<h2>일반 경매</h2>
							<p>카테고리 인기상품</p>
							<a href="#" class="direct_btn">전체보기<span></span></a>
					</div>
					<div class="right-main r-area">
                       	 <table class="table table-hover"> 
                        	 <thead>
	                         	 	<tr>
	                         	 		<c:forEach items="${files}" var="file">
				  							<c:choose>
						      					<c:when test="${file.fi_num == 1}">
							       					 <td>
											        	<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto" style="margin-right: 30px;"  >
											      	</td>
						      					</c:when>
						     					<c:when test="${file.fi_num == 4}">
											        <td>
											        	<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto" style="margin-right: 30px;">
											      	</td>
										      	</c:when>
										      	<c:when test="${file.fi_num == 5}">
											        <td>
											        	<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto">
											      	</td>
										      	</c:when>
										    </c:choose>
										</c:forEach>
									</tr>	
                        	 </thead>
                        	 <tbody class="product">
	                         	 <tr>
							          <c:forEach items="${list}" var="p">
							              <c:choose>
							                      <c:when test="${p.pr_code == 1}">
								                           <td>
								                               <a href="<c:url value='/product/detail/${p.pr_code}'></c:url>">
									                              <h2 class="h2"> ${p.pr_name}</h2> 
							                          			</a>
									                       </td>
							                      </c:when>
							                      <c:when test="${p.pr_code == 2}">
							                              <td>
								                              <a href="<c:url value='/product/detail/${p.pr_code}'></c:url>">
									                              <h2 class="h2"> ${p.pr_name}</h2> 
							                          		  </a>
							                              </td>
							                      </c:when>
							                      <c:when test="${p.pr_code == 3}">
								                           <td>
									                           <a href="<c:url value='/product/detail/${p.pr_code}'></c:url>">
									                              <h2 class="h2"> ${p.pr_name}</h2> 
							                          			</a> 
									                       </td>
							                      </c:when>
							                 </c:choose>
							          </c:forEach>
							       </tr>
					      	</tbody>
					   </table>  			
	                </div>
				</div>
			</div>
			<div class="container1-right mt30">
				<div>
					<h2 class="container1-right-h2" style="clear:both">실시간 경매</h2>
				</div>
				<div class="container-artwork-slide">
					<div class="container-artwork-category l-area">
							<h2>실시간 경매</h2>
							<p>카테고리 인기상품</p>
							<a href="#" class="direct_btn">전체보기<span></span></a>
					</div>
					<div class="container-artwork-swiper r-area">
						<div class="container-artwork-swiper-box">
                            <div class="swiper" style="--swiper-navigation-color: none;"  >
                                <div class="swiper-wrapper">
                                  <div class="swiper-slide">
										<div class="img-box-view">       
											<a href="<c:url value='/main/detail/${vo.pr_code}'></c:url>">
												<img src="http://static.itrcomm.com/img/main/promotion/363620230_1680590900.jpg" alt="">
											</a>             
										</div>
										<div class="money">뉴발란스</div>
								  </div>
                                   <div class="swiper-slide">
										<div class="img-box-view">       
											<a href="<c:url value='/main/detail/${vo.pr_code}'></c:url>">
												<img src="http://static.itrcomm.com/img/main/promotion/576305663_1680590922.jpg" alt="">
											</a>             
										</div>
										<div class="money">삼성</div>
								  </div>
                                  <div class="swiper-slide">
                                  		<div class="img-box-view">       
											<a href="<c:url value='/main/detail/${vo.pr_code}'></c:url>">
												<img src="http://static.itrcomm.com/img/main/promotion/1895107451_1680591555.jpg" alt="">
											</a>             
										</div>
										<div class="money">다이슨</div></div>
                                  <div class="swiper-slide">
                                  		<div class="img-box-view">       
											<a href="<c:url value='/main/detail/${vo.pr_code}'></c:url>">
												<img src="http://static.itrcomm.com/img/main/promotion/1233931089_1680591637.jpg" alt="">
											</a>             
										</div>
										<div class="money">아디다스</div>
                                  </div>
                                  <div class="swiper-slide">
                                  		<div class="img-box-view">       
											<a href="<c:url value='/main/detail/${vo.pr_code}'></c:url>">
												<img src="http://static.itrcomm.com/img/main/promotion/96850995_1680590866.jpg" alt="">
											</a>             
										</div>
										<div class="money">챔피언</div>
                                  </div>
                                </div>
                                <div class="swiper-button-next"></div>
                   				<div class="swiper-button-prev"></div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>
<script>
   new Swiper('.swiper', {
		  loop: true,
		  slidesPerView: 3,
		  spaceBetween: 10,
		  centeredSlides: true,
		  pagination: {
		    el: '.swiper-pagination',
		    clickable: true
		  },
		  navigation: {
		    prevEl: '.swiper-button-prev',
		    nextEl: '.swiper-button-next'
		  }
		})
 </script>
 <script>
	 var swiper = new Swiper(".swiper1", {
	     navigation: {
	         nextEl: ".swiper-button-next",
	         prevEl: ".swiper-button-prev",
	     }
	 });
 </script>
