package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.InquiryCategoryVO;
import kr.kr.OnAirAuction.VO.InquiryVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReviewVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.SellerLikeVO;
import kr.kr.OnAirAuction.VO.StoreVO;
import kr.kr.OnAirAuction.VO.VirtualAccountVO;

public interface GeneralDAO {
	
	// 일반 경매 목록 - 상품 리스트 가져오기
	ArrayList<ProductVO> selectGeneralList(@Param("cri")Criteria cri);
	
	// 일반 경매의 전체의 수 - 상품 가져오기
	int selectTotalCountProduct(@Param("cri")Criteria cri);

	// 일반 경매 상품 - 상품 상세페이지 가져오기
	ProductVO selectGeneral(@Param("pr_code")int pr_code);

	// 일반 경매 카테고리 - 상품 카테고리 가져오기
	ProdCategoryVO selectProdCategory(@Param("pc_num")int pc_num);

	// 경매 정보 - 상품의 경매 정보 가져오기
	AuctionVO selectAuction(@Param("pr_code")int pr_code);

	// 스토어 정보 - 스토어 정보 가져오기
	StoreVO selectStore(@Param("pr_code")int pr_code);

	// 경매 기록 - 경매 기록 가져오기
	ArrayList<AuctionRecordVO> selectAuctionRecord(@Param("pr_code")int pr_code);
	
	// 경매 최근 기록 - 경매 최근 기록 가져오기
	ArrayList<AuctionRecordVO> selectAuctionRecordList();
	
	// 이미지 파일 - 상품의 이미지 가져오기
	ArrayList<FileVO> selectProdFileList(@Param("pr_code")int pr_code);
	
	// 상품 후기 - 판매자의 리뷰 가져오기
	ArrayList<ReviewVO> selectReview(@Param("pr_code")int pr_code);
	
	// 입찰하기: 가상계좌
	VirtualAccountVO selectUserAccount(@Param("id")String id);
	
	// 입찰하기: 회원등급
	MembershipLevelVO selectMembership(@Param("membershipName")String membershipName);
	
	// 입찰하기: 입찰 등록
	void insertAuctionRecord(@Param("price")int price, @Param("id")String id, @Param("auctionNum")int auctionNum);
	
	
	
	
	// ---------------------------------------------------------------------------------
	
	
	
	// 5/18 상품 문의 - 상품 문의 가져오기
	ArrayList<InquiryVO> selectInquiry(@Param("pr_code")int pr_code);
	
//	// 상품 문의 카테고리 - 상품 문의 카테고리 가져오기
//	InquiryCategoryVO selectInquCategory(@Param("pr_code")int pr_code);
	
	
	/* 추가중 */
	
	// 회원의 찜한 판매자 정보 가져오기
	SellerLikeVO selectLikeSellerById(@Param("sl_me_id")String sl_me_id, @Param("sl_seller_id")String sl_seller_id);

	// 판매자 찜하기 등록
	void insertLikeSeller(@Param("s_li")SellerLikeVO seller_likeVO);
	
	// 판매자 찜하기 변경(수정 필요)
	void updateLikeSeller(@Param("s_li")SellerLikeVO seller_likeVO);
	
	int insertImmediate(@Param("bid") AuctionVO bid);
	
	int selectBidlistTotalCount(@Param("cri") Criteria cri); // ? 


	// 상품 찜하기 등록
	// void insertLikeProduct(@Param("p_li")ProductLikeVO pLikeVo);
		
	// 상품 찜하기 변경(수정 필요)
	// void updateLikeProduct(@Param("p_li")ProductLikeVO pLikeVo);
	
	
	ProductLikeVO selectProdLikeById(@Param("me_id")String me_id, @Param("pr_code")int pr_code);

	int insertInquiry(@Param("inquiry")InquiryVO inquiry);
	
}
