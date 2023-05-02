package kr.kr.OnaAirAuction.VO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LikeVO {
	int pl_pr_code;
	String pl_me_id;
	int pl_state;
	
	public LikeVO(int pl_pr_code, String pl_me_id, int pl_state) {
		this.pl_pr_code = pl_pr_code;
		this.pl_me_id = pl_me_id;
		this.pl_state = pl_state;
	}
}
