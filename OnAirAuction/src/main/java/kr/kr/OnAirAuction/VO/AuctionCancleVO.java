package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.Date;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuctionCancleVO {
	
	int ac_num;
	
	Date ac_date;
	
	String ac_reason;
	
	int ac_ac_num;

	@Override
	public String toString() {
		
		return " 취소 번호 : " + ac_num + " 취소 날짜 : " + ac_date + " 취소 사유 : " + ac_reason + " 경매 번호 : " + ac_ac_num;
				
	}
	
	public AuctionCancleVO(int ac_ac_num, String ac_reason) {
		
		this.ac_ac_num = ac_ac_num;
		
		this.ac_reason = ac_reason;
		
	}
	
	public String getAc_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(ac_date);
		
	}
	
}