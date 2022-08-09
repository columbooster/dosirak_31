package com.dosirak31.hcomment.admin.service;

import org.springframework.stereotype.Service;

import com.dosirak31.hcomment.client.dao.HCommentDao;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HCommentAdminServiceImpl implements HCommentAdminService{
	
	private HCommentDao hcommentDao; // 미리 만들어놓은 회원헬스댓글 dao 사용
	
	
	

}
