package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderCancleVO {
	
	int re_num;
	
	String re_apply_date;
	
	String re_reason;
	
	String re_confirm_date;
	
	String re_progress;
	
	int re_or_num;
	
	String pr_name;
	
	public OrderCancleVO(int re_or_num, String re_reason) {
		
		this.re_or_num = re_or_num;
		
		this.re_reason = re_reason;
		
	}
	
	/*public String getRe_apply_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_apply_date);
		
	}
	
	public String getRe_confirm_date() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_confirm_date);
		
	}*/

}