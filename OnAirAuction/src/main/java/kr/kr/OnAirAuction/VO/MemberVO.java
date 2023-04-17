package kr.kr.OnAirAuction.VO;

import lombok.Data;

// 회원 객체

@Data
public class MemberVO {
	
	String me_id;
	
	String me_pw;

	@Override
	public String toString() {
		
		return "아이디 : " + me_id + " 비밀 번호 : "  + me_pw;
		
	}
	
}