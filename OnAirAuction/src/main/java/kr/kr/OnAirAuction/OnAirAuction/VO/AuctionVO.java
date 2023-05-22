package kr.kr.OnAirAuction.VO;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.ParseException;
import java.text.SimpleDateFormat;

@Data
@NoArgsConstructor
public class AuctionVO {
	
	int au_num;
	int au_calculation;
	public Date au_start_date;
	public Date au_final_date;
	int au_extension;
	int au_faild;
	int au_immediate;
	int au_limit_bid_time;	
	int au_limit_level;
	String au_delivery_way;
	int au_pr_code;
	String au_me_id;
	int au_ac_num;
	
	int ac_num;
	String ac_name;
	
	String pr_name;
	String pr_intro;
	int pr_code;
	
	public String getAu_start_date() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (au_start_date == null) {
            return null;
        }
        return dateFormat.format(au_start_date);
    }
	
	public void setAu_start_date(String au_start_date) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.au_start_date = dateFormat.parse(au_start_date);
    }
	
    public String getAu_final_date() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (au_final_date == null) {
            return null;
        }
        return dateFormat.format(au_final_date);
    }

    public void setAu_final_date(String au_final_date) throws ParseException {
        if (au_final_date == null || au_final_date.isEmpty()) {
            this.au_final_date = null;
        } else {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            this.au_final_date = dateFormat.parse(au_final_date);
        }
    }

	

}
