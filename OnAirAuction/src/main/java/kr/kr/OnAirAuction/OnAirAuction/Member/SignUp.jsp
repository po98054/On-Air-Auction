<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="<c:url value='/resources/js/jquery.min.js'></c:url>"></script>

<script src="<c:url value='/resources/js/jquery.validate.js'></c:url>"></script>

<script src="<c:url value='/resources/js/additional-methods.js'></c:url>"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>

	label.error{color:red;}

	*{
			box-sizing: border-box; /*전체에 박스사이징*/
			outline: none; /*focus 했을때 테두리 나오게 */
	}
	body{
			font-family: 'Noto Sans KR', sans-serif;
			font-size:14px;
			background-color: #f5f6f7;
			line-height: 1.5em;
			color : #222;
			margin: 0;
	}
	a{
			text-decoration: none;
			color: #222;
	}
	.member{
			width: 400px;
			margin: auto; 
			padding: 0 20px;
			margin-bottom: 20px;
	}
	.member .signup-logo{
			display: block;
			margin :50px auto;
	}
	.member .field{
			margin :5px 0; 
	}
	.member b{
			margin-bottom: 5px;
	}
	.member input:not(input[type=radio]),.member select{
			border: 1px solid #dadada;
			padding: 15px;
			width: 100%;
			margin-bottom: 5px;
	}
	.member input[type=button],
	.member input[type=submit]{
		background-color: #2db400;
		color:#fff
	}
	.member input:focus, .member select:focus{
			border: 1px solid #2db400;
	}

	.field.tel-number div {
			display: flex;
	}
	.field.tel-number div input:nth-child(1){
			flex:2;
	}
	.field.tel-number div input:nth-child(2){
			flex:1;
	}
	.field.gender div{
			border: 1px solid #dadada;
			padding: 15px 5px;
			background-color: #fff;
	}
	.placehold-text{
			display: block; 
			position:relative;
	}
	.placehold-text:before{ 
			content : "@naver.com";
			position:absolute; 
			right : 20px;
			top:13px;
			pointer-events: none; 
	}
	@media (max-width:768px) {
			.member{
					width: 100%;
			}
	}
</style>

<body>
    <form action="" method="post">
			<div class="member">
				<!-- 1. 로고 -->
				<div class="signup-logo">
					<h1>logo</h1>
				</div>

				<!-- 2. 필드 -->
				<div class="field">
						<b>아이디</b>
						<span class="placehold-text"><input type="text" id="id" name="me_id"></span>
				</div>
				<button class="btn-check-id" type="button">아이디 중복체크</button>
				<div class="field">
						<b>비밀번호</b>
						<input class="userpw" type="password" id="pw" name="me_pw">
				</div>
				<div class="field">
						<b>비밀번호 재확인</b>
						<input class="userpw-confirm" type="password" id="pw2" name="me_pw2">
				</div>
				<div class="field">
						<b>이름</b>
						<input type="text" name="me_name">
				</div>
				<!-- 3. 필드(생년월일) -->
				<div class="field birth">
						<b>생년월일</b>
						<div>
							<input type="text" placeholder="89-11-17" id="birthday" name="me_birth">
						</div>
				</div>
				<!-- 4. 필드(성별) -->
				<div class="field gender">
						<select>
							<option value="0">성별</option>
							<option value="1">남자</option>
							<option value="2">여자</option>
							<option value="3">선택 안함</option>
						</select>
				</div>
				<!-- 5. 이메일_전화번호 -->
				<div class="field">
						<b>본인 확인 이메일<small>(선택)</small></b>
						<input type="email" placeholder="선택입력" id="email" name="me_email">
				</div>
				<div class="field tel-number">
						<b>휴대전화</b>
						<select>
								<option value="">대한민국 +82</option>
						</select>
								<input type="tel" placeholder="전화번호 입력" name="me_phone">
				</div>
				<!-- 7. 주소 -->
				<div class="form-group">                   
					<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="me_post_num" id="addr1" type="text" readonly="readonly" >
    				<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>                               
				</div>
				
				<div class="form-group">
    				<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="me_road_name" id="addr2" type="text" readonly="readonly" />
				</div>
				
				<div class="form-group">
    				<input class="form-control" placeholder="상세주소" name="me_detail_address" id="addr3" type="text"  />
				</div>

				<!-- 6. 가입하기 버튼 -->
				<input type="submit" value="가입하기">
			</div>
		</form>
</body>
<script>

$('form').validate({
	rules:{
		me_id : {
			required : true,
			regex : /^[a-zA-Z][a-zA-Z0-9!@#$]{4,12}$/
		},
		me_pw : {
			required : true,
			regex : /^[a-zA-Z0-9!@#$]{8,20}$/
		},
		me_pw2 : {
			equalTo : pw
		},
		me_email : {
			required : true,
			email : true
		},
		me_birth : {
			required : true,
			date : true
		}
	},
	messages:{
		me_id : {
			required : '필수 항목입니다.',
			regex : '아이디는 영문자로 시작하며, 영문,숫자,!@#$를 이용하여 5~13까지 가능합니다.'
		},
		me_pw : {
			required : '필수 항목입니다.',
			regex : '비번은 영문,숫자,!@#$를 이용하여 8~20까지 가능합니다.'
		},
		me_pw2 : {
			equalTo : '비번과 일치하지 않습니다.'
		},
		me_email : {
			required : '필수 항목입니다.',
			email : '이메일 형식이 아닙니다.'
		},
		me_birth : {
			required : '필수 항목입니다.',
			date : '날짜 형식이 아닙니다.'
		}
	},
	
	submitHandler: function(form) {
		if(!idCheck){
			alert('아이디 중복체크를 하세요.');
			return false;
		}
		return true;
	}
	
});

$.validator.addMethod(
	"regex",
	function(value, element, regexp) {
		var re = new RegExp(regexp);
		return this.optional(element) || re.test(value);
	},
	"Please check your input."
);

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

$('.btn-check-id').click(function(){
	let me_id = $('[name=me_id]').val();
	let obj = {
			me_id : me_id
	}
	$.ajax({
		async:true,
		type:'POST',
		data: JSON.stringify(obj),
		url: '<c:url value="/check/id"></c:url>',
		dataType:"json",
		contentType:"application/json; charset=UTF-8",
		success : function(data){
		    if(data.res){
		    	alert('사용 가능한 아이디입니다.');
		    	idCheck = true;
		    }else{
		    	alert('이미 사용중인 아이디입니다.')
		    }
		},
		error : function(a,b,c){
			
		}
	});
});
$('[name=me_id]').change(function(){
	idCheck = false;
});
let idCheck = false;

</script>