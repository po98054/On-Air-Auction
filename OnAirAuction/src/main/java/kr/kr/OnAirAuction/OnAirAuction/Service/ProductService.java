package kr.kr.OnAirAuction.Service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.AuctionTypeVO;
import kr.kr.OnAirAuction.VO.AuctionVO;
import kr.kr.OnAirAuction.VO.ChargeVO;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLargeCategoryVO;
import kr.kr.OnAirAuction.VO.ProductMiddleCategoryVO;
import kr.kr.OnAirAuction.VO.ProductSmallCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface ProductService {
	
	// 상품 등록
	void insertProduct(ProductLargeCategoryVO plc, ProductMiddleCategoryVO pmc, ProductSmallCategoryVO psc,
			ProductCategoryVO pc, ProductVO vo, MultipartFile[] files);
	
	// 상품 리스트
	ArrayList<ProductVO> getProductList(Criteria criteria);

	int getProductTotalCount(Criteria criteria);
	
	// 상품 상세페이지
	ProductVO getProduct(int pr_code);

	ArrayList<FileVO> getFileList(int pr_code);

	// 상품 삭제
	boolean deleteProduct(int pr_code);
	
	// 상품 수정
	boolean updateProduct(ProductVO vo, MultipartFile[] files, int[] fileNums);


}
