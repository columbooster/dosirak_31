package com.dosirak31.food.page.service;





import java.util.List;

import com.dosirak31.food.page.vo.PageVO;

public interface PageService {
	public List<PageVO> pageList(PageVO pvo);	// 조회

	public PageVO pageDetail(PageVO pvo);	//상세페이지
}
