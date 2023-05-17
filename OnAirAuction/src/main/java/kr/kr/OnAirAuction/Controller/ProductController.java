package kr.kh.onAirAuction.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onAirAuction.pagination.Criteria;
import kr.kh.onAirAuction.pagination.PageMaker;
import kr.kh.onAirAuction.service.ProductService;
import kr.kh.onAirAuction.utils.MessageUtils;
import kr.kh.onAirAuction.vo.FileVO;
import kr.kh.onAirAuction.vo.ProductCategoryVO;
import kr.kh.onAirAuction.vo.ProductLargeCategoryVO;
import kr.kh.onAirAuction.vo.ProductMiddleCategoryVO;
import kr.kh.onAirAuction.vo.ProductSmallCategoryVO;
import kr.kh.onAirAuction.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
    private ProductService productService;
	
	// ��ǰ ���
	@RequestMapping(value="/product/insert", method=RequestMethod.GET)
	public  ModelAndView productInsert(ModelAndView mv){
		mv.setViewName("/product/insert");

		return mv;
	}
    @RequestMapping(value="/product/insert", method=RequestMethod.POST)
	public String productInsertPOST(ProductLargeCategoryVO plc, ProductMiddleCategoryVO pmc, 
			ProductSmallCategoryVO psc, ProductCategoryVO pc,		
			ProductVO vo, MultipartFile []files, HttpSession session){
    	ProductVO product = new ProductVO();
    	session.setAttribute("product", product);
		productService.insertProduct(plc, pmc, psc, pc, vo, files);
		return "redirect:/product/list";
	}
    
    // ��ǰ ����Ʈ
    @RequestMapping(value="/product/list", method=RequestMethod.GET)
    public ModelAndView list(ModelAndView mv, Criteria cri) {
    	ArrayList<ProductVO> list = productService.getProductList(cri);
    	int totalCount = productService.getProductTotalCount(cri);
		PageMaker pm = new PageMaker(totalCount, 3, cri);
    	mv.addObject("list", list);
    	mv.addObject("pm", pm);
    	mv.setViewName("/product/list");
    	return mv;
	}
    
    // ��ǰ �� ������
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
    
    // ��ǰ �������� - ����
	@RequestMapping(value = "/product/delete/{pr_code}", method=RequestMethod.GET)
	public ModelAndView boardDelete(ModelAndView mv, 
			@PathVariable("pr_code")int pr_code,
			HttpServletResponse response) {
		boolean res = productService.deleteProduct(pr_code);
		if(res) {
			MessageUtils.alertAndMovePage(response, 
					"�Խñ��� �����߽��ϴ�.", "/onAirAuction", "/product/list");
		}else {
			MessageUtils.alertAndMovePage(response, 
					"�ۼ��ڰ� �ƴϰų� �������� ���� �Խñ��Դϴ�.", "/onAirAuction", 
					"/product/detail/"+pr_code);
		}
		return mv;
	}
	
    // ��ǰ �������� - ����
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
					"�Խñ��� �����߽��ϴ�.", "/onAirAuction", 
					"/product/detail/"+pr_code);
		}else {
			MessageUtils.alertAndMovePage(response, 
					"�Խñ��� �������� ���߽��ϴ�.", "/onAirAuction", 
					"/product/list");
		}
		return mv;
	}
}