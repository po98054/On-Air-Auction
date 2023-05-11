package kr.kh.onAirAuction.dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.AuctionVO;
import kr.kh.onAirAuction.vo.ChargeVO;
import kr.kh.onAirAuction.vo.FileVO;
import kr.kh.onAirAuction.vo.ProductCategoryVO;
import kr.kh.onAirAuction.vo.ProductLargeCategoryVO;
import kr.kh.onAirAuction.vo.ProductMiddleCategoryVO;
import kr.kh.onAirAuction.vo.ProductSmallCategoryVO;
import kr.kh.onAirAuction.vo.ProductVO;

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
	ArrayList<ProductVO> selectProductList(@Param("cri")Criteria cri);

	int selectProductTotalCount(@Param("cri")Criteria cri);

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
