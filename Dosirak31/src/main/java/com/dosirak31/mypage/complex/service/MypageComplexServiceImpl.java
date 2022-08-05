package com.dosirak31.mypage.complex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.mypage.complex.dao.MypageComplexDao;
import com.dosirak31.mypage.complex.vo.MypageComplexVO;

import lombok.Setter;

@Service
public class MypageComplexServiceImpl implements MypageComplexService {
	
	@Setter(onMethod_ = @Autowired)
	private MypageComplexDao mypageComplexDao;
	
	//마이페이지 목록 구현
	@Override
	public List<MypageComplexVO> mypageList(MypageComplexVO mcvo) {
		List<MypageComplexVO> list= null;
		list = mypageComplexDao.mypageList(mcvo);
		return list;
	}

}
