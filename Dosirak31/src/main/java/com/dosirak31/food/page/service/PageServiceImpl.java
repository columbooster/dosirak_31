package com.dosirak31.food.page.service;





import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dosirak31.food.page.dao.PageDao;
import com.dosirak31.food.page.vo.PageVO;
import com.dosirak31.food.review.dao.FoodReviewDao;

import lombok.Setter;

@Service
public class PageServiceImpl implements PageService {
	
	@Setter(onMethod_ = @Autowired)
	private PageDao pageDao;
	
	@Setter(onMethod_ = @Autowired)
	private FoodReviewDao foodReviewDao;
	
	// 상세페이지
	@Override
	public PageVO pageDetail(PageVO pvo) {
		PageVO detail = null;
		detail = pageDao.pageDetail(pvo);
		
		return detail;
	}

	// 조회
	@Override
	public List<PageVO> pageList(PageVO pvo) {
		List<PageVO> list= null;
		list = pageDao.pageList(pvo);
		return list;
	}

	
	
	
	

}
