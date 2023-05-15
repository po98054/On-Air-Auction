package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class DeliveryVO {
	int de_num;
	String de_state;
	Date de_start_date;
	Date de_complete_date;
	int de_or_num;
	int de_bl_num;
	
	
public String getDe_start_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(de_start_date);
 	}
public String getDe_complete_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(de_complete_date);
 	}
}
	
	
