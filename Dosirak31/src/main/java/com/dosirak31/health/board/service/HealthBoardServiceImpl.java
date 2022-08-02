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
	 * Workout 게시판 조회
	 ***************************************************************************/

	@Override
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo) {
		List<HealthBoardVO> healthList = null;
		healthList = hBoardDao.healthList(hbvo);
		return healthList;
	}

	/****************************************************************************
	 * 공지사항 게시글 상세 조회 구현
	 ***************************************************************************/
	@Override
	public HealthBoardVO noticeDetail(HealthBoardVO hbvo) {
		HealthBoardVO noticeDetail = null;
		
		hBoardDao.healthHitUpdate(hbvo); //조회수 증가 메서드 호출.
		
		noticeDetail = hBoardDao.noticeDetail(hbvo);
		if(noticeDetail!=null) {
			noticeDetail.setHealth_contents(noticeDetail.getHealth_contents().toString().replace("\n", "<br />"));
		}
		return noticeDetail;
	}
	
	/****************************************************************************
	 * 웨이트 & 유산소 동영상 상세 조회 구현
	 ***************************************************************************/
	@Override
	public HealthBoardVO healthDetail(HealthBoardVO hbvo) {
	HealthBoardVO weightDetail = null;
		
		hBoardDao.healthHitUpdate(hbvo); //조회수 증가 메서드 호출.
		
		weightDetail = hBoardDao.healthDetail(hbvo);
		if(weightDetail!=null) {
			weightDetail.setHealth_url(weightDetail.getHealth_url());
		}
		return weightDetail;
	}

	/****************************************************************************
	 * 글 쓰기 등록
	 ***************************************************************************/
	 // 글 입력 구현
	@Override
	public int healthBoardInsert(HealthBoardVO hbvo) throws Exception {
		int result = 0;
		
		/* 예외를 발생시킬 코드 작성  */
		hbvo.setHealth_no(0);
		if(hbvo.getHealth_no()==0) {
			throw new IllegalArgumentException("0번 글은 등록할 수 없습니다.");
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