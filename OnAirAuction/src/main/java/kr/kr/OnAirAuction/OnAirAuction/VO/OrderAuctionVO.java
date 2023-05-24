package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class OrderAuctionVO {
	
	String pr_name;
	
	String au_me_id;
	
	int ar_bid_price;
	
	String re_progress;
	
	String au_delivery_way;
	
	String de_state;
	
	Date de_start_date;
	
	Date de_complete_date;
	
	int ao_num;
	
	int ar_num;
	
	public String getDe_start_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(de_start_date);
		
	}
	
	public String getDe_complete_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(de_complete_date);
		
	}

}