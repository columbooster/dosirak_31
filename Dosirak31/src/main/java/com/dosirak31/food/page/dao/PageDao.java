package com.dosirak31.food.page.dao;


import java.util.List;

import com.dosirak31.food.page.vo.PageVO;

public interface PageDao {
	public List<PageVO> pageList(PageVO pvo);	// ��ȸ
	
	public PageVO pageDetail (PageVO pvo);		// ��������
}
