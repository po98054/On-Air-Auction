package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class ParticipateAuctionVO {
	
	int au_num;
	
	String ac_name;
	
	String au_me_id;
	
	String pr_name;
	
	int pr_start_price;
	
	Date au_start_date;
	
	String pr_state;
	
	int ar_bid_price;

	@Override
	public String toString() {
		
		return " 경매 번호 : " + au_num + " 경매 카데고리 명 : " + ac_name + " 판매자 명 : " + au_me_id + " 상품 명 : " + pr_name + " 경매 시작 가격 : " + pr_start_price
				
				+ " 경매 시작일 : " + au_start_date + " 경매 상태 : " + pr_state + " 낙찰 가격 : " + ar_bid_price;
				
	}
	
	public String getAu_start_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(au_start_date);
		
	}
	
}