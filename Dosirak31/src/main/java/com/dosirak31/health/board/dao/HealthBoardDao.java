package com.dosirak31.health.board.dao;

import java.util.List;

import com.dosirak31.health.board.vo.HealthBoardVO;

public interface HealthBoardDao {			
	
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo);	// Workout �Խ��� ��ȸ
	public int healthHitUpdate(HealthBoardVO hbvo);				// ��ȸ��
	public HealthBoardVO noticeDetail(HealthBoardVO hbvo);		// �������� �Խñ� �� ��ȸ
	public HealthBoardVO healthDetail(HealthBoardVO hbvo);		// ����Ʈ & ����� ������ �� ��ȸ
	public int healthBoardInsert(HealthBoardVO hbvo);			// �� ���� ���
	public int boardListCnt(HealthBoardVO hbvo);//����¡ ó�� ���� ��� �� ��ȸ
}
