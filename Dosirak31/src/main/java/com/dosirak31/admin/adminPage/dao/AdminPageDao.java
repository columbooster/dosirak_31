package com.dosirak31.admin.adminPage.dao;

import java.util.List;
import com.dosirak31.food.order.vo.ClientVO;

public interface AdminPageDao {
	public List<ClientVO> memberList(ClientVO cvo);//ȸ�� ��� ��ȸ�ؿ���
	public int memberListCnt(ClientVO cvo);//����¡ó���� ���� list����

}
