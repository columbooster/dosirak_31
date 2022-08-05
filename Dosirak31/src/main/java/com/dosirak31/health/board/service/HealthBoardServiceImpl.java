package com.dosirak31.health.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.common.file.FileUploadUtil;
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
	 * 웨이트 & 유산소 동영상 상세 조회 구현
	 ***************************************************************************/
	@Override
	public HealthBoardVO healthDetail(HealthBoardVO hbvo) {
	HealthBoardVO weightDetail = null;
		
		// 조회수 증가 메서드 호출.
		hBoardDao.boardListCnt(hbvo); 	
		weightDetail = hBoardDao.healthDetail(hbvo);
		if(weightDetail!=null) {
	           weightDetail.setHealth_contents(weightDetail.getHealth_contents().toString().replaceAll("\n", "<br/>"));
	        }
		// 동영상 url 메서드
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
	
	/****************************************************************************
	 * 글 수정 등록
	 ***************************************************************************/
	@Override
	 public int healthBoardUpdate(HealthBoardVO hbvo) throws Exception {
        int result = 0;
        if(!hbvo.getFile().isEmpty()) {
           if(!hbvo.getHealth_img().isEmpty()) {
        	   FileUploadUtil.fileDelete(hbvo.getHealth_img());
         
           }
           
           String fileName = FileUploadUtil.fileUpload(hbvo.getFile(), "health");
           hbvo.setHealth_img(fileName);
        }
        result = hBoardDao.healthBoardUpdate(hbvo);
        return result;
     }

	/****************************************************************************
	 * 글 삭제 구현
	 * @throws Exception 
	 ***************************************************************************/
	@Override
	public int healthBoardDelete(HealthBoardVO hbvo) throws Exception {
		int result=0;
	      if(!hbvo.getHealth_img().isEmpty()) {
	         FileUploadUtil.fileDelete(hbvo.getHealth_img());
	      }
	      result=hBoardDao.healthBoardDelete(hbvo.getHealth_no());
	      return result;
	}

	/****************************************************************************
	 * 페이징 처리 위한 전체 목록 수 조회
	 ***************************************************************************/
	@Override
	public int boardListCnt(HealthBoardVO hbvo) {
		return  hBoardDao.boardListCnt(hbvo);
	}

	@Override
	public int healthHitUpdate(HealthBoardVO hbvo) {
		int result=0;
	    result = hBoardDao.healthHitUpdate(hbvo);
	    return result;
		
	}




}