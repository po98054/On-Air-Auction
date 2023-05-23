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
	int au_num;
		
}
