package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class PersonSearchVO {

	String me_id;
	
	String me_name;

	@Override
	public String toString() {
		
		return "회원 아이디 : " + me_id + " 회원 이름 : " + me_name;
		
	}
	
}