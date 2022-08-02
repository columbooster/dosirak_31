package com.dosirak31.health.board.service;

import java.util.List;

import com.dosirak31.health.board.vo.HealthBoardVO;

public interface HealthBoardService {
	
	public List<HealthBoardVO> healthList(HealthBoardVO hbvo);			// Workout 게시판 조회	

	public HealthBoardVO noticeDetail(HealthBoardVO hbvo); 				// 공지사항 게시글 상세 조회

	public HealthBoardVO healthDetail(HealthBoardVO hbvo);				// 웨이트 & 유산소 상세 조회

	public int healthBoardInsert(HealthBoardVO hbvo) throws Exception;	// 글 쓰기 등록

	public int boardListCnt(HealthBoardVO hbvo);//페이징 처리 위한 전체 목록 수 조회

										

}
