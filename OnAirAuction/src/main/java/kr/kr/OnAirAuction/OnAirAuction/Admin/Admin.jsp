<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

.body{
        height: 780px; width: 1900px;
	}

</style>

<div class="body">

	<div class="form-group">
		
			<label for="type">카데고리</label>
			
			<select class="form-control" name="category" id="type">
			
				<option value="0">카데고리를 선택하세요.</option>
				
				<option value="1">신고 카데고리</option>
				
				<option value="2">문의 사항 카데고리</option>
				
				<option value="3">경매 카데고리</option>
				
				<option value="4">회원 등급 카데고리</option>
				
			</select>
			
	</div>
	
	<div class="form-group list">
	<table class="table table-hover report" style="display: none;">
		<thead>
			<tr>
				<th>번호</th>
				<th>신고 카데고리명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="bt" varStatus="vs">
				<tr>
					<form action="<c:url value='/admin/ReportCategory/update'></c:url>" method="post"> 
						<td class="form-group">${bt.rc_num}<input type="hidden" name="rc_num" value="${bt.rc_num}"></td>
						<td>
							<input type="text" class="form-control" value="${bt.rc_name}" name="rc_name">
						</td>
						<td>
							<button class="btn btn-outline-warning btn-up">수정</button>
							<button class="btn btn-outline-danger btn-del">삭제</button>
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<form action="<c:url value='/admin/ReportCategory/insert'></c:url>" method="post">
					<td class="form-group"></td>
					<td>
						<input type="text" class="form-control" name="rc_name">
					</td>
					<td><button class="btn btn-outline-success">등록</button></td>
				</form>
			</tr>
		</tfoot>
	</table>
	
	<table class="table table-hover inquiry" style="display: none;">
		<thead>
			<tr>
				<th>번호</th>
				<th>문의 카데고리명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ic}" var="ic" varStatus="vs">
				<tr>
					<form action="<c:url value='/admin/InquiryCategory/update'></c:url>" method="post"> 
						<td class="form-group">${ic.ic_num}<input type="hidden" name="ic_num" value="${ic.ic_num}"></td>
						<td>
							<input type="text" class="form-control" value="${ic.ic_name}" name="ic_name">
						</td>
						<td>
							<button class="btn btn-outline-warning btn-up">수정</button>
							<button class="btn btn-outline-danger delete">삭제</button>
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<form action="<c:url value='/admin/InquiryCategory/insert'></c:url>" method="post">
					<td class="form-group"></td>
					<td>
						<input type="text" class="form-control" name="ic_name">
					</td>
					<td><button class="btn btn-outline-success">등록</button></td>
				</form>
			</tr>
		</tfoot>
	</table>
	
	<table class="table table-hover auction" style="display: none;">
		<thead>
			<tr>
				<th>번호</th>
				<th>경매 카데고리명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ac}" var="ac" varStatus="vs">
				<tr>
					<form action="<c:url value='/admin/AuctionCategory/update'></c:url>" method="post"> 
						<td class="form-group">${ac.ac_num}<input type="hidden" name="ac_num" value="${ac.ac_num}"></td>
						<td>
							<input type="text" class="form-control" value="${ac.ac_name}" name="ac_name">
						</td>
						<td>
							<button class="btn btn-outline-warning btn-up">수정</button>
							<button class="btn btn-outline-danger remove">삭제</button>
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<form action="<c:url value='/admin/AuctionCategory/insert'></c:url>" method="post">
					<td class="form-group"></td>
					<td>
						<input type="text" class="form-control" name="ac_name">
					</td>
					<td><button class="btn btn-outline-success">등록</button></td>
				</form>
			</tr>
		</tfoot>
	</table>
	
	<table class="table table-hover memberShip" style="display: none;">
		<thead>
			<tr>
				<th>회원 등급 명</th>
				<th>등급 수수료</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ms}" var="ms" varStatus="vs">
				<tr>
					<form action="<c:url value='/admin/Membership/update'></c:url>" method="post"> 
						<td>
							<input type="text" class="form-control" value="${ms.ml_name}" name="ml_name">
						</td>
						<td>
							<input type="number" class="form-control" value="${ms.ml_expense}" name="ml_expense">
						</td>
						<td>
							<button class="btn btn-outline-warning btn-up">수정</button>
							<button class="btn btn-outline-danger go">삭제</button>
						</td>
					</form>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<form action="<c:url value='/admin/Membership/insert'></c:url>" method="post">
					<td>
						<input type="text" class="form-control" name="ml_name">
					</td>
					<td>
						<input type="number" class="form-control" name="ml_expense">
					</td>
					<td><button class="btn btn-outline-success">등록</button></td>
				</form>
			</tr>
		</tfoot>
	</table>
	
</div>

</div>

<script>

$('#type').change(function(){

	let a = $(this).val();

	console.log(a);
	
	if(a == 1){
		
		$('.report').show();
		
		console.log(1);
		
		return;
		
	} else if(a == 2){
		
		$('.inquiry').show();
		
		console.log(2);
		
		return;
		
	} else if(a == 3){
		
		$('.auction').show();
		
		console.log(3);
		
		return;
		
	} else if(a == 4){
		
		$('.memberShip').show();
		
		console.log(4);
		
		return;
		
	}
	
	console.log(5);
	
})

$('.btn-del').click(function(){
	console.log(1);
	let res = confirm('해당 카데고리를 삭제하시겠습니까??');
	if(!res)
		return false;
	//클릭된 삭제 버튼의 조상 중에 form태그를 찾아서 action부분을 수정
	let url = '<c:url value="/admin/ReportCategory/delete"></c:url>';
	$(this).parents('tr').find('form').attr('action', url);
});

$('.delete').click(function(){
	console.log(2);
	let res = confirm('해당 카데고리를 삭제하시겠습니까??');
	if(!res)
		return false;
	//클릭된 삭제 버튼의 조상 중에 form태그를 찾아서 action부분을 수정
	let url = '<c:url value="/admin/InquiryCategory/delete"></c:url>';
	$(this).parents('tr').find('form').attr('action', url);
});

$('.remove').click(function(){
	console.log(3);
	let res = confirm('해당 카데고리를 삭제하시겠습니까??');
	if(!res)
		return false;
	//클릭된 삭제 버튼의 조상 중에 form태그를 찾아서 action부분을 수정
	let url = '<c:url value="/admin/AuctionCategory/delete"></c:url>';
	$(this).parents('tr').find('form').attr('action', url);
});

$('.go').click(function(){
	console.log(4);
	let res = confirm('해당 카데고리를 삭제하시겠습니까??');
	if(!res)
		return false;
	//클릭된 삭제 버튼의 조상 중에 form태그를 찾아서 action부분을 수정
	let url = '<c:url value="/admin/Membership/delete"></c:url>';
	$(this).parents('tr').find('form').attr('action', url);
});

</script>