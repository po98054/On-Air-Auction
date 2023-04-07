package kr.kh.onairauction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.onairauction.dao.TestPageDAO;
import kr.kh.onairauction.vo.TestPageVO;

@Service
public class TestPageServiceImp implements TestPageService{
	
	@Autowired
	TestPageDAO testpageDao;

	@Override
	public void insertImmediate(TestPageVO testPage) {
		testpageDao.insertImmediate(testPage);	
	}

}
