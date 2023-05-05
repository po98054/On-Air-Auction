<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<div class="container">
	<h1>주소록</h1>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>이름</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody style="border: 1px solid black;">
			<c:forEach items="${list}" var="ab" varStatus="vs">
				<tr style="margin-bottom: 10px;">
					<form action="<c:url value='/AddressBook/update'></c:url>" method="post">
						<td class="form-group">${ab.bl_num}<input type="hidden" name="bl_num" value="${ab.bl_num}"></td>
						<td class="form-group">
							<input type="text" class="form-control" value="${ab.bl_name}" name="bl_name">
						</td>
						<td class="form-group" style="">
							<input class="form-control" style="margin-left: 15px; width: 40%; display: inline;" placeholder="우편번호" name="bl_post_num" id="addr1" type="text" readonly="readonly" value="${ab.bl_post_num}">
    						<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    					</td>
    					<td>
    						<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="bl_road_name" id="addr2" type="text" readonly="readonly" value="${ab.bl_road_name}"/>
    						<input class="form-control" placeholder="상세주소" name="bl_detail_address" id="addr3" type="text" value="${ab.bl_detail_address}"/>
						</td>
						<td>
							<button class="btn btn-outline-warning btn-up" style="margin-left: 20px;">수정</button>
							<button class="btn btn-outline-danger btn-del">삭제</button>
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot >
			<tr style="margin-top: 60px;">
				  <form action="<c:url value='/AddressBook/insert'></c:url>" method="post">
					<td class="form-group">
						<input type="text" class="form-control" name="bl_name">
					</td>
					<td class="form-group" style="">
						<input class="form-control" style="margin-left: 15px; width: 40%; display: inline;" placeholder="우편번호" name="bl_post_num" id="addr1" type="text" readonly="readonly" >
    					<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
    				</td>
    				<td>
    					<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="bl_road_name" id="addr2" type="text" readonly="readonly" />
    					<input class="form-control" placeholder="상세주소" name="bl_detail_address" id="addr3" type="text"/>
					</td>
					<td><button class="btn btn-outline-success" style="margin-left: 15px;">등록</button></td>
				</form>
			</tr>
		</tfoot>
	</table>
</div>

<script>

$('.btn-del').click(function(){
	console.log(1);
	let res = confirm('해당 주소를 삭제하시겠습니까??');
	if(!res)
		return false;
	//클릭된 삭제 버튼의 조상 중에 form태그를 찾아서 action부분을 수정
	let url = '<c:url value="/AddressBook/delete"></c:url>';
	$(this).parents('tr').find('form').attr('action', url);
});

function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('addr2').value = fullRoadAddr;
           
           console.log(data.zonecode);
           
           console.log(fullRoadAddr);
           
           console.log(document.getElementById('addr2').value);
           
       }
    }).open();
}

</script>