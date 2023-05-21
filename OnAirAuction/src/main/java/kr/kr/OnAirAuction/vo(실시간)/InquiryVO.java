package kr.kh.onairauction.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class InquiryVO {
	int in_num;
	String in_title;
	String in_content;
	Date in_register_date;
	Date in_modify_date;
	Date in_answer_date;
	String in_answer_content;
	String in_me_id;
	int in_pr_code;
	int in_ic_num;
	
	
public String getIn_register_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(in_register_date);
 	}
public String getIn_modify_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(in_modify_date);
 	}
public String getIn_answer_date() {
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	return date.format(in_answer_date);
 	}
}
	
	
