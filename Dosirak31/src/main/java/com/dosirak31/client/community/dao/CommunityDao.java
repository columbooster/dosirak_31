package com.dosirak31.client.community.dao;

import java.util.List;

import com.dosirak31.client.community.vo.CommunityVO;

public interface CommunityDao {
	public List<CommunityVO> communityList(CommunityVO cvo);
	public int communityInsert(CommunityVO cvo);
	public CommunityVO communityDetail(CommunityVO cvo);
	public int pwdConfirm(CommunityVO cvo);
	public int communityUpdate(CommunityVO cvo);
	public int communityDelete(int community_no);
	public int readCntUpdate(CommunityVO cvo);
}
