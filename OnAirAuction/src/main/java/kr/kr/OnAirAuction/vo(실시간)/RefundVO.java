package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class RefundVO {
	int re_num;
	Date re_apply_date;
	String re_reason;
	Date re_confirm_date;
	String re_progress;
	int re_ao_num;
	
public String getRe_apply_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(re_apply_date);
 	}
public String getRe_confirm_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(re_confirm_date);
 	}
}
	
	
