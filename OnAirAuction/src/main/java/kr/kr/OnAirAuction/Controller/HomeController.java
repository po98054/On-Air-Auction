package kr.kr.OnAirAuction.Controller;

import java.util.HashMap;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Service.MemberService;

import kr.kr.OnAirAuction.VO.MemberVO;

import kr.kr.OnAirAuction.VO.MemberOKVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/")
	public ModelAndView home(ModelAndView mv) {
		
		mv.setViewName("/main/home");
		
		return mv;
		
	}
	
	// 회원 가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	
	public ModelAndView SignUp(ModelAndView mv) {
		
		mv.setViewName("/Member/SignUp");
		
		return mv;
		
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	
	public ModelAndView SignUpPost(ModelAndView mv, MemberVO member) {
		
		System.out.println(member);
		
		boolean isSignUp = memberService.signUp(member);
		
		if(isSignUp) {
			
			System.out.println("회원 가입 성공");
			
			memberService.emailAuthentication(member.getMe_id(), member.getMe_email());
			
			mv.setViewName("/main/home");
			
		} else {
			
			System.out.println("회원 가입 실패");
			
			mv.setViewName("/Member/SignUp");
			
		}
		
		return mv;
		
	}
	
	// 이메일 인증
	
	@RequestMapping(value = "/email", method=RequestMethod.GET)
	
	public ModelAndView email(ModelAndView mv, MemberOKVO mok) {
		
		if(memberService.emailAuthenticationConfirm(mok)) {
			
			System.out.println("이메일 인증 성공");
			
		}else {
			
			System.out.println("이메일 인증 실패");
			
		}
		
		mv.setViewName("redirect:/");
		
		return mv;
		
	}
	
	// 아이디 중복 체크
	
	@ResponseBody
	@RequestMapping(value = "/check/id", method=RequestMethod.POST)
	
	public Map<String, Object> boardLike(@RequestBody MemberVO member) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean res = memberService.checkId(member);
		
		map.put("res", res);
		
		return map;
		
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
