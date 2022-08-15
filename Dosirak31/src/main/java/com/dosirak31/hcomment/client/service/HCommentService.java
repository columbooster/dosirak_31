package com.dosirak31.hcomment.client.service;

import java.util.List;
import java.util.Map;

import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.hcomment.client.vo.HCommentVO;

public interface HCommentService {
	
	public List<HCommentVO> selectAll(Integer health_no);
	
	public int delete(HCommentVO hcvo);

	public int insert(HCommentVO hvo);

	public int update(HCommentVO hvo);
	
	public int hcommentListCnt();// 관리자페이지 댓글 갯수 세기
	
	public List<HCommentVO> select(HCommentVO hvo); // 관리자페이지 댓글 전체 목록 불러오기

	public int deleteadmin(HCommentVO hvo); //관리자페이지 댓글 삭제
	
	
								
	
	


}
