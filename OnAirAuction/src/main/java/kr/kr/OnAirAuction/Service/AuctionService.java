package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;

public interface AuctionService {

	boolean insertAuction(AuctionVO auction, MemberVO user, ProductVO product);
	
	ArrayList<AuctionVO> getAuctionList(Criteria cri);

	int getAuctionTotalCount(Criteria cri);

	AuctionVO getAuction(int au_num);

	ProductVO getPrcode(int au_pr_code);

}
