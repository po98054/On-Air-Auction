package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class CertificationVO {
	String ce_me_id;
	String ce_certification_number;
	Date ce_time;
	
public String getCe_time() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(ce_time);
 	}
}
	
	
