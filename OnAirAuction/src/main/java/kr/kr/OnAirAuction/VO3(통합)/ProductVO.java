package kr.kr.OnAirAuction.VO;

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
}