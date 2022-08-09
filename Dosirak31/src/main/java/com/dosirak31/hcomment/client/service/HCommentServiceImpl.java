package com.dosirak31.hcomment.client.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.hcomment.client.dao.HCommentDao;
import com.dosirak31.hcomment.client.vo.HCommentVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class HCommentServiceImpl implements HCommentService{
	
	private HCommentDao hcommentDao;

	@Override
	public List<HCommentVO> selectAll(Integer health_no) {
		
		List<HCommentVO> hvo = hcommentDao.selectAll(health_no);
		
		return hvo; // health_no�� ��ġ�ϴ� ��ü ��ȯ
	}
	
	@Override
	public int delete(HCommentVO hcvo) {
		
		 int deletesu = hcommentDao.delete(hcvo);
	        
		return deletesu; //�����ϰ� �Ϸ�� ���� ���� ��ȯ
	}

	@Override
	public int insert(HCommentVO hvo) {
		
		int insertsu =  hcommentDao.insert(hvo);
		
		return insertsu; //insert�ϰ� �Ϸ�� ���� ���� ��ȯ
	}

	@Override
	public int update(HCommentVO hvo) {
		
		int updatesu = hcommentDao.update(hvo);
		
		return updatesu; // ������Ʈ �� ���� ���� ��ȯ
	}

}
