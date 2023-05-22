package kr.kr.OnAirAuction.VO;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;

import java.util.Date;

@Data
@NoArgsConstructor
public class ChargeVO {
	
	int ch_num;
	String ch_method;
	int ch_amount;
	Date ch_charge_date;
	String ch_va_me_id;
	
	public String getCh_charge_date() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return date.format(ch_charge_date);
	 	}

}
