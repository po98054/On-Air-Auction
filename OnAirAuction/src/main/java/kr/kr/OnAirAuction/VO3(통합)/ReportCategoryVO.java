package kr.kr.OnAirAuction.VO;

import lombok.Data;

// 신고 카데고리 VO

@Data
public class ReportCategoryVO {
	
	int rc_num;
	
	String rc_name;

	@Override
	public String toString() {
		
		return "신고 카데고리 번호 : " + rc_num + " 신고 카데고리 이름 : " + rc_name;
		
	}
	
}