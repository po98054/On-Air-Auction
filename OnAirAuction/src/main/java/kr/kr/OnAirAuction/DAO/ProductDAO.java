package kr.kh.onAirAuction.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.FileVO;
import kr.kh.onAirAuction.vo.ProductCategoryVO;
import kr.kh.onAirAuction.vo.ProductVO;

public interface ProductDAO {

	// 상품 등록
	void insertCategory(@Param("pc")ProductCategoryVO pc);

	void insertBoard(@Param("p")ProductVO vo);

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
