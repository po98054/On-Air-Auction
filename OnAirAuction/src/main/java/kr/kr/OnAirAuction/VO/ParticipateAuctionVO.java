package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class ParticipateAuctionVO {
	
	int ac_num;
	
	String ac_ac_name;
	
	String me_name;
	
	String pr_name;
	
	int pr_startprice;
	
	Date ac_startdate;
	
	String ac_state;
	
	String YN;
	
	int ar_bidprice;

	@Override
	public String toString() {
		
		return " 경매 번호 : " + ac_num + " 경매 카데고리 명 : " + ac_ac_name + " 판매자 명 : " + me_name + " 상품 명 : " + pr_name + " 경매 시작 가격 : " + pr_startprice
				
				+ " 경매 시작일 : " + ac_startdate + " 경매 상태 : " + ac_state + " 낙찰 여부 : " + YN + " 낙찰 가격 : " + ar_bidprice;
				
	}
	
	public String getAc_startdate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(ac_startdate);
		
	}
	
}