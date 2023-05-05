package kr.kr.OnAirAuction.VO;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AuctionVO {
	
	int au_num;
	int au_calculation;
	String au_startdate;
	String au_finaldate;
	int au_extension;
	int au_faild;
	int au_immediate;
	String au_limitbidtime;	
	String au_limitlevel;
	String au_deliveryway;
	int au_pr_code;
	String au_me_id;
	int au_ac_num;
	
	int ac_num;
	String ac_name;
	

}
