package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

// 문의 사항 VO

@Data
public class InquiryVO {
	
	int in_num;
	
	String in_title;
	
	String in_content;
	
	Date in_register_date;
	
	Date in_modify_date;
	
	Date in_answerdate;
	
	String in_answercontent;
	
	String in_me_id;
	
	int in_ic_num;
	
	String ic_name;
	
	int in_pr_code;
	
	String pr_name;
	
	@Override
	public String toString() {
		
		return "문의 사항 번호 : " + in_num + " 문의 사항 제목 : " + in_title + " 문의 사항 내용 : " + in_content + /*" 문의 사항 등록일 : " + getIn_registerdate_str() +
				
				"문의 사항 수정일 : " + getIn_modifyDate_str() + " 문의 사항 답변일 : " + getIn_answerdate_str() +*/ " 문의 사항 답변 내용 : " + in_answercontent +
				
				" 문의 사항 등록자 : " + in_me_id + " 문의 사항 카데고리 번호 : " + in_ic_num + " 문의 사항 제품 코드 : " + in_pr_code + " 문의 사항 제품 명 :" + pr_name;
		
	}
	
	public String getIn_register_date_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(in_register_date);
		
	}
	
	public String getIn_modify_date_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(in_modify_date);
		
	}
	
	public String getIn_answerdate_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(in_answerdate);
		
	}

}