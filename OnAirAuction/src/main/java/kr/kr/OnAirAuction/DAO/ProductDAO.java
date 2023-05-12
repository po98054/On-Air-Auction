package kr.kr.OnAirAuction.DAO;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.ChargeVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLargeCategoryVO;
import kr.kr.OnAirAuction.VO.ProductMiddleCategoryVO;
import kr.kr.OnAirAuction.VO.ProductSmallCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface ProductDAO {

	// 상품 등록
	void ProductCategoryVO(@Param("pc")ProductCategoryVO pc);

	void ProductSmallCategoryVO(@Param("pc")ProductSmallCategoryVO psc);
	
	void ProductMiddleCategoryVO(@Param("pc")ProductMiddleCategoryVO pmc);

	void ProductLargeCategoryVO(@Param("pc")ProductLargeCategoryVO plc);
		
	void insertProduct(@Param("p")ProductVO vo);
	
	// 첨부파일
	void insertFile(@Param("file")FileVO fileVo, @Param("pr_code")int pr_code);

	// 상품 리스트
	ArrayList<ProductVO> selectProductList(@Param("cri")Criteria criteria);

	int selectProductTotalCount(@Param("cri")Criteria criteria);

	// 상품 상세페이지
	ProductVO selectProduct(@Param("pr_code")int pr_code);

	ArrayList<FileVO> selectFileList(@Param("pr_code")int pr_code);

	// 상품 삭제
	int deleteProduct(@Param("pr_code")int pr_code);

	void deleteFile(@Param("file")FileVO file);

	// 상품 수정
	int updateProduct(@Param("vo")ProductVO vo);

	FileVO selectFile(@Param("fi_num")int fileNum);

	
}
