package com.dosirak31.admin.community.service;

import java.util.List;

import com.dosirak31.client.community.vo.CommunityVO;

public interface AdminCommunityService {
	public List<CommunityVO> communityList(CommunityVO cvo);
	public int communityListCnt(CommunityVO cvo);
}
