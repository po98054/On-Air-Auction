package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class MessageVO {
	int me_num;
	Date me_time;
	Date me_read_time;
	String me_send_id;
	String me_receive_id;
	String me_title;
	String me_content;
	
	
public String getMe_time() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(me_time == null) {
			return null;
		}
	return date.format(me_time);
 	}
public String getMe_read_time() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(me_read_time == null) {
			return null;
		}
	return date.format(me_read_time);
 	}
}
	
	
