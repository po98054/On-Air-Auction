<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>

<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'></c:url>">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/popper.min.js'></c:url>"></script>

<script src="https://unpkg.com/swiper@9/swiper-bundle.min.js"></script>

<!-- 로그인 화면 -->

<style>

	.body {
        height: 700px; width: 1900px;
    }
    .body #login-app{
        padding: 90px 0 220px;
    }
    .body #login-app .box__login{
        position: relative; margin: 0 auto; width: 750px; border: 1px solid black;
    }
    .body #login-app .box__login .text__header-title{
        margin-bottom: 15px; font-size: 24px; font-weight: 700; line-height: 36px; color: #222;
    }
    .box__login .box__tab-contents{
        display: block; width: 360px;
    }
    ul{
        list-style: none;
    }
    .box__login .list-item__form-input{
        position: relative; background: #fff; border: 1px solid #ddd; margin-top: -1px;
    }
    .box__login .list-item__form-input:first-child{
        margin-top: 0; border-top-color: #ddd;
    }
    .box__login .list-item__form-input .form__input-text{
        width: 100%; height: 50px; padding: 13px 40px 13px 18px; background: #fafafa; border: none; color: #222; font-size: 16px; font-weight: 400; box-sizing: border-box; outline: 0;
    }
    .box__login .button__submit{
        margin: 0; height: 50px; font-size: 18px; line-height: 50px; width: 100%;
    }
    .service__login .button__submit{
        position: relative; display: block; width: 100%; color: #fff; text-align: center; background-color: #e63740;
    }
    .box__login .box__login-action .box__login-link{
        float: right; text-align: center; font-size: 0; margin-right: -7px;
    }
    .box__login .box__login-action .box__login-link .link__login{
        position: relative; display: inline-block; padding: 14px 7px 13px; font-size: 13px; line-height: 19px; color: #999;
    }
    .box__login .box__login-action .box__login-link .link__login:not(:first-child):before{
        content: ''; position: absolute; left: 0; top: 17px; display: block; width: 1px; height: 12px; background: #d8d8d8;
    }
    .box__login .box__login-member .box__login-action:after{
        content: ''; display: block; clear: both;
    }
    
</style>

<div class="body">
<div id="login-app">
    <div class="box__login">
        <p class="text__header-title">로그인</p>
        <form action="<c:url value='/Login'></c:url>" method="post">
        <div class="box__tab-contents">
            <ul class="list__form-input">
            	<li class="list-item__form-input" data-index="0">
                    <label for="type">회원 권한</label>
					<select class="form-control" name="me_authority" id="type" >
						<option value="0">구매자</option>
						<option value="1">판매자</option>
					</select>
                </li>
                <li class="list-item__form-input" data-index="1">
                    <input type="text" id="id" name="me_id" placeholder="아이디">
                </li>
                <li class="list-item__form-input" data-index="2">
                     <input type="password" id="pw" name="me_pw" placeholder="비밀번호">
                </li>
            </ul>
                <button type="submit" class="button__submit">로그인</button>
            <div class="box__login-action">
                <div class="box__login-save">
                    <input type="checkbox" name="autoLogin" value="true"> 자동로그인
                </div>
                <div class="box__login-link">
                    <a href="<c:url value='/signup'></c:url>" target="_blank" class="link__login">회원가입</a>
                </div>
            </div>
        </div>
       	</form>
    </div>
</div>
</div>

