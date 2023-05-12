package kr.kr.OnAirAuction.VO;

import lombok.Data;

@Data
public class ProdCategoryVO {
	
	// product_category
	int pc_num;
	String pc_name;
	int pc_psc_num;
	
	// product_small_category
	int psc_num;
	String psc_name;
	int psc_pmc_num;
	
	// product_middle_category
	int pmc_num;
	String pmc_name;
	int pmc_plc_num;
	
	// product_large_category
	int plc_num;
	String plc_name;
}
