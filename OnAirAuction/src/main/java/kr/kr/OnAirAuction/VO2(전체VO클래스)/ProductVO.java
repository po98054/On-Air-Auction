package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class ProductVO {
	int pr_code;
	String pr_name;
	String pr_intro;
	String pr_condition;
	String pr_detail;
	String pr_location;
	String pr_refund_ok;
	String pr_refund_date;
	String pr_refund_reason;
	String pr_state;
	int pr_start_price;
	String pr_origin;
	String pr_size;
	int pr_st_num;
	int pr_pc_num;
	
	int st_num;
	
	//productcategory
	int pc_num;
	String pc_name;
	int pc_psc_num;
	//productsmallcategory
	int psc_num;
	String psc_name;
	int psc_pm_num;
	//productmiddlecategory
	int pmc_num;
	String pmc_name;
	int pmc_plc_num;
	//productlargecategory
	int plc_num;
	String plc_name;
	
	@Override
	public String toString() {
		
		return " 상품 코드 : " + pr_code + " 상품명 : " + pr_name + " 상품소개 : " + pr_intro + " 상품상태 : " + pr_condition + " 상세정보 : " + 	pr_detail
				
				+ " 상품 위치 : " + pr_location + " 반품수용여부 : " +  pr_refund_ok + " 반품수용기간 : " + pr_refund_date + " 반품가능조건 : " + pr_refund_reason
				
				+ " 경매시작가격: " + pr_start_price + " 원산지 : " +  pr_origin + " 상품크기 : " +  pr_size + " 스토어번호 : " +  pr_st_num + " 세분류번호 : " +  pr_pc_num; 
				
	
}
	
	
