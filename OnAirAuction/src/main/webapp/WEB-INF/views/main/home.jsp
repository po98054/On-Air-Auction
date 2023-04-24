<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'></c:url>"></script>

<style>

.body{
        height: 700px; width: 1900px; 
	}
	.body .body-left{
		float:left; width: 250px; height:700px; border-right: 1px solid black;
	}
	.body .body-left .nav-ul{
		margin-top: 5px;
	}
    .body .body-left .nav-ul .list-li:nth-child(1){
        width: 250px; height: 180px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(2){
        width: 250px; height: 120px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(3){
        width: 250px; height: 90px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(4){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(5){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold; border-bottom: 1px solid black;
    }
    .body .body-left .nav-ul .list-li:nth-child(6){
        width: 250px; height: 100px; margin-bottom: 3px; font-weight: bold;
    }
	.body .body-left .nav-ul .list-li .item-a{
		display: inline-block; padding-top: 2px; color:black; margin-top: 6px; font-weight: normal;
	}
	.body .body-middle{
		float:left; width: 1400px; height: 700px; border-right: 1px solid black;
	}
	.body .body-middle .middle{
		width: 1400px; height: 50px; 
	}
	.body .body-middle .middle .beforeMonth{
		float:left; width: 400px; height: 50px; 
	}
	.body .body-middle .middle .beforeMonth .Month{
		margin-top: 10px; margin-bottom: 20px; margin-left: 70px;
	}
	.body .body-middle .middle .beforeMonth .data{
		margin-left: 15px; color:black;
	}
	.body .body-middle .middle .auction-list{
		float: left; width: 500px;  height: 50px; margin-top: 30px; margin-left: 110px;
	}
	.body .body-middle .Result-Data{
		width: 900px; height: 500px; margin-top: 60px; margin-left: 5px; 
	}
	.body .body-middle .Result-Data table{
		border: 1px solid black; border-collapse: collapse; width: 1350px; height: 50px;
	}
	.body .body-middle table th{
		border: 1px solid black; text-align: center;
	}
	.body .body-middle table th:nth-child(1){
		width: 70px;
  }
  .body .body-middle table th:nth-child(2){
    width: 90px;
  }
  .body .body-middle table th:nth-child(3){
    width: 250px;
  }
  .body .body-middle table th:nth-child(4){
    width: 100px;
  }
  .body .body-middle table th:nth-child(5){
    width: 200px;
  }
  .body .body-middle table th:nth-child(6){
    width: 200px;
  }
  .body .body-middle table th:nth-child(7){
		width: 120px;
    }
    .body .body-middle table th:nth-child(8){
			width: 120px;
    }
    .body .body-middle table td{
		border: 1px solid black; text-align: center; height: 30px;
		}
    .body .body-middle table td .auction{
        color: blue;
    }
    .body .body-middle table td .product{
        color: green;
    }
    .body .body-middle .search{
        margin-left: 500px; 
    }
    .body .body-middle .search button{
        border-radius: 10px; background: black;
        color: #fff; cursor: pointer;
    }

</style>

 <div class="body">
		<div class="body-left">		
			<ul class="nav-ul">		
				<li class="list-li">구매자<br>
					<a href="#" class="item-a">경매 참가 내역(일반/실시간 경매)</a><br>
                    <a href="#" class="item-a">경매 참가 내역(인원수 제한 경매)</a><br>
                    <a href="#" class="item-a">경매 개최 내역</a><br>
                    <a href="#" class="item-a">주문 내역</a><br>
                    <a href="#" class="item-a">환불 내역</a>
				</li>
				<li class="list-li">판매자<br>
					<a href="#" class="item-a">경매 참가 내역</a><br>
                    <a href="#" class="item-a">경매 개최 내역</a><br>
                    <a href="#" class="item-a">판매 내역</a>
				</li>	
				<li class="list-li">후기<br>
					<a href="#" class="item-a">후기 작성</a><br>
                    <a href="#" class="item-a">후기 조회</a>	
				</li>	
				<li class="list-li">신고<br>
					<a href="#" class="item-a">신고 작성</a><br>
                    <a href="#" class="item-a">신고 조회</a>	
				</li>	
				<li class="list-li">문의 사항<br>	
					<a href="#" class="item-a">문의 사항 등록</a><br>
                    <a href="#" class="item-a">문의 사항 조회</a>
				</li>
				<li class="list-li">회원<br>
					<a href="#" class="item-a">회원 정보 수정</a><br>
                    <a href="#" class="item-a">회원 탈퇴</a>
				</li>		
			</ul>		
		</div>
		<div class="body-middle">
			<div class="middle">	
				<div class="beforeMonth">	
					<ul class="Month">	
						<li style="text-align: center;">기간별 데이터 조회</li>	
					</ul>
					<form name="searchFrm" style="width:350px; height:30px; margin-left: 65px;">
						<input type="date" class="fromDate" name="fromDate" id="fromDate" style="width: 120px;" value="${pm.criteria.fromDate}"> ~ &nbsp;
						<input type="date" class="toDate" name="toDate" id="toDate" style="width: 120px; value="${pm.criteria.toDate}">
						<button type="submit" class="btn-success" id="btnSearch">검색</button>
					</form>
				</div>	
				<div class="auction-list">	
					<h1 style="text-align: center;">경매 개최 내역 - 역경매</h1>
				</div>	
			</div>
			<div class="Result-Data">
				<table>
					<thead>
						<tr>
							<th>선택</th>
							<th>경매 번호</th>
							<th>경매 물품명</th>
							<th>최초 입찰가</th>
							<th>경매 시작 시간</th>
							<th>경매 종료 시간</th>
							<th>경매 상태</th>
              <th>즉시 가격</th>
						</tr>
					</thead>
          	<tbody>
            	<tr>
								<td>
									<input type="checkbox" id="check">
								</td>
              	<td>
                	<a href="./일반경매.html" class="auction">1111</a>
                </td>
                <td>영덕 대게</td>
                <td>100,000원</td>
                <td>2023-03-15 11:15:00</td>
								<td>2023-03-17 11:15:00</td>
                <td>경매 진행 중</td>
                <td>300,000원</td>
              </tr>
            </tbody>
				</table>
			</div>
            <div class="search">	
                <select name="select">	
                    <option value="">분류</option>	
                    <option value="item">경매 물품명</option>	
            </select>	
            <input type="text" id="select-word">	
            <button>검색</button>
            <button class="btn-cancle" data-toggle="modal" data-target="#myModal">취소</button>
            <a href="./구매등록.html">
                <button class="btn-update">경매 수정</button>
            </a>
            </div>
						
						<div class="modal fade" id="myModal" style="margin-top: 300px;">
							<div class="modal-dialog">
								<div class="modal-content">
								
									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">경매 취소 사유</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>
									
									<!-- Modal body -->
									<div class="modal-body">
										<textarea class="form-control" placeholder="취소 사유를 입력하세요"></textarea>
									</div>
									
									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
									</div>
									
								</div>
							</div>
						</div>	
            <div class="container" style="margin-top: 10px;">
                <ul class="pagination justify-content-center">
                    <li><a class="page-link" href="#">이전</a></li>
                    <li><a class="page-link" href="#">1</a></li>
                    <li><a class="page-link" href="#">2</a></li>
                    <li><a class="page-link" href="#">다음</a></li>
                </ul>
            </div>
		</div>
    </div>