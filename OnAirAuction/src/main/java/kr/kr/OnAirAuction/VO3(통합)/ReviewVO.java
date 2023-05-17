package kr.kr.OnAirAuction.VO;

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
	
	String ar_me_id;

	@Override
	public String toString() {
		
		return " 후기 번호 : " + re_num + " 후기 제목 : " + re_title + " 후기 내용 : " + re_content + " 후기 별점 : " + re_satisfaction + " 후기 등록 일자 : " + re_registration
				
				+ " 후기 수정 일자 : " + re_modify + " 스토어 번호 : " + re_st_num + " 경매 기록 번호 : " + re_ar_num;
				
	}
	
	public String getRe_registration_str() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_registration);
		
	}
	
	public String getRe_modify() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_modify);
		
	}
	
}