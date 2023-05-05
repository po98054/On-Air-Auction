package kr.kr.OnAirAuction.VO;

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
	String pr_refunddate;
	String pr_refundreason; 
	String pr_state;
	int pr_startprice;
	String pr_origin; 
	int pr_size;
	int pr_st_num;
	int pr_pc_num;
	
	String pc_name;
	
}