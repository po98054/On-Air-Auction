package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class AddressBookVO {

	int bl_num;
	
	String bl_name;
	
	String bl_board;
	
	String bl_me_id;
	
	String me_id;
	
	String addr2;
	
	String addr3;

	@Override
	public String toString() {
		
		return "주소록 번호 : " + bl_num + " 주소록 이름 : " + bl_name + " 주소록 주소 : " + bl_board + " 주소록 주인 아이디 : "  + bl_me_id;
		
	}
	
}