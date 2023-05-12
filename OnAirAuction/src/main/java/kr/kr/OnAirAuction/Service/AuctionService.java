package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;

public interface AuctionService {

	void insertAuction(AuctionVO auction);
	
	ArrayList<AuctionVO> getAuctionList(Criteria cri);

	int getAuctionTotalCount(Criteria cri);

	AuctionVO getAuction(int au_num);

}
