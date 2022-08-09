package com.dosirak31.hcomment.client.dao;

import java.util.List;

import com.dosirak31.hcomment.client.vo.HCommentVO;

public interface HCommentDao {
	
	 	public List<HCommentVO> selectAll(Integer health_no);

		public int delete(HCommentVO hcvo);
		
		public int insert(HCommentVO hvo);

		public int update(HCommentVO hvo);

}
