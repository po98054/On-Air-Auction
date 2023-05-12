package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.ProductService;
import kr.kr.OnAirAuction.Utils.MessageUtils;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductCategoryVO;
import kr.kr.OnAirAuction.VO.ProductLargeCategoryVO;
import kr.kr.OnAirAuction.VO.ProductMiddleCategoryVO;
import kr.kr.OnAirAuction.VO.ProductSmallCategoryVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Controller
public class ProductController {

	@Autowired
    private ProductService productService;
	
	// 상품 등록
	@RequestMapping(value="/product/insert", method=RequestMethod.GET)
	public  ModelAndView productInsert(ModelAndView mv){
		mv.setViewName("/product/insert");

		return mv;
	}
    @RequestMapping(value="/product/insert", method=RequestMethod.POST)
	public String productInsertPOST(ProductLargeCategoryVO plc, ProductMiddleCategoryVO pmc, 
			ProductSmallCategoryVO psc, ProductCategoryVO pc,		
			ProductVO vo, MultipartFile []files){
		productService.insertProduct(plc, pmc, psc, pc, vo, files);
		return "redirect:/product/list";
	}
    
    // 상품 리스트
    @RequestMapping(value="/product/list", method=RequestMethod.GET)
    public ModelAndView list(ModelAndView mv, Criteria criteria) {
    	ArrayList<ProductVO> list = productService.getProductList(criteria);
    	int totalCount = productService.getProductTotalCount(criteria);
		PageMaker pm = new PageMaker(totalCount, 3, criteria);
    	mv.addObject("list", list);
    	mv.addObject("pm", pm);
    	mv.setViewName("/product/list");
    	return mv;
	}
    
    // 상품 상세 페이지
    @RequestMapping(value="/product/detail/{pr_code}", method=RequestMethod.GET)
    public ModelAndView  productDetail(ModelAndView mv, 
    		@PathVariable("pr_code") int pr_code) {
    	ProductVO vo = productService.getProduct(pr_code);
    	ArrayList<FileVO> files = productService.getFileList(pr_code);
    	mv.addObject("vo", vo);
    	mv.addObject("files", files);
    	mv.setViewName("/product/detail");
    	return mv;
    }
    
    // 상품 상세페이지 - 삭제
	@RequestMapping(value = "/product/delete/{pr_code}", method=RequestMethod.GET)
	public ModelAndView boardDelete(ModelAndView mv, 
			@PathVariable("pr_code")int pr_code,
			HttpServletResponse response) {
		boolean res = productService.deleteProduct(pr_code);
		if(res) {
			MessageUtils.alertAndMovePage(response, 
					"게시글을 삭제했습니다.", "/onAirAuction", "/product/list");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"작성자가 아니거나 존재하지 않은 게시글입니다.", "/onAirAuction", 
					"/product/detail/"+pr_code);
		}
		return mv;
	}
	
    // 상품 상세페이지 - 수정
	@RequestMapping(value = "/product/update/{pr_code}", method=RequestMethod.GET)
	public ModelAndView boardUpdate(ModelAndView mv,
			@PathVariable("pr_code")int pr_code) {
		ProductVO vo = productService.getProduct(pr_code);
		ArrayList<FileVO> files = productService.getFileList(pr_code);
		mv.addObject("vo", vo);
		mv.addObject("files", files);
		mv.setViewName("/product/update");
		return mv;
	}
	@RequestMapping(value = "/product/update/{pr_code}", method=RequestMethod.POST)
	public ModelAndView boardUpdatePost(ModelAndView mv,
			@PathVariable("pr_code")int pr_code, ProductVO vo,
			MultipartFile []files, int [] fileNums, HttpServletResponse response) {
		if(productService.updateProduct(vo, files, fileNums)) {
			MessageUtils.alertAndMovePage(response, 
					"게시글을 수정했습니다.", "/OnAirAuction", 
					"/product/detail/"+pr_code);
		}else {
			MessageUtils.alertAndMovePage(response, 
					"게시글을 수정하지 못했습니다.", "/OnAirAuction", 
					"/product/list");
		}
		return mv;
	}
}
