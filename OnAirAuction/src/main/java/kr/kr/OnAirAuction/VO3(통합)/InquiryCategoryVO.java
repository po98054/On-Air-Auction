package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class InquiryCategoryVO {
	
	int ic_num;
	
	String ic_name;

	@Override
	public String toString() {
		
		return "문의 사항 카데고리 번호 : " + ic_num + " 문의 사항 카데고리 이름 : " + ic_name;
		
	}
	
}