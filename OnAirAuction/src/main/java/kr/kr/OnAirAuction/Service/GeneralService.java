package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.StoreVO;

public interface GeneralService {
	
	// 일반 경매 목록
	ArrayList<ProductVO> getGeneralList(Criteria cri);

	// 수정 필요!!!
	int getGeneralTotalCount(Criteria cri);
	
	// 일반 경매 상품
	ProductVO getGeneralProduct(int pr_code);
	
	// 일반 경매 카테고리
	ProdCategoryVO getProdCategory(int pr_code);
	
	// 경매 정보
	AuctionVO getAuction(int pr_code);
	
	// 스토어 정보
	StoreVO getStore(int pr_code);
		
	// 상품 찜하기
	int updateLikeProduct(int pl_pr_code, int pl_state, MemberVO user);

	// 판매자 찜하기
	int updateLikeSeller(String sl_seller_id, int sl_state, MemberVO user);
	
	// 상세페이지 상품 좋아요 가져오기
	ProductLikeVO getLikeProduct(MemberVO user, int pr_code);
	
	
	// ---- 추가중 -----
	
	
	boolean insertImmediate(MemberVO user, AuctionVO bid);
	
	ArrayList<AuctionRecordVO> getBidlist(Criteria cri, int pr_code);

	int getBidlistTotalCount(Criteria cri);

	
	
	// 구현중
	// 입찰하기 금액 추가
	boolean insertBid(MemberVO user, Double price, AuctionRecordVO auRecord, int auctionNum);

	
	// 구현중
	// 경매기록 가져오기
	AuctionRecordVO getAuctionRecord(int pr_code);

}
