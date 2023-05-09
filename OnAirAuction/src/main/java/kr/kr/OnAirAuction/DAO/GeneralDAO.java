package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;
//import kr.kr.OnAirAuction.VO.ProdCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;
//import kr.kr.OnAirAuction.VO.Product_categoryVO;
import kr.kr.OnAirAuction.VO.ProductLikeVO;
import kr.kr.OnAirAuction.VO.SellerLikeVO;
import kr.kr.OnAirAuction.VO.StoreVO;

public interface GeneralDAO {
	
	// 상품 리스트 가져오기
	ArrayList<ProductVO> selectGeneralList(@Param("cri")Criteria cri);
	
	// 상품 상세페이지 가져오기
	ProductVO selectGeneral(@Param("pr_code")int pr_code);

	// 오류 발생 수정 필요
	// 상품 카테고리 가져오기
	// Product_categoryVO selectProdCategory(@Param("pc_num")int pc_num);

	// 상품의 경매 정보 가져오기
	AuctionVO selectAuction(@Param("pr_code")int pr_code);

	// 회원의 찜한 상품 정보 가져오기
	ProductLikeVO selectLikeProductById(@Param("pl_me_id")String pl_me_id, @Param("pl_pr_code")int pl_pr_code);

	// 상품 찜하기 등록
	void insertLikeProduct(@Param("p_li")ProductLikeVO product_likeVO);

	// 상품 찜하기 변경(수정 필요)
	void updateLikeProduct(@Param("p_li")ProductLikeVO product_likeVO);
	
	int selectTotalCountProduct(@Param("cri")Criteria cri);

	// 회원의 찜한 판매자 정보 가져오기
	SellerLikeVO selectLikeSellerById(@Param("sl_me_id")String sl_me_id, @Param("sl_seller_id")String sl_seller_id);

	// 판매자 찜하기 등록
	void insertLikeSeller(@Param("s_li")SellerLikeVO seller_likeVO);
	
	// 판매자 찜하기 변경(수정 필요)
	void updateLikeSeller(@Param("s_li")SellerLikeVO seller_likeVO);
	
	// 스토어 정보
	StoreVO selectStore(@Param("pr_code")int pr_code);


}
