package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class ChattingRecordVO {
	int cr_num;
	String cr_content;
	Date cr_time;
	String cr_me_id;
	int cr_ch_num;
	
public String getCr_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(cr_time);
 	}
}
	
	
