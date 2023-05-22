package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.InquiryCategoryVO;
import kr.kr.OnAirAuction.VO.InquiryVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReviewVO;
import kr.kr.OnAirAuction.VO.StoreVO;
import kr.kr.OnAirAuction.VO.VirtualAccountVO;

public interface GeneralService {
	
	// 일반 경매 목록
	ArrayList<ProductVO> getGeneralList(Criteria cri);
	
	// 일반 경매의 전체의 수
	int getGeneralTotalCount(Criteria cri);
	
	// 일반 경매 상품
	ProductVO getGeneralProduct(int pr_code);
	
	// 일반 경매 카테고리
	ProdCategoryVO getProdCategory(int pr_code);
	
	// 경매 정보
	AuctionVO getAuction(int au_num);
	
	// 스토어 정보
	StoreVO getStore(int pr_code);
	
	// 경매 기록
	ArrayList<AuctionRecordVO> getAuctionRecord(int pr_code);
	
	// 경매 최근 기록
	ArrayList<AuctionRecordVO> selectAuctionRecordList();
	
	// 이미지 파일
	ArrayList<FileVO> getProdFileList(int pr_code);
	
	// 상품 후기
	ArrayList<ReviewVO> getReview(int pr_code);
	
	// 입찰하기: 가상계좌
	VirtualAccountVO getUserAccount(String id);
	
	// 입찰하기: 회원등급
	MembershipLevelVO getMembership(String memberShipName);
	
	// 입찰하기: 입찰 등록
	boolean insertBid(int price, MemberVO user, VirtualAccountVO userAccount, int expense, int auctionNum);
	
	
	
	// ---------------------------------------------------------------------------------
	

	// 샹품 찜 구현중
	ProductLikeVO getProdLike(MemberVO user, int pr_code);

	// 상품 문의 구현중
	ArrayList<InquiryVO> getInquiry(int pr_code);

	// 상품 문의 등록 구현중
	boolean insertInquiry(InquiryVO inquiry);
	

}
