package kr.kh.onairauction.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.onairauction.service.TestPageService;
import kr.kh.onairauction.vo.TestPageVO;

@Controller
public class TestPageController {

	@Autowired
    TestPageService testpageService;
	
	@RequestMapping(value = "/testPage/insert", method = RequestMethod.GET)
	public ModelAndView testInsert(ModelAndView mv, Integer ac_num) {
		mv.setViewName("/testPage/insert");
		return mv;
	}
	
	@RequestMapping(value = "/testPage/insert", method = RequestMethod.POST)
	public ModelAndView testInsertPost(ModelAndView mv, TestPageVO testPage) {
		testpageService.insertImmediate(testPage);

		mv.setViewName("redirect:/general");
		return mv;
	}
}
