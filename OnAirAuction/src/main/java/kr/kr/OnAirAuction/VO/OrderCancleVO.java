package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;

import java.util.Date;

import lombok.Data;

import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderCancleVO {
	
	int re_num;
	
	Date re_applydate;
	
	String re_reason;
	
	Date re_confirmdate;
	
	String re_progress;
	
	int re_or_num;
	
	String pr_name;
	
	public OrderCancleVO(int re_or_num, String re_reason) {
		
		this.re_or_num = re_or_num;
		
		this.re_reason = re_reason;
		
	}
	
	public String getRe_applydate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_applydate);
		
	}
	
	public String getRe_confirmdate() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(re_confirmdate);
		
	}

}