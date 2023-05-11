package kr.kh.onAirAuction.service;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.vo.AuctionTypeVO;
import kr.kh.onAirAuction.vo.AuctionVO;
import kr.kh.onAirAuction.vo.ChargeVO;
import kr.kh.onAirAuction.vo.FileVO;
import kr.kh.onAirAuction.vo.MemberVO;
import kr.kh.onAirAuction.vo.ProductCategoryVO;
import kr.kh.onAirAuction.vo.ProductLargeCategoryVO;
import kr.kh.onAirAuction.vo.ProductMiddleCategoryVO;
import kr.kh.onAirAuction.vo.ProductSmallCategoryVO;
import kr.kh.onAirAuction.vo.ProductVO;

public interface ProductService {
	
	// 상품 등록
	void insertProduct(ProductLargeCategoryVO plc, ProductMiddleCategoryVO pmc, ProductSmallCategoryVO psc,
			ProductCategoryVO pc, ProductVO vo, MultipartFile[] files);
	
	// 상품 리스트
	ArrayList<ProductVO> getProductList(Criteria cri);

	int getProductTotalCount(Criteria cri);
	
	// 상품 상세페이지
	ProductVO getProduct(int pr_code);

	ArrayList<FileVO> getFileList(int pr_code);

	// 상품 삭제
	boolean deleteProduct(int pr_code);
	
	// 상품 수정
	boolean updateProduct(ProductVO vo, MultipartFile[] files, int[] fileNums);

	boolean loginMember(MemberVO member);



}
