package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class AuctionCancelVO {
	int ac_num;
	Date ac_date;
	String ac_reason;
	int ac_au_num;
	
	
public String getAc_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(ac_date);
 	}

}
	
	
