package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class HeldAuctionVO {
	
	int ac_num; // 경매 취소 번호
	
	String pr_name;
	
	int pr_start_price;
	
	Date au_start_date;
	
	Date au_final_date;
	
	String pr_state;
	
	int au_num; // 경매 번호
	
	int au_immediate;

	@Override
	public String toString() {
		
		return " 경매 취소 번호 : " + ac_num + " 경매 물품명 : " + pr_name + " 최초 입찰가 : " + pr_start_price + " 경매 시작 시간 : " + au_start_date + " 경매 종료 시간 : " + au_final_date
				
				+ " 경매 상태" + pr_state + " 즉시 가격 : " + au_immediate + " 경매 번호 : " + au_num;
		
	}
	
	public String getAu_start_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(au_start_date);
		
	}
	
	public String getAu_final_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(au_final_date);
		
	}

}