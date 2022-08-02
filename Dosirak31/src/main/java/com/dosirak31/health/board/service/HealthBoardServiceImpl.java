package com.dosirak31.health.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dosirak31.health.board.dao.HealthBoardDao;
import com.dosirak31.health.board.vo.HealthBoardVO;

import lombok.Setter;

@Service

public class HealthBoardServiceImpl implements HealthBoardService {

	@Setter(onMethod_ = @Autowired)
	private HealthBoardDao hBoardDao;

	/****************************************************************************
	 * Workout �Խ��� ��ȸ
	 ***************************************************************************/

	@Override
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo) {
		List<HealthBoardVO> healthList = null;
		healthList = hBoardDao.healthList(hbvo);
		return healthList;
	}

	/****************************************************************************
	 * �������� �Խñ� �� ��ȸ ����
	 ***************************************************************************/
	@Override
	public HealthBoardVO noticeDetail(HealthBoardVO hbvo) {
		HealthBoardVO noticeDetail = null;
		
		hBoardDao.healthHitUpdate(hbvo); //��ȸ�� ���� �޼��� ȣ��.
		
		noticeDetail = hBoardDao.noticeDetail(hbvo);
		if(noticeDetail!=null) {
			noticeDetail.setHealth_contents(noticeDetail.getHealth_contents().toString().replace("\n", "<br />"));
		}
		return noticeDetail;
	}
	
	/****************************************************************************
	 * ����Ʈ & ����� ������ �� ��ȸ ����
	 ***************************************************************************/
	@Override
	public HealthBoardVO healthDetail(HealthBoardVO hbvo) {
	HealthBoardVO weightDetail = null;
		
		hBoardDao.healthHitUpdate(hbvo); //��ȸ�� ���� �޼��� ȣ��.
		
		weightDetail = hBoardDao.healthDetail(hbvo);
		if(weightDetail!=null) {
			weightDetail.setHealth_url(weightDetail.getHealth_url());
		}
		return weightDetail;
	}

	/****************************************************************************
	 * �� ���� ���
	 ***************************************************************************/
	 // �� �Է� ����
	@Override
	public int healthBoardInsert(HealthBoardVO hbvo) throws Exception {
		int result = 0;
		
		/* ���ܸ� �߻���ų �ڵ� �ۼ�  */
		hbvo.setHealth_no(0);
		if(hbvo.getHealth_no()==0) {
			throw new IllegalArgumentException("0�� ���� ����� �� �����ϴ�.");
		}
		
		/*
		 * if(hbvo.getFile().getSize() > 0) { String fileName =
		 * HealthBasicFileUploadUtil.fileUpload(hbvo.getFile(), "health"); //
		 * health_weight_weightMain.jsp hbvo.setHealth_file(fileName);
		 * 
		 * String thumbName = HealthBasicFileUploadUtil.makeThumbnail(fileName); //
		 * thumbnail_health_weight_weightMain.jsp hbvo.setHealth_thumb(thumbName); }
		 */
		result = hBoardDao.healthBoardInsert(hbvo);
		return result;
	}

	@Override
	public int boardListCnt(HealthBoardVO hbvo) {
		return  hBoardDao.boardListCnt(hbvo);
	}   


}