package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class ReportPersonVO {
	
	String me_id;
	
	String me_name;

	@Override
	public String toString() {
		
		return " 아이디 : " + me_id + " 이름 : " + me_name;
		
	}

}