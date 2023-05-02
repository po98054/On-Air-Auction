package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.BidVO;
import kr.kr.OnAirAuction.VO.MemberVO;

public interface BidService {
	
	boolean insertImmediate(MemberVO user, BidVO bid);
	
	ArrayList<BidVO> getBidlist(Criteria cri, int pr_code);

	int getBidlistTotalCount(Criteria cri);

}
