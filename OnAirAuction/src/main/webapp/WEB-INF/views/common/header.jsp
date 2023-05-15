<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <div class="containertoo">
        <div class="container-inner1">
            <div class="comList">
                <ul class="list-unstyled">
                    <li class="timer">
                        <span>2023. 2. 20. 19:58:35</span>
                    </li>
                    <li class="clearFix">
                        <p>
                            <i class="lock">로그인하시면 다양한 정보를 보실 수 있습니다.</i>
                        </p>
                    </li>
                </ul>
            </div>
            <div class="comList2">
                <ul class="list-unstyled">
                    <li class="clearFix">
                        <p>
                            <a href="#" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">처음이신가요?</a>
                        </p>
                        <c:if test="${user == null}">
                        <p>
                            <a href="<c:url value='/Login'></c:url>">로그인</a>
                        </p>
                        <p>
                            <a href="<c:url value='/signup'></c:url>">회원가입</a>
                        </p>
                        </c:if>
                        <c:if test="${user != null }">
							<li class="nav-item">
								<a href="<c:url value='/logout'></c:url>">로그아웃</a>
							</li>
						</c:if>
			<p class="auction_massage" onclick="openPopup()">
                        	<a href="#" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">쪽지함</a>
                        </p>    
                        <p>
                            <a href="#" onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">마이페이지</a>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container2">
        <div>
            <a href="#">
                <img src="data:image/jpeg;base64,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" alt="">
            </a>
        </div>
        <ul>
            <li>
                <a href="<c:url value='/general/list'></c:url>" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">일반경매
                    <sup>
                        <font color="red">
                            <b>New</b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">실시간경매
                    <sup>
                        <font color="red">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">역경매
                    <sup>
                        <font color="red">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">직거래경매
                    <sup>
                        <font color="red">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">인원제한경매
                    <sup>
                        <font color="red">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">VIP경매
                    <sup>
                        <font color="red">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <a href="#" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">전체메뉴
                    <sup>
                        <font color="">
                            <b></b>
                        </font>
                    </sup>
                </a>
            </li>
            <li>
                <button class="addProduct" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">물품등록</button>
            </li>
            <li class="smallList1">
                <select name="datafield" id="">
                    <option value="">물품명</option>
                    <option value="">판매자ID</option>
                </select>
            </li>
            <li class="smallList2">
                <input type="text" class="search" placeholder="검색어를 입력해주세요.">
                <button onmouseover="mouseOver1(this)" onmouseout="mouseOut1(this)">검색</button>
            </li>
        </ul>
    </div>
