package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.MemberVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface DetailService {

	ArrayList<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);

	ProductVO getProduct(int pr_code);

	int updateLike(MemberVO user, int pl_pr_code, int pl_state);

	void updateProductByLike(int pl_pr_code);

}
