package kr.kr.OnAirAuction.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Service.MemberService;

import kr.kr.OnAirAuction.VO.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv) {
		
		mv.setViewName("/main/home");
		
		return mv;
		
	}
	
	// 로그인
	
	@RequestMapping(value= "/Login", method = RequestMethod.GET)
	
	public ModelAndView Login(ModelAndView mv) {
		
		mv.setViewName("/Member/Login");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/Login", method=RequestMethod.POST)
	
	public ModelAndView loginPost(ModelAndView mv, MemberVO member) {
		
		System.out.println(member);
		
		MemberVO user = memberService.login(member);
		
		System.out.println(user);
		
		if(user != null) {
			
			mv.setViewName("redirect:/");
			
			System.out.println("로그인 성공");
			
		} else {
			
			mv.setViewName("redirect:/Login");
			
			System.out.println("로그인 실패");
			
		}
		
		return mv;
	}
	
}
