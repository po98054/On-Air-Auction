package kr.kr.OnAirAuction.VO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Seller_likeVO {
	
	int sl_state;
	
	public Seller_likeVO(int sl_state) {
		this.sl_state = sl_state;
	}
}
