package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import kr.kr.OnAirAuction.VO.AddressBookVO;

import kr.kr.OnAirAuction.VO.MemberVO;

public interface AddressBookService {
	
	// 주소록 조회

	ArrayList<AddressBookVO> getAddressBook(MemberVO user);
	
	// 주소록 등록

	boolean insertAddressBook(AddressBookVO ab, MemberVO user);
	
	// 주소록 수정

	boolean updateAddressBook(AddressBookVO ab, MemberVO user);
	
	// 주소록 삭제

	boolean deleteAddressBook(int bl_num);

}