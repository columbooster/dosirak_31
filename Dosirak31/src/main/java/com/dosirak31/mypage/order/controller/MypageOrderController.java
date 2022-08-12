package com.dosirak31.mypage.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.mypage.order.service.MypageOrderService;
import com.dosirak31.mypage.order.vo.MypageOrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping("/mypage/client/*")
@Controller
public class MypageOrderController {
	
	private MypageOrderService mypageOrderService;
	
	/***********************************************
	 * 주문 내역 조회
	 ***********************************************/
	@GetMapping("/mypageOrderList")
	public String mypageOrderList(@ModelAttribute MypageOrderVO movo, Model model) {
		log.info("mypageOrderList 호출 성공");
		
		List<MypageOrderVO> mypageOrderList = mypageOrderService.mypageOrderList(movo);
		model.addAttribute("mypageOrderList", mypageOrderList);
		
		/*int total = mypageOrderService.mypageOrderListCnt(movo);
		model.addAttribute("pageMaker", new PageDTO(movo, total));*/
		
		return "mypage/client/mypageOrderList";
	}
}
