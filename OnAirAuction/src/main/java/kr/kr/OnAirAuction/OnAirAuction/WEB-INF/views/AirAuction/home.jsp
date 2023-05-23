<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>실시간경매화면</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
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
        border-bottom: 1px solid black;  position: relative; width: 1900px; 
        box-sizing: border-box;
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
    .container2 ul li a:hover{
        color: gray;
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
    .body{
        margin: 3px 0 3px 0; width: 1900px; 
    }
    .body::after{
        content: ''; clear: both; display: block;
    }
    .box{
        width: 33%; 
        float: left; box-sizing: border-box; height: 650px;
    }
    .body .left{margin-left: 2px;}
    .box .left .title{
        font-size: 1.7rem; font-weight: 700; color: #080808;
        padding: 0 0 7px; line-height: 29px;
    }
    .product-seller{
        position: relative; margin-top: 10px; border: 1px solid #ddd;
        border-radius: 18px; padding: 10px 10px 10px 10px; height: 127.56px;
    }
    .product-seller ul{
        display: inline-block; vertical-align: top;
    }
    .product-seller li{
        line-height: 26px; font-size: 13px; color: #666;
    }
    .product-seller li.id{
        font-size: 16px; color:#000
    }
    .product-seller .id .seller{
        width: 84px; display: inline-block; font-size: 13px;
    }
    .product-seller li strong{
        font-size: 13px; font-weight: 600; color: #000;
    }
    .product-seller li.pay strong{
        margin-left: 20px;
    }
    .product-seller li.recall strong{
        font-size: 11px; color: #85b816; margin-left: 10px;
    }
    .product-seller li.recall strong.st{
        display: block; padding-left: 75px; color: #000;
    }
    .product-seller a{
        position: absolute; padding-left: 5px; display: block; text-align: left;
        font-size: 11px; color: #444; width: 120px; height: 36px; border: 1px solid #ccc;
        line-height: 32px; border-radius: 6px;
    }
    .product-seller .sel_btn{
        top: 10px; right: 10px; margin-top: 5px; margin-right: -5px;
    }
    .product-seller a span{
        position: absolute; height: 25px; width: 23px; right: 1px; top: 50%; transform: translateY(-50%);
    }
    .product-seller .sel_btn span{
        background-position: -75px 0; height: 21px; display: inline-block;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
    }
    .product-seller .sel_btn #heart1{
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all_sel2.png);
        background-position: -115px -38px; height:21px; display:inline-block;
    }
    .product-seller .more_btn{
        top: 52px; right: 10px; margin-top: 5px; margin-right: -5px;
    }
    .product-seller .more_btn span{
        background-position: -257px 0; display: inline-block;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
    }
    .add{
        border: 1px solid #ccc; border-radius: 18px; height: 40px;
        margin-top: 5px; font-size: 15px; text-align: center; line-height: 40px;
        color: blue;
    }
    .mid{
        border-radius: 18px; height: 650px; 
        font-size: 15px; text-align: center; color: red;
    }
    .step{
        padding: 10px 0 10px 0;
        position: relative;
        border-bottom: 1px solid #ccc;
        box-sizing: border-box;
    }
    .step::after{content: ''; display: block; clear: both;}
    .step .itemid{
        position: relative; line-height: 40px; margin-bottom: 10px;
    }
    .itemid strong{
        position: relative; font-size: 15px; color: #9b9b9b; padding-right: 8px;
        margin-right: 4px;
    }
    .itemid strong::before{
        content: ''; position: absolute; top: 6px; right: 0; background: #bbb;
        display: block;
    }
    .itemid span{
        color: #262626; border-bottom: 1px solid #ccc; padding-bottom: 1px;
    }
    .itemid a{
        width: 17px; height: 17px; vertical-align: middle; margin-left: 10px;
        margin-top: -4px; background-position: -154px 0;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
        display: inline-block; cursor: default;
    }
    .step01 button{
        width: 36px; height: 36px; border: 1px solid #d7d7d7; position: absolute;
        top: 0; border-radius: 20px;
    }
    .step01 .share_btn{
        right: 45px; cursor: pointer;
    }
    .share_btn span{
        background-position: -52px 0; border-bottom: 0;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
        }
    .step01 button span{
        width: 17px; height: 18px; display: block; margin: 0 auto;
    }
    .step01 .like_btn{
        right: 0; cursor: pointer; margin-right: 2px;
    }
    .step01 .like_btn span{
        background-position: -75px 0; border-bottom: 0;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
    }
    .step01 .like_btn #heart2{
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all_sel2.png);
        background-position: -115px -38px; border-bottom: 0;
    }
    .list_ul li{
        padding-bottom: 11px;
    }
    .step dt{
        color: #666; display: inline-block; font-size: 1.0rem;
    }
    .list_ul li:first-child dd{
        width: 230px; text-align: right;
    }
    .step dd{
        position: relative; float: right; font-size: 1.0rem; color: #666;
    }
    .step01 dd > span{
        position: relative; border-right: 1px solid #ddd;
        margin-right: 8px; vertical-align: middle;
    }
    .pr0{padding-right: 0px;}
    .list_ul .pr0 img{
        width: 20px; margin-bottom: 4px;
    }
    .list_ul li .warehouseInfo{
        border: 1px solid #398439; color: #398439;
        background-color: #fff; padding: 3px 6px; border-radius: 6px;
        font-size: 0.95rem; margin-right: 2px;
    }
    .step01 .list_ul li:last-child{
        padding-bottom: 10px;
    }
    .dd1 font{
        font-size: 10px;
    }
    .step li.current{
        line-height: 27px;
    }
    .f18{font-weight: 600; }
    .step li.currnent .history_btn{
        width: 111px; margin-top: -5px; height: 27px; border: 1px solid #ccc;
        font-size: 12px; color: #666; vertical-align: middle; margin-left: 5px;
        line-height: 24px; border-radius: 6px; cursor: pointer; margin-right: 2px;
    }
    .step li.currnent .history_btn span{
        background-position: -175px 0; margin-left: 10px; width: 11px; height: 9px;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png); display: inline-block;
    }
    .step li.est{
        padding: 0;
    }
    .step .pb5{ padding-bottom: 5px;}
    .est_view{
        width: 100px; height: 27px; border: 1px solid #ccc;
        line-height: 23px; font-size: 13px; color: #666; margin-left: 10px;
        border-radius: 6px; vertical-align: middle; cursor: pointer;
    }
    .est_view span{
        width: 12px; height: 12px; background-position: -190px 0; margin-left: 3px;
        display: inline-block; background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
        cursor: pointer;
}
    .est_ok{
        width: 130px; margin-right: 2px; height: 48px; background: #0053a0;
        color: #fff; font-size: 18px; border-radius: 24px; line-height: 48px;
        cursor: pointer; border: 0;
    }
    .est_ok span{
        width: 23px; height: 18px; background-position: -207px 0; margin-top: -5px;
        margin-left: 1px; display: inline-block; margin-right: 5px;
        background-image: url(//static.itrcomm.com/img/sub/view_icon_all.png);
    }
    .amount{font-size: 15px; font-weight: bold;}
    .add2{
        height: 339px;
        box-sizing: border-box;
    }
    .box~.box{margin-left: 3px;}
    .bottom{
        border: 1px solid black; height: 50px; line-height: 50px;
        text-align: center;
    }
    .step .dd1{font-size: 7px; padding-top: 5px;}
    .step .dt1{font-size: 15px;}
    .step01{
        height: 205px;
    }
    .step02{
    	height: 130px
    }
    .dt123{
        margin-top: 12px;
    }
    @keyframes blink-effect {
        50% {
        opacity: 0.5;
        }
    }
    .chat-top{
        height: 77px;  box-sizing: border-box; line-height: 80px;
        border: 1px solid red; border-radius: 18px;
        margin-bottom: 3px;
        animation: blink-effect 1s step-end infinite;
    }
    .container2 li a sup font b{
        animation: blink-effect 1s step-end infinite;
    }
    .chat-bottom{
        height: 130px;box-sizing: border-box;
        
    }
    .chat-mid-cover{
    height: 418px; border-radius: 17px; overflow: hidden;
    }
    .chat-mid{
        height: 417px; box-sizing: border-box;
        color: green; border: 1px solid #ccc;
        line-height: 420px; margin-bottom: 2px;
        border-radius: 18px; z-index: 10;
    }
    .chat-bottom input{
        height: 100%; box-sizing: border-box; border: 1px solid #ccc;
        float: left; border-radius: 18px; width: 80%;
    }
    .chat-bottom button{
        height: 100%; box-sizing: border-box; border: 1px solid #ccc;
        float: right; border-radius: 18px; width: 20%;cursor: pointer;
    }
    .chat-bottom::after{
        display: block; clear: both; content: '';
    }
    .body .left{
        width: 400px; margin-left: 200px;
    }
    .body .mid{
        width: 660px;
    }
    .body .right{
        width: 400px; margin-right: 200px;
    }
    .bottomtoo{
        width: 1900px; 
    }
    .container2 ul .smallList1{
        margin-left: 250px;
    }
    .swiper-body {
        position: relative;
        height: 396px; width: 400px; margin-top: 10px; border-radius: 20px; overflow: hidden;
    }
    .swiper {
        width: 100%;
        height: 100%;
        background: #000;
        color: #000;
    }
    .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .swiper {
        width: 100%;
        height: 300px;
        margin-left: auto;
        margin-right: auto;
    }
    .swiper-slide {
        background-size: cover;
        background-position: center;
    }
    .mySwiper2 {
        height: 80%;
        width: 100%;
    }
    .mySwiper {
        height: 20%;
        box-sizing: border-box;
        padding: 10px 0;
    }
    .mySwiper .swiper-slide {
        width: 25%;
        height: 100%;
        opacity: 0.4;
    }
    .mySwiper .swiper-slide-thumb-active {
        opacity: 1;
    }
    .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index:2;
    }
    .modal_content .box{ 
        width: 100%;  margin: 10px; 
        height: 70%;
        border: 1px solid gray;
    }
    .modal_content .box img{
        width: 100%; height: 100%;
    }
    #modal button {
        border-radius: 20px;
    }
    #modal #modal_close_btn{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 25px; font-weight: bold;
    }
    #modal #modal_copy_btn{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 25px; font-weight: bold;
    }
    #modal .modal_content {
        display: flex;
        width:600px;
        height: 500px;
        background: #fff; 
        border:1px solid #666;
        padding: 30px;
        border-radius: 20px; opacity: 0.9;
    }
    .modal_layer {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 100%;
        height: 100%;
        background:rgba(0, 0, 0, 0.5);
        z-index:1;
    }
    #modal #modal_close_btn1{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 115px;
    }
    #modal #modal_confirm_btn1{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 115px;
    }
    #modal .modal_content1 {
        display: block;
        width:600px;
        height: 300px;
        background:#fff;
        border:1px solid #666;
        padding: 30px;
        padding-top: 90px;
        box-sizing: border-box;
        border-radius: 20px;
        background-image: url(data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTEhMVFhUXFxgXGBYWFRgXFxcbFRgaFxgYFRgaHSggGBonGxkYITMhJSkrLi4uGB8zODMtNyotLisBCgoKDg0OGxAQGzIlICUvLy0tMjAvLS0tMC8tMi0rLy0vLy0tLS0vLS8tLS0tLS0uLS8vLy01Ly0tLy0tLS0tLf/AABEIAL0BCwMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAAAgYBBQcDBAj/xABJEAABAwIEAwUEBQcKBQUAAAABAAIRAyEEEjFBBQZRBxMiYXEygZGhFEJSwfAjM2KCsbLRFhc0RFNyc5Lh8SRDVJOiFSVjg6P/xAAbAQEAAwEBAQEAAAAAAAAAAAAAAwQFBgECB//EAEERAAEDAgIECwUFBgcAAAAAAAEAAhEDBCExBRJBURMUYXGBkaGxwdHwFSJSguEjMkJikgYzRIOi0jQ1Q3OjsvH/2gAMAwEAAhEDEQA/AO4oiIiKJdGqkvJxlEXqiIiIiIiIiIiIiKJPREUkUJKmiIiIiIiIiIiIiIiLBKIhKyvKbr1RERERERERERERERRJ6ICd0RSREREWCVleRciI4qbWo1qkiIiIiIiIiIiIiLDlgDRSUB0KIso1YaFNEREREREREREWCURCV5lCVNrURGtUkRERERERERERRepLBCIsQkrBPVZA+CIjFJEREUQ1SRERERERERERERERERERYIWURERERERERERERERERFFrYUkREREREREREREREREREWCFlERERERERERERUzjPPAoVn0W0C8sMEh8XibAMO0L5Rz1WMhuCdIBMZnmY6EU79fNQG4pgxPYVpM0ReOaHhmBEj3mjA85lX1FRn82YuJbgnT0LKp2G4b1zCI2ndebOZ+In+oxOk0qu7ZEna8BOM0/QK9GiLmJOqOdzfNX1FRafHuJls/RADOhpVb+8vEbKLeL8Xcf6K1ot9Xzvq/onGG7j1FPZVUZvYOd4V8RURlfjJkFjGmbEd0Rud3+QH63kvI/+tk/VbrvhzPTYxp804f8rupfQ0VOdakPn+i6Aiov0LjBJzVmBpi4LJExJgM2E/Aeqi7g3Fjb6UwQRcVCJ6yAzqnDH4T2ea+Ro5kwa9Prd/ar4iobOXuJyJxg0uBWq9f7npex1R/KvEDY45xmSD3lQEH0AiPgnCv+A9i94hbg+9cN6A4+CviKhP5NxZ9rHOmZ1qOt0u71/AWTyFUM5sY6DaMhMD1z9U4Sp8HaE4nZ7bkfod5K9yvN9Zo1cB6kKhjs2tDsU8+eT53eb/j1+k9ntIkE1nn9RlzYdPL0XnCVfg7fohtbAfxBP8s+JVtOPpDWowfrt/ivJ/GcMNcRRHrVYPvVbZ2c4YH263pNP4ewpnkLCNAl9aB9p1OLaT4P9901q/wjrTgNHDOs4/JHiVvjx7C/9TQ91Vh69D5H4LzqcyYRtziKXueD06eoVfZybw6HPDyQPaIrMytgXzEC1olfRheUOHvB7uHjU5agdqI2QOrH4esr00dHNxLqn6W+a2J5uwX/AFDPdmP7BfUfFeT+c8CNa462bUPUfZ8jbyPRfJieVuGUoNVrGzAGeq5o8o8Q+K+5nJ+CFxQbeNS86aauSaxP4e1ekaMAn7UjZ9wT04rxPPWB2quP/wBdT72ryfz5hOtQ6/U6CdyIWxbyvgxb6NS/yz+1RxHDMBSE1KOGYNAXsp3J2Ei58k+32kdq8B0bMBlQnnb4Ban+cXCbNrHXRrBpPV/ksHtEw0SKdc/qsBO1vHe9rbqeC4lw2pWbRo0qTnPJgig0NlrSdS0HQFTxfHcBSquo1KTWlhAJ7lsXykEZQTFxso9Z8TwgjmVngLcO1OK1NaJguxjKYA34L4qnaTQGlGqTMR4fLSCZ126KB7RmQYoPP6wiwk3jWLx+xWH/ANUwYpuqh1KGgk5cuYQLgjUO2jVT4BxmnimOdSBAa7KQ4NkWkHwkggg9V9gVJjhBjyfVRF1qGl/FXQDBJe7AnZkD6E5qt4LtB7yqykcOWGo5rRmf9p0E+ztIt57K+qh9ojgK+DdIkPJAIB0cyTOyvi9ol+s5rjMQob+nQ4KlVos1dYOkSTkY29fSiIisLMREREVBwUN40+4ktcCBv+TY4E7dfwCrPx3jlLC0w+rmuYAaAXHcxJAt6qsNpRxwugeJloJn81cuGm37FbuKcJpYhmSqzMNrkEWixBBCrUtbVeG56xWxfcFwtu6rJbwbJjPbl6CrQ7R8KQYZWkQYIZcHcQ428/MdVA9olEgltKoYAPic1uv2bmbKicb4WKVao2xYyo9syc9jYkaERe36S+LD0zMST00E+EuBE3nz894VQ3VUGJW+NC2BbrtaSM8SV1nljmpuNe5jabmZW5pcQZuBa3WfgtM3tIBcR9HIgkSaoAMdPDrIiPNa/sr/ADz9L0oN7+B7R9/7F93P3L9JrGV6TQx2cMcGgAODwRMRAO2l811NwlV1LXBymclnutLGlfutnswIbq4uwMGZgg4nnX34DtDwzyG1G1KRNpIBYCdASDPyhWvD4hlRoexwc03BBkFcIZhy4vBAkT7ZO4nUb2kbaLfcn8eOGrBpce6ecr2k2Bj2wTvAJ8w09AvmldumH5KW+0DS1C62JBGOrmDzbRyZycJXYUWAsrQXJr5OI1+7pVH/AGGOfpPstJ+5cqq89YwZD3jIMZg2m2dbiXCM0a9PRdWxLmWY+PyksA6y1xI/ygrhnFOH91UqU9Hte4DLJBLXQWidzr8VRu3OaQWnD0V0v7P0beoHtqsBdgRIBwxHYfBberzrjxfvmkfosp9TYjLYxHxXQ+R+KvxGFzVCS9r3McSACb5hIGlnAe5ciLYaCJIDhuNIkFxGtza5+avPZpVyVKlIlsPaHCCZlhLSIOhhw02aFFb1HcIJJK0NMWlHijnU2NBBnAAExmMOQz0Lo6IvKtVDWlx0AJPoBJWmuKVc5u5mGGblphr6xEhhNgJjMRqd4G8FcxfxDEY2oGVHveXSAL6mwyNHhaZ6AWBJTF4t9etUe6SXvJG1oJaGzoAAACvu5LrMp4mlUqZQAcpLiZGYFgI95EzoFk1KpquEnBd3a2TNH0HOa2agEztmDgNwnDl5yAr5y7yy+jg6mHe8ZqodOUSGZ2BkCdY12VM4vyricGWvY8OYHfnBmBYDbxwZaBs4THVdeUKtMOBBAIIgg3BB1BCuvtWOaG5Rkubt9NXNKq6oYcHmXCM9mG7Do3grg2O4jWrnLWqvflgMLnQBJ+sDcTEzra67jwn8xR/w2fuhch5t4IMNii1hOQgPaOgLpAJOsFhEeQXWuBn/AIah/g0/3AoLQEPcHZrS089lS2ovp/dMkYRmOTLLHlXycy8abhaJeRLj4WN6k7n9Eb/6rj3FOI16tTPWeXlwgFpkAG8AWiBOnn6qxdqGLzYru7/k2NED9PxEzt7Qv5Ksmm4ObMwZEyAJk2gDWw/ACiuahe8jYFoaFsmUKDahHvPEk7YzAHRid/QI6NyRyo2m2niqn5wtDmtbZrQ5sAkbuLTcaX0Wx47ydRruNUSyqTObMS1xERnE6WHskKXKnHadWnTpFzRVY0NLQZzBogOYd5EEjUX9VZ1dp0qZpgAYePmuZu7y7p3bnlxDsuTVmY3Fp6QdslcE41wuphz3dWA9pcBqQ9p0fO4uQCb9YylX7soP5OuL+0yziCR4Yv8ABbDtD4UKuGNUWfS8QduGkwfcLO/VWr7JWkMrgzrTN/1x9yrMpcHcALcub43uiXVD94EAjlkZchz5MlLtQbfCumIc/rJvTMekAyr8FRO1WkDToOInK9w87tH8J9yvLHSAeqtU/wB6/o8Vi3eNhbfzB2hTREU6ykRFFx2RFRMTTI43Td9VwvfpRcAR5f6K+Aqj8Xwv/u2HfmgZWQI1PjGvuV2I3CgoDF3P5LT0i6W0P9sDqLlxLm0H6XiTe1Vw1gEOMwBa9je9ttJ0vjhpAJgawQWeK0xoBa8bjyVh50wcY2q4y1pf7VsskNMWgz4p9DK0tGZ8RFjOhjwgm0G9o+QssuoPfPOV3No8G3pkfC0/0j13q39l9ecS4HXuXDb7bCfu9IiFa+0Vs4F8AuIcwwATMOvp5Sqj2YsjE5gNaTgbCAZaTPUkg3n3BXbnsTgaumrBfzqsCu0v8O6eVc1fx7Xpau9nfC41Tql2VskkkXBg6ENknpe1uqg3MS4AzJFtQTmEZSPdqbr3bh84c4SSPsgDS8wSTAiSLb7BYpUXZw1hkkwBFyRAymDa9vis8rrGuE4etvr1Hc+BvLsNQc4GTSpkzrOQTPvWwXycOod3Sp0/sMaz/K0D7l9RK3WzqiV+X1C0vcW5SY5lSOc+LmljMIwE+E944dQ5wYfXwh/x0VW7R8GaeMkEgVQ14I+qT4HW3u0H3n3brGxX4q1pu0PAjUfkokO97Xkeq+rtTwM0KdYascWn0eJ+MtHxVCqC9rzuPdgexdTYvbb17anEFzCD8x1m/wBWC5o2q5pJcLEkmZhwkyAd4IO/ULc8q43u8VRq5hBqZXS4QQ+QSBawDpIvcBapwtcg3jQyYE9ba/w0U34WDclo2mIJB1ERAt7iD6KkJGIXSVGsqNLHZEEHmy7vW79ArX8daThq4Gpo1AOs5Co8BxvfYejVmS5jSf7wEO/8gVsHNkXW3g5vOvzOHUakOzae5fnhwdZwkgDWCCwZrTGgBi8bjyU6VQvIG4EzIAmJOby0Gohbfj/CX4bEPpn2ZzUy4EgtAJBGkmLEdRsFqm4aWBwDtpcIhskyXXvOgv8ACViFpGBX6a2qyoA9uRxB559esdvwHmzFYcZWE1GA2p1JfAAJOWLgRsLCNFeuDc+UapDarHU3OgA3cwzEXgOHwjzXMKTIgyCNtwZ3Pp036L6n8OJa993G85bGw1vsIJgRv0CmpVajMj0LNvNH2dckvaATtGB6dm7MTsnOOp8w8vUsc1ju8iBZzIc1zSQesG4sfVbzB4cU2Mpt0Y1rB6NECVx/lrj9XC1BlfnaZzMNgSLEfomBZ3leQuvcOxja1NtRhlrhI/gfMGx9FeoVGVCXAQdq5jSdpcWrW0nO1qYJ1eTn2z1jdGIHJu0Wi5uPcdA9rCOkZA2D0lzSNlW6VRzLEZdDB3NoLQfKPWAdrdV7QuAOr0++pCatMEEASXMJmANyDcDzO8LmAZJa0xeYt7tz5Hr81QuKZbUPLkup0VdMr2jfygNI2jVGHWMvoV5PBGQhxAIkXBIvEkbjcWVg4bzrjaBAe7vG5jHeAumDBh5PkdXLQVsOWzq0iTldEwAbiNTfbqNbxPL4QHbkbXOhO9v4e5RNcWmQYV6rTpV2xUaHDlE8uHLygrqvA+b8Ni25KgDC+WZKhaWPmxa076xBA1i63/DuF0aAIo0wzMQXRJJgQJJM6LhlTB5XA+zItIEOhxFoi1oPmF0bs65idVH0es6XNbLCdS0WLT1I1B6T0V+hcazg14x2FctpTRIo0nVbYnUzc2THIeWN2JGe+J9qbD9HpmYipe8TLTb1/F1b8EfyTD+g39irHadTBwtOTAFYSfLu6gKsXC70aXXu2fuhTM/fO5gs2uR7Po8jn+C+xml1NYAWVYWWijupIiKj8w1nN4nhQBIIp3vb8o8dIuP2FXUNVF5skcSwR86Q/wD2vA9Pxur6oKX3n86075v2Fu7e3uJXGefCRjK4l0DISMpsCxvika3JGg2uq42q5paRItqDYwconaYEeis3aDTd9PqAGzhTJBn6rAAR11IVewxMEEQNCJABiSc0jynoNdlmVfvu5yu2siOK0zH4W/8AUBWXs8q/8bTGngqWAMElskGdIgdddbr7O0Dmdzi7DsYWtZUhzp8RLNIGwm46xtC1fZ4A3G0nTEh4jrLDM7WI/wB11R3BcOXF5o0i4ySSwEmRBknyKs0WOfS1WmMcViaSuKFtpBtWowuhg1dkHWdj3743ZLiuFa+qQ1jXF7iZysLy6AQ2w0BMyZPpZdA5I5ONF3f4gDObsZrk6OcftRMAWEk6xF1w+GYwQxrWDo1oaPkvoU1K0DTLjPcs+906+uw06TdQHPfG7ZA6+fOcEwvmxNYMa57tGguPo0Ele7wq/wA8Yru8FUy6vimJ/Tsf/HMrL3arS7cse3o8NVbSH4iB1mFVuzYmria1UkkNnXUPquknXo122/qrrzPhO9wtZkAnIXNH6TfE35gKq8sPqUuHVK1JhdVe8ZPDnMNIY3MGjY5/RfDU43xi8UnxMCMMb+ZDmyqTHtZSDXA4jvXQ3NrVur11ak5rQxwAkxi2J2Za04qjUq13NMwTcHYA6jeRHQ29FnEPJBJmJMiD4eoHl5mF9GNoub4KrS1wMEO8JE+KAIn60++eq8O5doCCBJgbExLR6ga3sfVUMcl1ktPvfXD19TGfUezHH58O+m4+Km8G2mWo0GR6uDz71dVybszx5ZiSwyBVabbTZzTpMwHDpcBdXcta1drUxyLgtN0eCvHfmh3Xn2ytTxPAUcU0sc4FzDZzCM9N2ljt0IOq51xzkuvRk05ey58DSSZ1Dm3ItpGbckiV8vJfE3UsYC+wc403k2Him7rX8QB1HsldmUTQy5brEQVcrur6Hqik12uwicRhuMYyOuMQYlfnt7nCmDB8LyCRZwkaRqBIn1C2OHxrqg+yT7TgJsBAMaSTO5jouwcR4JQqnNUptzaZwMr/AEzC5HkbLm3NvKxwh7ykfA51jcOabkMMCIN7+V43gqW76Y1pwWta6Wt7x3B6uq/ZOIndO3kEY4CDCrmMrgZ20xEASQIcLxDTEkXg+q6F2U48vpVaZJIY5rmk6w8ERrsWfNc1Y0hwtreR5GCATv67rpHZfQMV6pFnFjZn2j4nEm2sFv7d182xPCj1sUmmmsFg8HkIO2ZA7p6OtWbi/MmHw72U6riHPEiGkwL3dGgsfgvj47ypRxHjb+TqA5g5o8JOsuG99xBPVVDtWBGKpuiQaLR5Ah7yCrpyZxIV8LTmz2AU3A6+AQD7xHz6K4KgqPdTeOZc9UtXWlrSvKDiCfvdOWG7ZBkZLnXGeT8XRI8JqtGj2DMB0zjVoHWCFX2VYcWmQM0FuwAOw1m0aH5L9DKvczcsUcWwy0CoActQWM9HHcFRVLPaw9H1V+0/aLJty35h3x5ZbBsXGaryWyZiSCIPh3gdQRFzG62nKmJc3HUSSQTUY3WxFQgGPUEm261tTDkEst4bkXsdCG+sDrb3rf8AIlI1cVTaGjK1wqEbN7u4IEdYEzuOqpUwS4LorpzGUHyMIM80eQ6esq79o/8ARJP9o2bTaHaAb/iy3vL39Fw/+DS/catJ2j0pwR0/OMN/OR8b/Fbnlr+h4ede5p/uhao/fnmC4d4Hs1h/O7uC2iIinWWiIiIqDzwYx2BP6bPS1QX9b/Mq/KgdpLiKuEIFg9xJ2HiZ+Pxa5cUxwoUn1XAlrASQBJPkFXp4VKhPJ3LWumufa2oaJJDgOfXhcz7SqhGJcD7JY10dHERJ8oZ8lUmV8pacoMi4I9q0G/mPn8FuOa+LvxNYv7sAOAYBILgGSZcYtMztoNYvqKEEZS0kWGhtcklvT0PWFmVTrPJC7OxomnbMa8YgCY5o9Yqwcj14xdFrSIcSSDE3Y6IjcXmfnquyrgXDcTUw9Vlam3MRBAO87NGuwBI6+a7Byrxk4qgajqfdlrywiZaYAMtO4vHqCrtnUGLDmud/aK0qaza4Huxqk7Zknn/8W9REV5cwi512o8SE0cPc3NR4F4tDSR/mN9lZubMdiKVEHDU87y4NJjNlBB8WX1AEmwlcqxPDcbVqGrUoVi98knun3OmzdI28lTuqpA1AF0WgbMOqC5e4Q2YEiZy6vLcuu8rUg3B4cD+yY73vbmPzJW3XN+UKmOp1KdI0qoo3zCpTc1rW2u1zgC0zmOXS+l10hTUH6zMlmaStzRuHS4O1pdgZzJz3HkXK+0vDNbiGzYVGNM9HA5DG0FrWhU/GYkuF9JMXuLmQfSfmrZzFwHiGIrFz6ZcZLWlrm5Q2XRlvYQfXrfX4P5GY8ty9wIkmS+lJnreSRsfwM6o17nEhpjmXY2Na3pUGMqVWEgD8TezHdA6Ni1PCeJ9zXY8Cwc1xblvbxW8gZ1233XeKVQOAc0yCAQRoQbghcj/kJiyINJoMyCarc1gIEybf6K58k8HxeHDm16gcyAGNzFxaRqRs0a2H3XsWmux2qQYKyNO8Wr0xUp1G6zcImZyyjp681yytVy1Tb6xsWnxw4iPMET7/AILp/JnNdOu1tGo+KoFp/wCYBpH6YGo31ErSt5EqVcRUFbw0czi1wMkguJAYJ8Ot5HXXVQx3ZzWY4uw9RrxBGWpZwkAWsWzAibKKk2tS94DBW72vo68aKT6kOiQdg6cucSN2eXTpVF7RuNsbTFBjmmq50kAzlaGmzuhdMAHaV9fCOG4tuBq0qpd35Lgyakw0tbADpOUTm3Vd4d2c1i5rqtRjAHA5fzhO5B0GvmVZqvqOaA1ufYsiwt7SjXdUrVR7hwAx1sM8JMTsjHfmFUcDhn16vd02l73O8O9yTd3SxJJPTXr2zgHDBhqDKViQJc6PacdT9w8gF58F4DRwoPdtl59p7rvd1k9PIQFuF7b25p4uzXxpfSovCKdMQwb8yfAbh0nYByztXj6RSkTNIDrEPcZhaTlbmQ4V4dAiPGNA5szAn6wMkHzPW/R+a+VRjH0nd4WZLGBMgmbXEHUe9RxHI2DcwMFMsIEBzHQ615MyHGRuFC+3qmoXN6FoW+lrJtmyhWBOEEAZYnmnCIiesBbHhPMGHxAHdVWkkTkMB4/V3jqJFl8HMfN1DDAsDw6rEZRowmwNQ7AHaZ/aPk4LyUMNXZVbWLgwOAYaYEy0i7gdZPS6Y3kOjWrvrVKjpe4uhjQ032JMz6wFYLq5ZgMfDrWY2noxtwZeSyJyMzP3TgNkHsBXM3ufVIYwFznEhobczJMED60km1vEV1Xkrlz6LTLngd7UAzAXDBrkB3uSSfTWJWz4PwKhhge6pgE6vPie71cb+7RbUr5oW2odZ2J7lLpPTPGWmlRGqzbOZ8ANsYzyZKtdof8AQKv6m8a1Gi/kvq5MdOBw5/8AjHykL5ufoOBrixPhtbZ7CfkvTkIzgKH91w+D3BfX+v8AL4qE/wCVA7qp7WKwoiKwslERERUDtSMfRXCZD36fqTO8ffCuVetRIIe6mWkEEOLSCDqCDYhazmjltuNDA57mZC4yBc5gBv6LTDs3w+rqtUneMgBtGhafkqxFRr3FrZBjbC2Q+0q2tJlSoWuZrZN1s3SNo3St0/CcOBBLcICLAnu9dgsRw0H+oj/szvPyJ+JWsHZ1hby+tePrMGnoz3KX83eEtJrGBAl7dJJ2b1K8+0+Adf0XutZ7a9Q9B8Stj9M4c0TnwgAE+Hu7A720lTHNGBbAGIpAbAH3WAHVfC3kHBD6jzAIu86EQV6DkXAxBpEiZu9/QDY9AF9fbbAO3wCiPs4n3n1D0N8Svf8Alhgv7cHXRryfDrYNK8X884Ef86fSnU+RLbqTOSMAP6uNZvUqG43u5e7eUcEAR9HZBiZk6aalPt/y9qH2WMuFP6B5r4hz3g9nvNw32DJJ0A66FeT+0LCDar09gC/Qy4QfVbhnLWEGmGo+9gP7V6jgeG1+jUP+0z+CRX3jqK819GD8FQ87m+Sr7e0TCn6lbSbtYLdfb9PivKt2kYcD8zX97WjzEw4n5K0N4ThxpQoj0pM/gvZuCpDSmwejW/wTVrH8Q6kNfRwyou/X5AqmN7SaZMCg/UgS9tyDHuXm/tJG2Feb2OfUXEiGnor2yk0aNA9AF6QnB1fj7PqveN2A/hv+Q+AVCZz/AFHezg3x1zOOokCAzrZZPOOMPsYB7vMNqET0sFfUTgqnx9gXnHLMZWw/W8+KoLuaOIyIwLo3mlWkXgxpOx/Fn8oOKECMGLn+yqCANJBd/D3K/IveBd8Z7E4/QGVu3rcfFUIcX4uRIwrJnQsy29S/1+Pxz9L4zcii2NhFMESL6vvf8FXxE4E/GeseSe0mThQp9R/uXPyeOGbMGkfmL7Hrl2O+i9WYXjBMl7Ba7SWRI82tkA/eVe0TgPzO60dpSRhRpD5PMqgnhHFnEn6SGg7Z7C+lmTEecr0HL3EzBOLFjeK1WCPTILq9InF27SetPa1UZMYPkColXljiBMnGls2IFWsR5xKHk/GEQ7HPmQZDqh2AIILri3zV7ROLM295809sXWQgfK3yVErci1XQfpZaRuGOvc+1L+hI+C8x2ciCDinkR9i+sjV5tpby2V/ROLU93eg01egQH/0t8lSf5vaRaGuqvtu1rQ6IAiTPT5lWXg/Dhh6TaTXFwbmguiTmcXXgAbrYovtlJjDLQq1xf3Nw3VqvkTOzPHzKIiKRVERERERFF7oRFJERERERERERERERERERERERERERERERERERERFBzojzU0RERERERERERERERERERERERYJRFhzoUCUJU2NhEUkRERERERERERFElZcsDZEURPWVMFYnojRuiKSIiIiIiIiIiIii5yOcoIiA3XqsALKIiIiIiIiIiIov0RFgn3JdZQHoiKSKLQpIiLxJ/wBl7KICIjWqSIiIiIiIiIiIiIiIoTHopoiKLQpIiIiIiIiIiIii42UkRF5BTa2EaFJERERERERERERERYIWURFCYUgFlERERERf/9k=); 
        background-position:  50% -15%; background-size: 250px 150px; background-repeat: no-repeat; opacity: 0.9;
    }
    .modal_layer1 .modal_content1{
        font-weight: bold; text-align: center; font-size: 25px;
    
    }
    .modal_layer1 button{
        font-weight: bold;
    }
    #modal .close_btn{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 55px; font-weight: bold;
    }
    .modal_content2 .box{
        height: 100%; width: 100%;
    }
    #modal .modal_content2 {
        display: block;
        width:600px;
        height: 300px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    }
    .modal_content2 .box ul li{
        list-style-type:initial; line-height: 40px; font-size: 20px; font-weight: bold;
    }
    .modal_content2 ul li{
        list-style-type:initial; line-height: 40px; font-size: 20px; font-weight: bold; margin-top: 10px;
    }
    .add button{
        border-radius: 20px; width: 400px; cursor: pointer; border: none;
     }
     .add button:hover{
        font-weight: bold;
     }
     .modal_layer button{
        border: 1px solid #ccc; cursor: pointer;
     }
     .modal_layer4 .modal_content3 {
        display: block;
        width:600px;
        height: 500px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    }
    #modal_close_btn4{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_confirm_btn4{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_double_btn1{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 80px; right: 226px; font-weight: bold; cursor: pointer; color: red;
    }
    .add2 .send_message button{
        width: 100%;   border-radius: 20px; padding: 5px; cursor: pointer; margin-top: 5px; border: 1px solid #ccc;
    }
    .add2 .send_message button:hover{
        font-weight: bold;
    }
    .modal_layer5 .modal_content3 {
        display: block;
        width:600px;
        height: 650px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    }
    .modal_layer6 .modal_content3 {
        display: block;
        width:600px;
        height: 650px;
        background:#fff;
        border:1px solid #666;
        box-sizing: border-box;
        border-radius: 20px;
        overflow: hidden;
        padding: 30px; opacity: 0.9;
    } #modal_close_btn6{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_confirm_btn6{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_close_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; left: 30px; font-weight: bold; cursor: pointer;
    }
    #modal_confirm_btn5{
        position: absolute; 
        width:150px; padding: 5px;
        bottom: 40px; right: 30px; font-weight: bold; cursor: pointer;
    }
    .contain_member{
        width: 100%; height:270px; border-radius: 15px; border: 1px solid #ccc; margin-top: 5px; overflow: hidden;

    }
    .contain_member .member_list{
        border-bottom: 1px solid #ccc; height: 40px;  margin: 0 10px 0 10px; line-height: 40px; display: flex;
    }
    .member_list .box1{
        width: 65%; 
    }
    .member_list .box2{
        width: 35%; padding-left: 30px;
    }
    .chat_list{
        width: 100%;  border: none; margin-top: 4px; height: 220px; padding: 5px; box-sizing: border-box;
    }
    .textarea_container{
        width: 100%; overflow: hidden;height: 330px; margin-top: 10px; border: 2px solid #ccc; border-radius: 20px;
    }
    .chat-mid{
    	line-height: 20px; text-align: left; overflow-y: auto; display: flex; flex-direction: column-reverse;
    	padding-left: 15px; padding-bottom: 10px;
    }
    .popup {
	  display: none;
	  position: fixed;
	  z-index: 1;
	  left: 0;
	  top: 0;
	}
	.popup-content {
	  background-color: #fefefe;
	  margin: 10% auto;
	  padding: 10px;
	  border: 3px solid #888;
	  border-radius: 10px;
	  width: 850px;
	  height: 500px;
	  position: absolute;
	}
	
	.close-popup::after{
	    display: block; content: ''; clear: both;
	}
	
	.close {
	  color: #aaaaaa;
	  font-size: 28px;
	  font-weight: bold;
	  float: right;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.message-table{
	  width: 100%; height: 100%;
	}
	
	.auction-message{
	  width: 100%; height: 100%;
	}
</style>
<body>
    <div class="body">
        <div class="box left">
        	<div style="height: 37px;">
	            <h1 class="title"> ${auctionProduct.pr_name}
	            </h1>
            </div>
            <div class="swiper-body">
                <div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
                  <div class="swiper-wrapper">
                  	<c:forEach items="${files}" var="file">
			  		<div class="swiper-slide">
						<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto">
					</div>
					</c:forEach>
                <!--<div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-5.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-2.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-3.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-4.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-1.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-6.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-7.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-8.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-9.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-10.jpg" />
                    </div>-->
                  </div>
                  <div class="swiper-button-next"></div>
                  <div class="swiper-button-prev"></div>
                </div>
                <div thumbsSlider="" class="swiper mySwiper">
                  <div class="swiper-wrapper">
                  	<c:forEach items="${files}" var="file">
			  		<div class="swiper-slide">
						<img src="<c:url value='/download${file.fi_save_name}'></c:url>" height="200" width="auto">
					</div>
					</c:forEach>
                <!--<div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-5.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-2.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-3.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-4.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-1.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-6.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-7.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-8.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-9.jpg" />
                    </div>
                    <div class="swiper-slide">
                      <img src="https://swiperjs.com/demos/images/nature-10.jpg" />
                    </div>-->
                  </div>
                </div>
            </div>
            <div class="product-seller">
                <ul>
                    <li class="id">
                        <div class="seller">판매자</div>
                        <strong>${auctionSeller.me_id}</strong>
                    </li>
                    <li class="pay">구매만족도
                        <strong>${auctionSeller.me_trade_certification}</strong>
                    </li>
                    <li class="recall">
                        반품수용여부
                        <strong>${auctionProduct.pr_refund_ok}</strong>
                        <strong class="st">${auctionProduct.pr_refund_date}</strong>
                    </li>
                </ul>
                <a href="#" class="sel_btn" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">판매자 찜
                    <span class="all_icon"></span>
                </a>
                <a href='<c:url value="/userStore/${auctionSeller.getMe_id()}"></c:url>' class="more_btn" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">판매자 상품 보기
                    <span class="all_icon"></span> <!--/{store_num}-->
                </a>
            </div>
            <div class="add">
                <button type="button" id="modal_open_btn4">신고하기</button>
            </div>
        </div>
        <div class="box mid">
            <div class="chat-top" id="tabl3">현재 입찰자: ${lastAuctionRecord.getAr_me_id()} 님	입찰가격: $ ${lastAuctionRecord.getAr_bid_price()}	입찰시간: ${lastAuctionRecord.getAr_bid_time()}</div>
            <div class="chat-mid-cover">
            <div class="chat-mid" id="messages"></div>
            </div>
            <div class="chat-bottom">
            	<div>           	
        		<button type="button" onclick="closeSocket();">대화방 나가기</button>
        		<button type="button" onclick="openSocket();">대화방 참여</button>
            	</div>
            	<input type="hidden" id="room" value="${chattingChannel}"> 
        		<input type="hidden" id="sender" value="${userId}">
                <input type="text" id="messageinput" placeholder="내용을 입력해주세요.">
                <button type="button" onclick="send();" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)" id="message_send">전송</button>
            </div>
        </div>
        <div class="box right">
            <div class="step step01">
                <div class="itemid">
                    <strong>Item ID</strong>
                    <span>${auctionProduct.pr_code}</span>
                    <a href="#" class="all_icon" style="cursor: pointer;"></a>
                    <button class="share_btn" id="modal_open_btn">
                        <span class="all_icon"></span>
                    </button>
                    <button class="like_btn">
                        <span class="all_icon"></span>
                    </button>
                </div>
                <ul class="list_ul">
                    <li>
                        <dl>
                            <dt>상품상태</dt>
                            <dd>
                                <span class="pr0">
                                    <img src="//static.itrcomm.com/img/sub/item_status_ico_1.png" alt="">
                                </span>
                                ${auctionProduct.pr_condition}
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>상품위치</dt>
                            <dd>
                                <label class="warehouseInfo">${auctionProduct.pr_location}</label>
                            </dd>
                        </dl>
                    </li>
                    <li id="tabl8">
                    	<div id="tabl7">
	                        <dl>
	                            <dt>입찰가능시간</dt>
	                            <dd class="korEndTime" style="font-weight: bold; color: green;">
	                             	입찰시간은 ${endTime}
	                            </dd>
	                        </dl>
	                	</div>
                    </li>
                    <li>
                        <dl>
                            <dt class="dt1">물류센터 도착 예정일</dt>
                            <dd class="dd1" style="font-size: 14px">
                                	
                                <font class="fw 500" style="font-size: 16px">
                                   	입찰후 3일 이내
                                </font>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="step step02">
                <ul class="list_ul">
                    <li class="currnent">
                        <dl>
                            <dt class="c_000">현재 입찰가</dt>
                            <dd>
                            	
                                	<font class="f18" id="tabl2">$ ${lastAuctionRecord.getAr_bid_price()}</font>
                   				
                                <button class="history_btn" id="modal_open_btn3" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)" >
                                    <span class="all_icon"></span>
                                    입찰내역보기
                                </button>
                                
                            </dd>
                        </dl>
                    </li>
                    <li class="est pd5">
                        <dl>
                            <dt class="dt123">입찰 견적가</dt>
                            <dd>
                                <strong>
                                    <font class="amount">원화표시가격</font>
                                </strong>
                                <button class="est_view" id="modal_open_btn2" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">
                                    자세히보기
                                    <span class="all_icon"></span>
                                </button>
                                
                                
                                <button style="display: none" class="est_ok" id="delivery_btn" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">
                            		배송지설정
                            	<span class="all_icon"></span>
                            	
                        		</button>
                                <button class="est_ok" id="modal_open_btn1" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">
                                    입찰신청
                                    <span class="all_icon"></span>
                                </button>
                               
                            </dd>
                        </dl>
                    </li>
                   
                </ul>
            </div>
            <div class="add2">
                <div class="send_message">
                    <button type="button" id="modal_open_btn5">판매자에게 쪽지보내기</button>
                </div>
                <div class="contain_member">
                    <div class="member_list">
                        <div class="box1">채팅참여자 ID목록</div>
                        <div class="box2">총 인원 0명</div>
                    </div>
                    <div class="chat_list" name="" id="" cols="30" rows="10"></div>
                </div>
            </div>
        </div>
    </div> 
    
    <div class="modal_layer">
        <div id="modal">
            <div class="modal_content">
              <div class="box box1">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MjBfMjU2%2FMDAxNjU4Mjc5MzYwNjcw.5MVjAvre4v-ACGC7cXELJOcBA0x20xDAcxHRHJOnJY8g.8kbITvud_Ao-IhT6bEtBv95FpwSbTkZb4GiDDKukKzgg.PNG.smcho2002%2F1.png&type=sc960_832" alt="">
                <a href="#"></a>
              </div>
              <div class="box box2">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MzFfNjYg%2FMDAxNjIyNDY0NjMwMzg4.hY-FUGvamGoj-AcXRHGKyhdQKYehRu7Bx-nYcIlibd4g.tTMZBZsCS1nfVFlz6-uyb7u656Gf06y4mYhGzlzOwusg.PNG.futurara%2F5.png&type=sc960_832" alt="">
                <a href="#"></a>
              </div>
              <div class="box box3">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA0MjVfMjgx%2FMDAxNTI0NjMzMTk5MTg5.LPGkH3KNG5zS5J3abfWHuCu8EXoA24cbNAcexLuWmgMg.9OJE4qEVGIG7PhfciJSB-pWbbbHHjkja-vzrxb5qfl4g.PNG.dc-club%2F%25C0%25CE%25BD%25BA%25C5%25B8%25B1%25D7%25B7%25A5.png&type=sc960_832" alt="">
                <a href="#"></a>
              </div>
              <div class="box box4">
                <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F293%2F2018%2F11%2F30%2F0000023210_001_20181130102430310.jpg&type=sc960_832" alt="">
                <a href="#"></a>
              </div>
            </div>
            <button type="submit" id="modal_copy_btn">링크 복사하기</button>
            <button type="button" id="modal_close_btn">공유 취소하기</button>
        </div>
    </div>
    
    <div class="modal_layer modal_layer1">
        <div id="modal">
        	<div id="tabl4">
             <div class="modal_content1">
                 회원님의 입찰신청 가격은 : $ ${lastAuctionRecord.getAr_next_bid_price()} 입니다. <br> <!-- get안쓰고 .ar_next_bid_price-->
                    입찰하시겠습니까?
             </div>
            </div>
            <button type="submit" id="modal_double_btn1">x  2 입찰하기</button>
            <button type="button" id="modal_close_btn1">입찰 취소</button>
            <button type="submit" id="modal_confirm_btn1">입찰 확인</button>
        </div>
    </div>
    

    <div class="modal_layer modal_layer2">
        <div id="modal">
            <div class="modal_content2">
                <div class="box" id="tabl5">
                    <ul>
                        <li>현재 입찰가($) : $ ${lastAuctionRecord.getAr_bid_price()}</li>
	    				<li>환율 : </li>
	    				<li>₩표시 가격 :</li>
                    </ul>
                </div>
            </div>
            <button type="button" id="modal_close_btn2" class="close_btn">닫기</button>
        </div>
    </div>
    <div class="modal_layer modal_layer3">
        <div id="modal">
            <div class="modal_content2">
                <h1 style="font-size: 14px; text-align: center;">입찰내역</h1>
                <div class="textarea_container" style="padding: 0px 0px 5px 0px; overflow: scroll;overflow-x: hidden; border: none; height: 65%" >
                <ul id="tabl1">
                	<c:forEach items="${auctionRecordList}" var="item" varStatus="status">
				    	<li style="font-size: 12px; margin: 1px">입찰시간:${item.ar_bid_time} 입찰가격:${item.ar_bid_price} 입찰자:${item.ar_me_id}</li>
				    </c:forEach>
                </ul>
               	</div>
            </div>
            <button type="button" id="modal_close_btn3" class="close_btn">닫기</button>
        </div>
    </div>
    <form action="<c:url value='/report'></c:url>" method="post">
        <div class="modal_layer modal_layer4">
            <div id="modal">
                <div class="modal_content3">
                        <select name="re_rc_num" style="border-radius: 20px; padding: 5px; border: 2px solid black; font-weight: bold;" >
                            <c:forEach items="${reportCategory}" var="bo" varStatus="vs">
                            <option value="${bo.rc_num}">${bo.rc_name}</option>
                            </c:forEach>
                        </select>
                        <input type="hidden" name="re_me_id" value="${user.me_id}">
                        <input type="text" placeholder="아이디코드" name="re_report_id" style="border-radius: 20px; padding: 5px; margin-left: 5px; border: 2px solid #ccc; width: 35%">
                        <input type="text" placeholder="상품코드" name="re_report_product" style="border-radius: 20px; padding: 5px; margin-left: 5px; border: 2px solid #ccc; width: 35%">
                        <div class="textarea_container">
                            <textarea name="re_content"  cols="30" rows="10" style="width: 100%; padding: 5px; border-radius: 20px; box-sizing: border-box; height: 100%; border: none;" placeholder="내용을 입력해주세요."></textarea>
                        </div>
                </div>
                <button type="button" id="modal_close_btn4" class="close_btn1">닫기</button>
                <button type="submit" id="modal_confirm_btn4" class="confirm_btn1">확인</button>
            </div>
        </div>
    </form>
    <form action="<c:url value='/message'></c:url>" method="post" class="message">
        <div class="modal_layer modal_layer5">
            <div id="modal">
                <div class="modal_content3">
                        <input type="text" placeholder="제목을 입력해주세요." name="me_title" style="width: 100%; margin-top: 10px; border-radius: 20px; padding: 5px; box-sizing: border-box; border: 2px solid #ccc;">
                        <input name="me_content"style="border: none; width: 100%; height: 400px	; border-radius: 20px; padding: 10px; box-sizing: border-box; border: 2px solid #ccc; margin-top: 5px" placeholder="내용을 입력해주세요.">
                        <input type="hidden" name="me_send_id" value="${user.me_id}">
                        <input type="hidden" name="me_receive_id" value="${auctionSeller.me_id}">
                </div>
                <button type="button" id="modal_close_btn5" class="close_btn2">닫기</button>
                <button type="submit" id="modal_confirm_btn5" class="confirm_btn2">보내기</button>
            </div>
        </div>
    </form>
   
    
        <div class="modal_layer modal_layer6">
            <div id="modal">
                <div class="modal_content3">
                    <c:forEach items="${boardList}" var="bl" varStatus="vs">
					      <label>
					        <input type="checkbox" id="delivery_num" name="bl_num" value="${bl.bl_num}">
					        	${bl.bl_name} : ${bl.bl_detail_address}
					      </label>
					      <br>
				    </c:forEach>
                </div>
                <button type="button" id="modal_close_btn6" class="close_btn2">닫기</button>
                <button type="button" id="modal_confirm_btn6" class="confirm_btn2">저장하기</button>
            </div>
        </div>
    
    <div id="tabl9">
    <input type="hidden" id="nextPrice" value="${lastAuctionRecord.getAr_next_bid_price()}">
    </div>
    <input type="hidden" id="sellerLikeState" value="${sellerLikeState}">
    <input type="hidden" id="productLikeState" value="${productLikeState}">
    <input type="hidden" id="intEnd" value="999999">
    <div id="tabl10">
    <input type="hidden" id="bidder" value="${lastAuctionRecord.getAr_me_id()}">
    </div>
    <div id="tabl11">
    <input type="hidden" id="intNow" value="${intNow}">
    </div>
	<div id="myPopup" class="popup">
      <div class="popup-content" onmousedown="dragPopup(event)">
        <div class="close-popup">
          <span class="close" onclick="closePopup()">&times;</span>
        </div>
        <div clase="message-table">
          <table class="auction-message">
            <thead>
              <tr>
                <th style="width:10% ">쪽지번호</th>
                <th style="width:20% ">수신시간</th>
                <th style="width:10% ">보낸 ID</th>
                <th style="width:30% ">   제목   </th>
                <th style="width:30% ">   내용   </th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${messageList}" var="me" varStatus="vs">
                <tr>
                  <td>${vs}</td>
                  <td>${me.me_time}</td>
                  <td>${me.me_send_id}</td>
                  <td>${me.me_title}</td>
                  <td>${me.me_content}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
    	
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper(".mySwiper", {
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
        });
        var swiper2 = new Swiper(".mySwiper2", {
        spaceBetween: 10,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        thumbs: {
            swiper: swiper,
        },
        });
    </script>
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
    <script>
    $(document).ready(function(){ 
    	let sellerLikeState = $("#sellerLikeState").val();

        if(sellerLikeState == 1){ // == 는 값만 같아도 같다고 인식, === 는 값과 타입 모두 같아야 같다고 인식
            $('.sel_btn span').prop('id','heart1');
        }else if(sellerLikeState == 0){
            $('.sel_btn span').prop('id','');
        }
    });
    $(document).ready(function(){ 
	    $('.product-seller .sel_btn').click(function(){
	        let identify;
	        if($('.sel_btn span').prop('id') === ''){
	            identify = true;
	        }else{ 
	            identify = false;
	        }
	        if(identify){
	            $('.sel_btn span').prop('id','heart1');
	        }else{
	            $('.sel_btn span').prop('id','');
	        }
	    });
    });
    $(document).ready(function(){ 
    	let productLikeState = $("#productLikeState").val();

        if(productLikeState == 1){ // == 는 값만 같아도 같다고 인식, === 는 값과 타입 모두 같아야 같다고 인식
            $('.like_btn span').attr('id','heart2');
        }else if(productLikeState == 0){
            $('.like_btn span').removeAttr('id');
        }
    });
	$(document).ready(function(){
	    $('.itemid .like_btn').click(function(){
	        let identify;
	        if($('.like_btn span').attr('id') === undefined){
	            identify = true;
	        }else{ 
	            identify = false;
	        }
	        if(identify){
	            $('.like_btn span').attr('id','heart2');
	        }else{
	            $('.like_btn span').removeAttr('id');
	        }
	    });  
    });
	$(function(){
	    const modal1 = document.querySelector('.modal_layer')
	    function modalOn() {
	    modal1.style.display = "flex"
	    }
	    function modalOff() {
	    modal1.style.display = "none"
	    }

	    const btnModal = document.getElementById("modal_open_btn")
	    btnModal.addEventListener("click", e => {
	    modalOn()
		})
	    const closeBtn = modal1.querySelector("#modal_close_btn")
	    closeBtn.addEventListener("click", e => {
	    modalOff()
		})
	})
    $(function(){
        const modal1 = document.querySelector('.modal_layer1')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
    
        const btnModal = document.getElementById("modal_open_btn1")
        btnModal.addEventListener("click", e => {
        modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn1")
        closeBtn.addEventListener("click", e => {
        modalOff1()
        })
        const closeBtn1 = modal1.querySelector("#modal_double_btn1")
        closeBtn1.addEventListener("click", e => {
        modalOff1()
        })
        const closeBtn2 = modal1.querySelector("#modal_confirm_btn1")
        closeBtn2.addEventListener("click", e => {
        modalOff1()
        })
    })
    $(function(){
        const modal1 = document.querySelector('.modal_layer2')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
    
        const btnModal = document.getElementById("modal_open_btn2")
        btnModal.addEventListener("click", e => {
        modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn2")
        closeBtn.addEventListener("click", e => {
        modalOff1()
        })
    })
    $(function(){
        const modal1 = document.querySelector('.modal_layer3')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
        
        const btnModal = document.getElementById("modal_open_btn3")
        btnModal.addEventListener("click", e => {
            modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn3")
        closeBtn.addEventListener("click", e => {
            modalOff1()
        })
    })
    $(function(){
        const modal1 = document.querySelector('.modal_layer4')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
        
        const btnModal = document.getElementById("modal_open_btn4")
        btnModal.addEventListener("click", e => {
            modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn4")
        closeBtn.addEventListener("click", e => {
            modalOff1()
        })
        const closeBtn1 = modal1.querySelector("#modal_confirm_btn4")
        closeBtn1.addEventListener("click", e => {
            modalOff1()
            alert("신고가 접수되었습니다.")
        })
    })
    $(function(){
        const modal1 = document.querySelector('.modal_layer5')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
        
        const btnModal = document.getElementById("modal_open_btn5")
        btnModal.addEventListener("click", e => {
            modalOn()
        })
        const closeBtn = modal1.querySelector("#modal_close_btn5")
        closeBtn.addEventListener("click", e => {
            modalOff1()
        })
        const closeBtn1 = modal1.querySelector("#modal_confirm_btn5")
        closeBtn1.addEventListener("click", e => {
            modalOff1()
            alert("쪽지가 전송되었습니다.")
        })
    })
     $(function(){
        const modal1 = document.querySelector('.modal_layer6')
        function modalOn() {
        modal1.style.display = "flex"
        }
        function modalOff1() {
        modal1.style.display = "none"
        }
        
        const btnModal = document.getElementById("delivery_btn");
        btnModal.addEventListener("click", e => {
        	const bidder = document.getElementById("bidder").value;
        	const user = '${user.getMe_id()}';
        	console.log(bidder);
        	console.log(user);
        	if (bidder === user){
        		modalOn();
        	};
        	if (bidder != user){
        		alert("권한이 없습니다.")
        	};
        });
        const closeBtn = modal1.querySelector("#modal_close_btn6")
        closeBtn.addEventListener("click", e => {
            modalOff1()
        })
        const closeBtn1 = modal1.querySelector("#modal_confirm_btn6")
        closeBtn1.addEventListener("click", e => {
        	var num =  $("#delivery_num:checked").val();
        	
        	$.ajax({
    			type: 'POST',
				url: '<c:url value="/delivery"></c:url>',
				data: JSON.stringify(num), //두개이상보낼때는 json.stringify제거
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					if(result.res){
						console.log("success");
						}
				},
				error : function () {
					console.log("error");
				},
    		});
            modalOff1()
            alert("배송받을 주소록이 저장되었습니다.")
        })
    })
    setInterval(() => {
		$('#tabl1').load(location.href + ' #tabl1')
	}, 1000);
	setInterval(() => {
		$('#tabl2').load(location.href + ' #tabl2')
	}, 1000);
	setInterval(() => {
		$('#tabl3').load(location.href + ' #tabl3')
	}, 1000);
	setInterval(() => {
		$('#tabl4').load(location.href + ' #tabl4')
	}, 1000);
	setInterval(() => {
		$('#tabl5').load(location.href + ' #tabl5')
	}, 1000);
	setInterval(() => {
		$('#tabl6').load(location.href + ' #tabl6')
	}, 1000);
	setInterval(() => {
		$('#tabl7').load(location.href + ' #tabl7')
	}, 1000);
	setInterval(() => {
		$('#tabl9').load(location.href + ' #tabl9')
	}, 1000);
	setInterval(() => {
		$('#tabl10').load(location.href + ' #tabl10')
	}, 1000);
	setInterval(() => {
		$('#tabl11').load(location.href + ' #tabl11')
	}, 1000);
	//setInterval(finishAuction, 1000);
   
	var interval = setInterval(function() {
		
		var now = $("#intNow").val();
		var end = $("#intEnd").val();
		
		var formData = {
	        	 value1 : now,
	        	 value2 : end
	        }	
    		$.ajax({
    			type: 'POST',
				url: '<c:url value="/auctionFinish"></c:url>',
				data: JSON.stringify(formData), //두개이상보낼때는 json.stringify제거
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					if(result.res == false){
						console.log("경매 진행중");
					}
					if(result.res == true){
						let str = '';
						str += 
						'<div id="">'+
	                        '<dl>'+
		                        '<dt>'+'입찰가능시간'+'</dt>'+
		                        '<dd class="korEndTime" style="font-weight: bold; color: green;">'+
		                        	'경매가 종료되었습니다.'+
		                        '</dd>'+
	                    	'</dl>'+
            			'</div>'
	                  	$('#tabl8').html(str);
	                  	$('#delivery_btn').css("display", "inline-block");
	                  	$('#modal_open_btn1').css("display", "none");
            			
            			alert("경매가 종료되었습니다.");
						console.log("경매 종료");
						clearInterval(interval) 
					}
				},
				error : function () {
					console.log("error");
				},
    		});	
		}, 1000)
	/*function finishAuction(){
		var now = $("#intNow").val();
		var end = $("#intEnd").val();
		
		var formData = {
	        	 value1 : now,
	        	 value2 : end
	        }
	        	
    		$.ajax({
    			type: 'POST',
				url: '<c:url value="/auctionFinish"></c:url>',
				data: JSON.stringify(formData), //두개이상보낼때는 json.stringify제거
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					if(result.res == false){
						console.log("경매 진행중");
					}
					if(result.res == true){
						let str = '';
						str += 
						'<div id="">'+
	                        '<dl>'+
		                        '<dt>'+'입찰가능시간'+'</dt>'+
		                        '<dd class="korEndTime" style="font-weight: bold; color: green;">'+
		                        	'경매가 종료되었습니다.'+
		                        '</dd>'+
	                    	'</dl>'+
            			'</div>'
	                  	$('#tabl8').html(str);
	                  	$('#delivery_btn').css("display", "inline-block");
	                  	$('#modal_open_btn1').css("display", "none");
            			
            			alert("경매가 종료되었습니다.");
						console.log("경매 종료");
					}
				},
				error : function () {
					console.log("error");
				},
    		});	
	};*/
    $('#modal_confirm_btn1').click(function () {
        var price =	$("#nextPrice").val();
        var end  = $("#intEnd").val();
        
        	
        var formData = {
        	 value1 : price,
        	 value2 : end
        }
        	
        		$.ajax({
        			type: 'POST',
    				url: '<c:url value="/auctionBid"></c:url>',
    				data: JSON.stringify(formData), //두개이상보낼때는 json.stringify제거
    				dataType:"JSON",
    				contentType:"application/json; charset=UTF-8",
    				success: function(result){
    					if(result.res == true){
    						alert("입찰신청 가격으로 입찰하였습니다.");
    						$("#nextPrice").val(result.nextPrice);
    						$("#intEnd").val(result.intEnd);	
    						//location.reload() //새로고침 코드
    						}
    					else if(result.bidPossible == false){
    						alert("경매시작전 입니다.")
    					}
    					else if(result.res == false) {
    						alert("보유계좌에 잔액이 부족합니다.");
    					}
    				},
    				error : function () {
    					console.log("error");
    				}
        		});
        });
    $('#modal_double_btn1').click(function () {
    	 var price =	$("#nextPrice").val() * 2;
         var end  = $("#intEnd").val();
         
         	
         var formData = {
         	 value1 : price,
         	 value2 : end
         }
         	
         		$.ajax({
         			type: 'POST',
     				url: '<c:url value="/auctionBid"></c:url>',
     				data: JSON.stringify(formData), //두개이상보낼때는 json.stringify제거
     				dataType:"JSON",
     				contentType:"application/json; charset=UTF-8",
     				success: function(result){
     					if(result.res == true){
     						alert("입찰신청 가격의 2배로 입찰하였습니다.");
     						$("#nextPrice").val(result.nextPrice);
     						$("#intEnd").val(result.intEnd);	
     						//location.reload() //새로고침 코드
     						}
     					else if(result.bidPossible == false){
     						alert("경매시작전 입니다.")
     					}
     					else if(result.res == false) {
     						alert("보유계좌에 잔액이 부족합니다.");
     					}
     				},
     				error : function () {
     					console.log("error");
     				}
         		});
         });
    $('.product-seller .sel_btn').click(function () {
    	let sellerLikeState = $("#sellerLikeState").val();
    		$.ajax({
    			type: 'POST',
				url: '<c:url value="/sellerLike"></c:url>',
				data: JSON.stringify(sellerLikeState),
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					if(result.res){
						alert("'판매자 좋아요'를 했습니다.")
						$("#sellerLikeState").val(result.sellerLikeState);
						}
					else if(result.res == false){
						alert("'판매자 좋아요'를 취소했습니다.")
						$("#sellerLikeState").val(result.sellerLikeState);
					}
					
				},
				error : function () {
					console.log("error");
				}
    		});
    });
    $('.itemid .like_btn').click(function () {
    	let productLikeState = $("#productLikeState").val();
    		$.ajax({
    			type: 'POST',
				url: '<c:url value="/productLike"></c:url>',
				data: JSON.stringify(productLikeState),
				dataType:"JSON",
				contentType:"application/json; charset=UTF-8",
				success: function(result){
					if(result.res){
						alert("'상품 좋아요'를 했습니다.")
						$("#productLikeState").val(result.productLikeState);
						}
					else if(result.res == false){
						alert("'상품 좋아요'를 취소했습니다.")
						$("#productLikeState").val(result.productLikeState);
					}
					
				},
				error : function () {
					console.log("error");
				}
    		});
    });
    $('#message_send').click(function () {
    	$('#messageinput').val('');
    });
    </script>
    <script type="text/javascript">
    var popup = document.getElementById("myPopup");
    var mouseOffset = { x: 0, y: 0 };

    function openPopup() {
      popup.style.display = "block";
    }

    function closePopup() {
      popup.style.display = "none";
    }

    function dragPopup(event) {
      mouseOffset.x = event.clientX - popup.offsetLeft;
      mouseOffset.y = event.clientY - popup.offsetTop;
      document.addEventListener("mousemove", movePopup);
      document.addEventListener("mouseup", releasePopup);
    }

    function movePopup(event) {
      popup.style.left = (event.clientX - mouseOffset.x) + "px";
      popup.style.top = (event.clientY - mouseOffset.y) + "px";
    }

    function releasePopup() {
      document.removeEventListener("mousemove", movePopup);
      document.removeEventListener("mouseup", releasePopup);
    }
    </script>
    <script type="text/javascript">
       
      	var ws;
        var messages = document.getElementById("messages");
        
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("WebSocket is already opened.");
                console.log();
                console.log();
                return;
            }
            //웹소켓 객체 만드는 코드 - 서버의 @OnOpen을 실행시킴
            ws = new WebSocket("ws://localhost:8080/OnAirAuction/echo.do/${chattingChannel}/${userId}");
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return;
                }
                writeResponse(event.data);
            };
            
            ws.onmessage = function(event){ 
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
                console.log();
            };
            
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        function send(){ 
            var text = document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+document.getElementById("room").value;
            
            
            var message = document.getElementById("messageinput").value;
            var sender  = document.getElementById("sender").value;
            var channel = document.getElementById("room").value;
            	
            var formData = {
            	 value1 : message,
            	 value2 : sender,
            	 value3 : channel
            }	
       		$.ajax({
       			type: 'POST',
   				url: '<c:url value="/chattingJoin"></c:url>',
   				data: JSON.stringify(formData), //두개이상보낼때는 json.stringify제거
   				dataType:"JSON",
   				contentType:"application/json; charset=UTF-8",
   				success: function(result){
   					if(result){
   						console.log("서버에 전달 성공");
   					} 
   				},
   				error : function () {
   					console.log("error");
   				}
       		});
            ws.send(text);
            console.log(text);
            text = "";
        }
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
            messages.innerHTML += "<br>"+text;
        }

        
  </script>

</body>
</html>