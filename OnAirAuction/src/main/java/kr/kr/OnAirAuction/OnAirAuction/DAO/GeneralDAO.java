package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionRecordVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.InquiryVO;
import kr.kr.OnAirAuction.VO.MembershipLevelVO;
import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;
import kr.kr.OnAirAuction.VO.ReviewVO;
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
	AuctionVO selectAuction(@Param("au_num")int au_num);

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
	
	// 상품 문의 - 상품 문의 가져오기
	ArrayList<InquiryVO> selectInquiry(@Param("pr_code")int pr_code);
	
	// 상품 문의 목록 - 일반 경매의 상품 문의 게시물의 수
	int selectTotalCountInquiry(@Param("cri")Criteria cri);

	// 상품 후기 목록 - 일반 경매의 상품 후기 게시물의 수
	int selectTotalCountReview(@Param("cri") Criteria cri);

	// 상품 좋아요: 조회
	ProductLikeVO selectProductLike(@Param("productCode")int productCode, @Param("userId")String userId);

	// 상품 좋아요: 등록
	void insertProductLike(@Param("productCode")int productCode, @Param("userId")String userId, @Param("num")int num);
	
	// 상품 좋아요: 수정
	void updateProductLike(@Param("table")ProductLikeVO table, @Param("productLikeState")int productLikeState);

	
}