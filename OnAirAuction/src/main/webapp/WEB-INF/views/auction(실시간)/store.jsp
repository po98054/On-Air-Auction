<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스토어</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
</head>
<style>
.store-container{
    width: 1900px;
}
.header {
	background-color: #333;
	color: #fff;
	padding: 10px;
}


.footer {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
    height: 60px;
}

.product-intro{
    float:left;
    width: 20%;
    margin-top: 50px;
    margin-bottom: 50px;
    border: 2px solid black;
    border-radius: 10px;
    height: 600px;
}
.auction-product{
    float: right;
    margin-top: 50px;
    margin-bottom: 50px;
    margin-right: 10px;
    width: 75%;
    text-align: center;
}

.container::after{
    display: block; clear: both; content: '';
}
</style>
<body>
    <div class="store-container">
        <header class="header">
            <h1>Seller Store</h1>
        </header>
        <div class="container">
            <div class="product-intro">
                이 곳은 seller회원님의 개인 스토어 입니다.
                
            </div>
            <div clase="product-table">
                <table class="auction-product">
                <thead>
                    <tr>
                    <th>번호</th>
                    <th>상품 이름</th>
                    <th>상품 상태</th>
                    <th>경매 상태</th>
                    <th>경매 시작 가격</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="pr" varStatus="vs">
                    <tr>
                        <td>number</td>
                        <td>image</td>
                        <td>${pr.pr_name}</td>
                        <td>${pr.pr_condition}</td>
                        <td>${pr.pr_state}</td>
                        <td>${pr.pr_startprice}</td>
                    </tr>
                    </c:forEach>
                </tbody>
                </table>
            </div>
        </div>
        <footer class="footer">
        </footer>
    </div>
    
    
    
    <script src="https://code.jquery.com/jquery-latest.min.js"></script><!--제이쿼리를 쓰기 위해 스크립트 참조-->
    
    <script>
        function mouseOver(obj){ //css에서 :hover를 이용해서 표현할 수도 있음.
            obj.style.fontSize = "20px"
            obj.style.fontWeight = "bold"
        }
        function mouseOut(obj){
            obj.style.fontSize =""
            obj.style.fontWeight =""
        }
        function mouseOver1(obj){
            obj.style.fontWeight = "bold"
        }
        function mouseOut1(obj){
            obj.style.fontWeight =""
        }
        function mouseOver2(obj){
            obj.style.color = "grey"
        }
        function mouseOut2(obj){
            obj.style.color =""
        }
    </script>
</body>
</html>