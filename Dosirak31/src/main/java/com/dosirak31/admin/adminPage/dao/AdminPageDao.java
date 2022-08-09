package com.dosirak31.admin.adminPage.dao;

import java.util.List;
import com.dosirak31.food.order.vo.ClientVO;

public interface AdminPageDao {
	public List<ClientVO> memberList(ClientVO cvo);//회원 목록 조회해오기
	public int memberListCnt(ClientVO cvo);//페이징처리를 위한 list개수
}
