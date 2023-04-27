package kr.kr.OnAirAuction.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import kr.kr.OnAirAuction.Service.AddressBookService;

import kr.kr.OnAirAuction.VO.AddressBookVO;

import kr.kr.OnAirAuction.VO.MemberVO;

@Controller
public class AddressBookController {
	
	@Autowired
	AddressBookService addressBookervice;

	// 주소록 조회
	
	@RequestMapping(value="/AddressBook/List")
	public ModelAndView AddressBookList(ModelAndView mv, HttpSession session) {
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		//admin서비스에게 모든 게시글 타입을 가져올라고 요청
		
		ArrayList<AddressBookVO> list = addressBookervice.getAddressBook(user);
		
		System.out.println(list);
		
		mv.addObject("list", list);
		
		mv.setViewName("/AddressBook/AddressBook");
		
		return mv;
		
	}
	
	// 주소록 등록
	
	@RequestMapping(value="/AddressBook/insert", method=RequestMethod.POST)
	
	public ModelAndView AddressBookInsert(ModelAndView mv, AddressBookVO ab, HttpSession session) {
		
		System.out.println(ab);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = addressBookervice.insertAddressBook(ab, user);
		
		if(res) {
			
			System.out.println("주소록 등록 성공!!!");
			
		} else {
			
			System.out.println("주소록 등록 실패!!");
			
		}
		
		mv.setViewName("redirect:/AddressBook/List");
		
		return mv;
		
	}
	
	// 주소록 수정
	
	@RequestMapping(value="/AddressBook/update", method=RequestMethod.POST)
	
	public ModelAndView AddressBookUpdate(ModelAndView mv, AddressBookVO ab, HttpSession session) {
		
		System.out.println(ab);
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		System.out.println(user);
		
		boolean res = addressBookervice.updateAddressBook(ab, user);
		
		if(res) {
			
			System.out.println("주소록 수정 성공!!!");
			
		} else {
			
			System.out.println("주소록 수정 실패!!!");
			
		}
		
		mv.setViewName("redirect:/AddressBook/List");
		
		return mv;
	}
	
	// 주소록 삭제
	
	@RequestMapping(value="/AddressBook/delete", method=RequestMethod.POST)
	
	public ModelAndView AddressBookDelete(ModelAndView mv, AddressBookVO ab) {
		
		boolean res = addressBookervice.deleteAddressBook(ab.getBl_num());
		
		if(res) {
			
			System.out.println("주소록 삭제 성공!!!");
			
		} else {
			
			System.out.println("주소록 삭제 실패!!!");
			
		}
		
		mv.setViewName("redirect:/AddressBook/List");
		
		return mv;
	}
	
}