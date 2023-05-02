package kr.kr.OnAirAuction.DAO;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.VO.LikeVO;
import kr.kr.OnAirAuction.VO.ProductVO;

public interface ProductDAO {

	ProductVO selectProduct(@Param("pr_code")int pr_code);

	ArrayList<ProductVO> selectProductList(@Param("cri")Criteria cri);

	int selectTotalCountProduct(@Param("cri")Criteria cri);

	LikeVO selectLikeById(@Param("li_me_id")String me_id, @Param("li_pl_pr_code")int pl_pr_code);

	void insertLike(@Param("li")LikeVO likeVo);

	void updateLike(@Param("li")LikeVO likeVo);

	void updateProductByLike(@Param("pl_pr_code")int pl_pr_code);


}
