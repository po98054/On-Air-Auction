package kr.kr.OnAirAuction.VO;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class BidVO {
	String ar_me_id;
	Date ar_bidtime;
	int ar_bidprice;

	public String getAr_bidtime_str() {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(ar_bidtime);
	}
}
