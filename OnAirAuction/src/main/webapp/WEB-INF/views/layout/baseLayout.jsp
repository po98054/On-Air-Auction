<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>On Air Auction</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
</head>
<style>
   *{
    font-family: Arial, Helvetica, sans-serif;
        margin: 0; padding: 0; text-decoration: none;
        font-size: inherit; border-collapse: collapse; line-height: inherit;
        word-break: inherit; list-style: none;
    }
    .containertoo{
        text-align: center; box-sizing: border-box; background:#464646;
        color: #fff; font-size: 13px; padding: 8px; line-height: 1.42857143;
        width: 1900px; 
    }
    
    .list-unstyled{
        margin-top: 0; margin-bottom: 0; padding-left: 0; list-style: none; 
    }
    .timer{
        background:url(	https://www.kobay.co.kr/kobay/images/common/icon-timer.gif) no-repeat 0px center;
        padding-left: 25px;
    }
    .comList ul li{
        float: left; margin-right: 10px; padding: 5px 0;
    }
    .comList2{display: table-cell; vertical-align: middle; float: right;}
    .comList2 ul{
        list-style: none; margin-bottom: 0; 
    }
    .list-unstyled .timer span{
        margin-left: 30px;
    }
    .clearFix{
        margin-right: 0;
    }
    .clearFix::after{
        clear: both; content: ''; display: block;
    }
    .clearFix p a{
        color: #fff;
    }
    .comList ul li p{
        float: left; margin: 0 0; padding: 0 12px;
    }
    .lock::before{
        content: '\26BF'; margin-right: 3px;
    }
    .comList2 ul li{
        float: left; padding: 5px 0;
    }
    .comList2 ul li p{
        background: none; float: left; margin: 0; padding: 0 12px;
    }
    .container-inner2{
        margin: 0 20px 0 20px; height: 20px; border: 1px solid blanchedalmond;
    }
    .container2{
        border-bottom: 1px solid black; position: relative;
        width: 1900px; 
    }
    .container2 div{
        float:left;
    }
    .container2 ul{
        position: absolute; left: 150px; height: 70px;
    }
    .container2 ul li{
        list-style: none; float: left; margin-left: 5px; height: 70px;
    }
    .container2::after{clear: both; display: block; content: '';}
    .container2 img{ width: 150px; height: 70px; object-fit: cover;}
    .container2 li a{
        height: 70px; line-height: 70px; padding: 0 15px; font-size: 16px; font-weight: 500; color: #111; 
        text-decoration: none;
    }
    .addProduct{
        margin-top: 25px; border-radius: 10px; background: #114da5;
        color: #fff; padding: 4px 8px; cursor: pointer; border: 0;
    }
    .comList2 .list-unstyled .clearFix a{
        text-decoration: none;
    }
    .smallList1 select{
        margin: 30px 0 0 50px;
    }
    .smallList2 input{
         margin-left: 5px;
    }
    .smallList2 button{
        margin-top: 22px; padding: 5px 10px; border-radius: 10px; background: black;
        color: #fff; cursor: pointer;
    }
    .containertoo::after{
        clear: both; display: block; content: '';
    }
    .bottomCustomer{
        box-sizing: border-box; line-height: 1.42857143; font-size: 14px;
        background: #f7f7f7; border-top: 1px solid black;
    }
    .bottomCustomer1{
        padding: 25px 0; display: table; margin-left: auto; margin-right: 200px;
    }
    .bottomCustomer1::after{
        clear: both; display: block; content: '';
    }
    .bottomCustomer1-1{
        width: 500px; display: table-cell; 
    }
    .bottomCustomer1-1 img{
         text-align: center;
    }
    .bottomCustomer1-2{
        display: table-cell; float: right;
    }
    .bottomCustomer1-2 a{
        text-align: center; padding-top: 50px; margin-bottom: 15px;
        color: #555; width: 84pt; display: inline-block; 
    }
    .bottomCustomer1-2 a:nth-child(1){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion1.gif) no-repeat center top;
    }
    .bottomCustomer1-2 a:nth-child(2){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion3.gif) no-repeat center top;
    }
    .bottomCustomer1-2 a:nth-child(3){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion2.gif) no-repeat center top;
    }
    .bottomCustomer1-2 a:nth-child(4){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion4.gif) no-repeat center top;
    }
    .bottomCustomer1-2 a:nth-child(5){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion5.gif) no-repeat center top;
    }
    .bottomCustomer1-2 a:nth-child(6){
        background: url(http://www.kobay.co.kr/kobay/images/common/foot-quick-cion6.gif) no-repeat center top;
    }
    .bottomCensebar{
        background: #e6e6e6; box-sizing: border-box; line-height: 1.42857143;
    }
    .bottomCensebar1{
        margin-left: auto; margin-right: auto; height: 63px; background: #e6e6e6;
    }
    .bottomCensebar1-1{
        float: left;
    }
    .bottomCensebar1::after{
        clear: both; display: block; content: '';
    }
    .bottomCopy{
        box-sizing: border-box; line-height: 1.42857143;
    }
    .bottomCopy1{
        margin-left: auto; margin-right: auto; height: 57.2px;
        background: #f7f7f7;
        }
    .bottomCopy1-1{
         font-size: 14px; margin-left: 20px;
        box-sizing: border-box; float: right;
    }
    .bottomCopy1-1 a{
        color: #111; font-weight: bold;  font-size: 14px;
        padding-right: 15px;  text-decoration: none; line-height: 54px;
        text-align: center;
        
    }
    .bottomCopy1::after{
        clear: both; content: ''; display: block;
    }
    .okof::before{
        content: '\26F5'; margin-right: 8px; font-size: 30px; line-height: 50px;
        text-align: center; 
    }
    @keyframes blink-effect {
        50% {
        opacity: 0.5;
        }
    }
    .container2 li a sup font b{
        animation: blink-effect 1s step-end infinite;
    }
    .bottomtoo{
        width: 1900px; 
    }
    .container2 ul .smallList1{
            margin-left: 250px;
        }
  
</style>

<body>

	<tiles:insertAttribute name="header"/>
         
    <tiles:insertAttribute name="body" />
        
    <tiles:insertAttribute name="footer" />
    
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