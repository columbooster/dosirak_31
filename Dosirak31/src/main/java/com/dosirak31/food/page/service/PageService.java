package com.dosirak31.food.page.service;





import java.util.List;

import com.dosirak31.food.page.vo.PageVO;

public interface PageService {
	public List<PageVO> pageList(PageVO pvo);	// ��ȸ

	public PageVO pageDetail(PageVO pvo);	//��������
}
