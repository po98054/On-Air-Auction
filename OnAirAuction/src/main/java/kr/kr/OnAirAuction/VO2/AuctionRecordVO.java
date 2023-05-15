package kr.kh.onairauction.vo2;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;

@Data
public class AuctionRecordVO {
	int ar_num;
	Date ar_bid_time;
	int ar_bid_price;
	String ar_me_id;
	int ar_au_num;
	
	
public String getAr_bid_time() {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(ar_bid_time == null) {
			return null;
		}
	return date.format(ar_bid_time);
 	}
public double getAr_next_bid_price() {
	double unit = 0;
	if( ar_bid_price < 20){
		unit = 1;
	}
	if(20 <= ar_bid_price && ar_bid_price < 50) {
		unit = 4;
	}
	if(50 <= ar_bid_price && ar_bid_price < 200) {
		unit = 7;
	}
	if(200 <= ar_bid_price && ar_bid_price < 400) {
		unit = 15;
	}
	if(400 <= ar_bid_price && ar_bid_price < 800) {
		unit = 35;
	}
	if(800 <= ar_bid_price) {
		unit = 70;
	}
	double nextBidPrice = ar_bid_price + unit;
	
	return nextBidPrice;
}

public double getAr_next_bid_price(double price) {
	double unit = 0;
	if( price < 20){
		unit = 1;
	}
	if(20 <= price && price < 50) {
		unit = 4;
	}
	if(50 <= price && price < 200) {
		unit = 7;
	}
	if(200 <= price && price < 400) {
		unit = 15;
	}
	if(400 <= price && price < 800) {
		unit = 35;
	}
	if(800 <= price) {
		unit = 70;
	}
	double nextBidPrice = price + unit;
	
	return nextBidPrice;
}
}
	
	
