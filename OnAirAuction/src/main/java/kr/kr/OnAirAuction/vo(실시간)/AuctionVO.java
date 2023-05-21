package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class AuctionVO {
	int au_num;
	int au_calculation;
	int au_limit_bid_time;
	public Date au_start_date;
	Date au_final_date;
	int au_extension;
	int au_faild;
	int au_immediate;
	int au_limit_level;
	String au_delivery_way;
	int au_pr_code;
	String au_me_id;
	int au_ac_num;
	
public String getAu_start_date() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(au_start_date == null) {
			return null;
		}
	return date.format(au_start_date);
 	}
public String getAu_final_date() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(au_final_date == null) {
			return null;
		}
	return date.format(au_final_date);
 	}

public String getAu_delivery_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd" + "일 부터 3일이내");
	return date.format(au_final_date);
	}
	
}
	
	
