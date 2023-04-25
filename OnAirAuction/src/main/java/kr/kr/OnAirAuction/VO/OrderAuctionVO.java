package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class OrderAuctionVO {
	
	String pr_name;
	
	String me_name;
	
	int ar_bidprice;
	
	String re_progress;
	
	String ac_deliveryway;
	
	String de_state;
	
	Date de_startdate;
	
	Date de_completedate;
	
	int or_num;
	
	public String getDe_startdate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(de_startdate);
		
	}
	
	public String getDe_completedate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(de_completedate);
		
	}

}