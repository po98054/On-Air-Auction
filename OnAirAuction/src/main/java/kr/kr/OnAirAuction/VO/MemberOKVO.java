package kr.kr.OnAirAuction.VO;

import java.util.Date;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberOKVO {
	
	String ce_me_id;
	
	String ce_certificationnumber;
	
	Date ce_time;

	@Override
	public String toString() {
		
		return "회원 인증 아이디 : " + ce_me_id + " 회원 인증 번호 : " + ce_certificationnumber + " 회원 인증 시간 : " +  ce_time;
		
	}
	
	public MemberOKVO(String ce_me_id, String ce_certificationnumber) {
		
		this.ce_me_id = ce_me_id;
		
		this.ce_certificationnumber = ce_certificationnumber;
		
		this.ce_time = new Date();
		
	}

}