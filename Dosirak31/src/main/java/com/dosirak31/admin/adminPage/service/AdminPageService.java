package com.dosirak31.admin.adminPage.service;


import java.util.List;

import com.dosirak31.admin.adminPage.vo.MemberGraphDTO;
import com.dosirak31.food.order.vo.ClientVO;

public interface AdminPageService {
	public List<ClientVO> memberList(ClientVO cvo);//ȸ�� ��� ��ȸ�ؿ���
	public int memberListCnt(ClientVO cvo);//����¡ó���� ���� list���� 
	public MemberGraphDTO ageGraph();//ȸ�� ����
	public MemberGraphDTO genderGraph();//ȸ�� ����
	public MemberGraphDTO countMember();//���� ȸ�������� ��
}
