package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class ReportVO {
	int re_num;
	String re_content;
	Date re_date;
	String re_result;
	String re_report_id;
	String re_report_product;
	String re_me_id;
	int re_rc_num;
public String getRe_date() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(re_date == null) {
			return null;
		}
	return date.format(re_date);
 	}
}
	
	
