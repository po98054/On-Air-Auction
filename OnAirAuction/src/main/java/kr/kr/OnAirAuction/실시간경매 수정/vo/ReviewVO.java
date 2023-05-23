package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class ReviewVO {
	int re_num;
	String re_title;
	String re_content;
	int re_satisfaction;
	Date re_registration;
	Date re_modify;
	int re_st_num;
	int re_ar_num;
	
public String getRe_registration() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(re_registration);
 	}
public String getRe_modify() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(re_modify);
 	}
}
	
	
