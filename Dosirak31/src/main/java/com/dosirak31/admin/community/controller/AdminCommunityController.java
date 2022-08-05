package com.dosirak31.admin.community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.admin.community.service.AdminCommunityService;
import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/community/admin/*")
@Log4j
public class AdminCommunityController {
	
	@Setter(onMethod_ = @Autowired)
	private AdminCommunityService adminCommunityService;
	
	/************************************
	 * 글 목록 구현하기
	 *************************************/
	
	@RequestMapping(value = "/communityList", method = RequestMethod.GET)
	public String communityList(CommunityVO cvo, Model model) {
		log.info("admin communityList 호출 성공");
		
		List<CommunityVO> communityList = adminCommunityService.communityList(cvo);
		model.addAttribute("communityList", communityList);
		
		//전체 레코드 수 구현
		int total = adminCommunityService.communityListCnt(cvo);
		model.addAttribute("pageMaker", new PageDTO(cvo, total));
		
		int count = total - (cvo.getPageNum()-1) * cvo.getAmount();
		model.addAttribute("count", count);
		
		return "/community/admin/communityList";
	}

}
