package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class ProductSearchVO {
	
	String pr_name;
	
	String me_name;
	
	int pr_code;

	@Override
	public String toString() {
		
		return "상품명 : " + pr_name + " 판매자 명 : " + me_name + " 상품 코드 : " + pr_code;
		
	}

}