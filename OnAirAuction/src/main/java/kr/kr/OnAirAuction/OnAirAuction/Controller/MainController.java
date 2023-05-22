package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Pagination.Criteria;
import kr.kr.OnAirAuction.Pagination.PageMaker;
import kr.kr.OnAirAuction.Service.MainService;
import kr.kr.OnAirAuction.VO.FileVO;
import kr.kr.OnAirAuction.VO.ProductVO;

@Controller
public class MainController {

	@Autowired
	private MainService mainService;


	@RequestMapping(value = "/",  method=RequestMethod.GET)
	public ModelAndView home(ModelAndView mv, Integer pr_code, Integer fi_num) {
		ArrayList<ProductVO> list = mainService.getProductList(pr_code);
		ArrayList<FileVO> files = mainService.getFileList(fi_num);
		System.out.println(files);
    	mv.addObject("list", list);
    	mv.addObject("files", files);
		mv.setViewName("/main/home");	
		return mv;
	}


}