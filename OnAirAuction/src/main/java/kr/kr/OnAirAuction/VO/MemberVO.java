package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

// 회원 객체

@Data
public class MemberVO {
	
	String me_id;
	
	String me_pw;
	
	String me_email;
	
	String me_board;
	
	String me_phone;
	
	String me_name;
	
	String addr2;
	
	String addr3;
	
	String me_birth;
	
	int me_certification;
	
	Date me_join_time;
	
	boolean autoLogin;
	
	String me_session_id;
	
	Date me_session_limit;
	
	/*public String getMe_birth() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(me_birth);
		
	}*/
	
	public String getMe_join_time() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(me_join_time);
		
	}
	
	public String getMe_session_limit() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(me_session_limit);
		
	}

	@Override
	public String toString() {
		
		return "회원 아이디 : " + me_id + " 비밀번호 : " + me_pw + " 이메일 주소 : " + me_email + " 회원 집 주소 : " + me_board + " 회원 핸드폰 번호 : " + me_phone
				
				+ " 회원 이름 : " + me_name + " 회원 주소 1 : " + addr2 + " 회원 주소 3 : " + addr3 + " 회원 생일 : " + me_birth + "  회원 인증여부 : " + me_certification +
				
				" 회원 가입 일시 : " + me_join_time;
				
	}
	
}