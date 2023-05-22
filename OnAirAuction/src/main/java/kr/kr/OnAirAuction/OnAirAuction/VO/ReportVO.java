package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	
	int re_num;
	
	String re_content;
	
	Date re_date;
	
	String re_result;
	
	String re_me_id;
	
	int re_rc_num;
	
	String re_report_id;
	
	int re_pr_code;
	
	String pr_name;
	
	String rc_name;
	
	String re_report_product;
	
	public String getRe_date_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_date);
		
	}

	@Override
	public String toString() {
		
		return "신고 번호 : " + re_num + " 신고 내용 : " + re_content + " 신고 날짜 : " + getRe_date_str() + " 신고 결과 : " + re_result + 
				
				" 신고자 아이디 : " + re_me_id + " 신고 카데고리 번호 : " + re_rc_num + " 신고 당한 아이디 : " + re_report_id + " 제품 코드 : " + re_pr_code + " 제품 명 : " + pr_name;
		
	}
	
	

}