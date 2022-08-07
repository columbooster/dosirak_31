package com.dosirak31.admin.adminPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.admin.adminPage.dao.AdminPageDao;
import com.dosirak31.food.order.vo.ClientVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminPageServiceImpl implements AdminPageService {
	
	private AdminPageDao adminPageDao;
	@Override
	public List<ClientVO> memberList(ClientVO cvo) {
		List<ClientVO> memberList=adminPageDao.memberList(cvo);
		return memberList;
	}
	@Override
	public int memberListCnt(ClientVO cvo) {
		
		return adminPageDao.memberListCnt(cvo);
	}

}
