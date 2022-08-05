package com.dosirak31.mypage.complex.dao;

import java.util.List;

import com.dosirak31.mypage.complex.vo.MypageComplexVO;

public interface MypageComplexDao {
	
	public List<MypageComplexVO> mypageList(MypageComplexVO mcvo);
}
