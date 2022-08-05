package com.dosirak31.admin.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.client.community.dao.CommunityDao;
import com.dosirak31.client.community.vo.CommunityVO;

import lombok.Setter;

@Service
public class AdminCommunityServiceImpl implements AdminCommunityService {

	@Setter(onMethod_ = @Autowired)
	private CommunityDao communityDao;
	
	
	@Override
	public List<CommunityVO> communityList(CommunityVO cvo) {
		List<CommunityVO> aList = null;
		aList = communityDao.communityList(cvo);
		return aList;
	}

	@Override
	public int communityListCnt(CommunityVO cvo) {
		int countNum = 0;
		countNum = communityDao.communityListCnt(cvo);
		return 0;
	}

}
