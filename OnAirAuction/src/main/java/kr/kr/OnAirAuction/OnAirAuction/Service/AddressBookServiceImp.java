package kr.kr.OnAirAuction.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import kr.kr.OnAirAuction.DAO.AddressBookDAO;

import kr.kr.OnAirAuction.VO.AddressBookVO;

import kr.kr.OnAirAuction.VO.MemberVO;

@Service
public class AddressBookServiceImp implements AddressBookService{
	
	@Autowired
	AddressBookDAO addressBookDao;

	// 주소혹 조회
	
	@Override
	public ArrayList<AddressBookVO> getAddressBook(MemberVO user) {
		
		if(user == null) {
			
			return null;
			
		}
		
		return addressBookDao.selectAddressBook(user);
		
	}
	
	// 주소록 등록

	@Override
	public boolean insertAddressBook(AddressBookVO ab, MemberVO user) {
		
		System.out.println(user);
		
		if(user == null) {
			
			return false;
			
		}
		
		System.out.println(ab);
		
		if(ab == null) {
			
			return false;
			
		}
		
		ab.setBl_me_id(user.getMe_id());
		
		addressBookDao.insertAddressBook(ab);
		
		return true;
		
	}
	
	// 주소록 수정

	@Override
	public boolean updateAddressBook(AddressBookVO ab, MemberVO user) {
		
		System.out.println(ab);
		
		if(ab == null || ab.getBl_num() <= 0) {
			
			return false;
			
		}
		
		if(addressBookDao.updateAddressBook(ab) == 0) {
			
			return false;
			
		}
			
		return true;
		
	}
	
	// 주소록 삭제

	@Override
	public boolean deleteAddressBook(int bl_num) {
		
		if(bl_num <= 0) {
			
			return false;
			
		}
			
		return addressBookDao.deleteAddressBook(bl_num);
		
	}

}