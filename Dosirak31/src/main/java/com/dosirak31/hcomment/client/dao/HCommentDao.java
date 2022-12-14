package com.dosirak31.hcomment.client.dao;

import java.util.List;
import java.util.Map;

import com.dosirak31.common.vo.CommonVO;
import com.dosirak31.hcomment.client.vo.HCommentVO;

public interface HCommentDao {
	
	 	public List<HCommentVO> selectAll(Integer health_no);

		public int delete(HCommentVO hcvo);
		
		public int insert(HCommentVO hvo);

		public int update(HCommentVO hvo);
		
		public int hcommentListCnt();	//전체 댓글 수 조회

		public List<HCommentVO> select(HCommentVO hvo); // 전체 댓글 가져오기
		
		public int deleteadmin(HCommentVO hvo); // 관리자 댓글 삭제
							
}
