package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class HeldAuctionVO {
	
	int ac_num;
	
	String pr_name;
	
	int pr_startprice;
	
	Date ac_startdate;
	
	Date ac_finaldate;
	
	String ac_state;
	
	int ac_immediate;

	@Override
	public String toString() {
		
		return " 경매 번호 : " + ac_num + " 경매 물품명 : " + pr_name + " 최초 입찰가 : " + pr_startprice + " 경매 시작 시간 : " + ac_startdate + " 경매 종료 시간 : " + ac_finaldate
				
				+ " 경매 상태" + ac_state + " 즉시 가격 : " + ac_immediate;
		
	}
	
	public String getAc_startdate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(ac_startdate);
		
	}
	
	public String getAc_finaldate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(ac_finaldate);
		
	}

}