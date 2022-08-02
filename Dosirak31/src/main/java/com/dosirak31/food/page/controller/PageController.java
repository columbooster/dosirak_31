package com.dosirak31.food.page.controller;



import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dosirak31.food.page.service.PageService;
import com.dosirak31.food.page.vo.PageVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping("/foodReview/*")
@Controller
public class PageController {
	
	private PageService pageService;
	
	/******************************************
	 * 페이지 조회
	 ******************************************/
	@RequestMapping(value= "/pageList", method = RequestMethod.GET)
	public String pageList(@ModelAttribute PageVO pvo, Model model) {
		log.info("pageList 호출 성공");
		
		List<PageVO> pageList = pageService.pageList(pvo);
		model.addAttribute("pageList", pageList);
		
		return "foodReview/client/pageList";
	}
	
	
	
	
	
	/******************************************
	 * Detail 페이지 조회
	 ******************************************/
	@RequestMapping(value = "/foodReviewList", method=RequestMethod.GET)
	//@GetMapping("/foodReviewList")
	public String pageDetail(@ModelAttribute("data") PageVO pvo, Model model) {
		log.info("pageDetail 호출 성공");
		
		PageVO detail = pageService.pageDetail(pvo);
		model.addAttribute("detail", detail);
		
		return "foodReview/client/foodReviewList";
	}
	
	
}
