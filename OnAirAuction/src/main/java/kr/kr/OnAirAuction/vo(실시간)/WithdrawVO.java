package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class WithdrawVO {
	int wi_num;
	int wi_amount;
	Date wi_withdraw_date;
	String wi_withdraw_reason;
	
	
public String getWi_withdraw_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(wi_withdraw_date);
 	}
}
	
	
