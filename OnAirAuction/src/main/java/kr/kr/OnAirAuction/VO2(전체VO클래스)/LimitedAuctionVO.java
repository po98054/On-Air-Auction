package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class LimitedAuctionVO {
	int la_num;
	int la_limited_number;
	Date la_apply_start_time;
	Date la_apply_final_time;
	int la_au_num;
	
	
public String getLa_apply_start_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(la_apply_start_time);
 	}
public String getLa_apply_final_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(la_apply_final_time);
 	}
}
	
	
