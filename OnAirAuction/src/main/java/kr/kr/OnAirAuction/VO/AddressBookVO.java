package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class AddressBookVO {

	int bl_num;
	
	String bl_name;
	
	String bl_me_id;
	
	String me_id;
	
	String bl_post_num; 
	
	String bl_road_name; 
	
	String bl_detail_address;

	@Override
	public String toString() {
		
		return "주소록 번호 : " + bl_num + " 주소록 이름 : " + bl_name + " 주소록 우편 번호 : " + bl_post_num + "주소록 도로명 주소 : " + bl_road_name
				
				+ " 주소록 상세 주소 : " + bl_detail_address + " 주소록 주인 아이디 : "  + bl_me_id;
		
	}
	
}