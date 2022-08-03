package com.dosirak31.food.adminpage.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.food.order.service.FoodOrderService;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;
@Controller
@RequestMapping("/food/admin/*")
@AllArgsConstructor
public class FoodAdminPageController {
	
	FoodOrderService foodOrderService;
	/*장바구니에 식품 추가 후 장바구니 페이지로 이동하면서 select*/
	@RequestMapping(value="/orderhistory",method=RequestMethod.GET)
	public String orderhistory(OrderDetailVO odv, Model model){
		List<OrderDetailVO> orderhistory=foodOrderService.orderhistory(odv);
		model.addAttribute("orderhistory",orderhistory);
		
		//전체 레코드 수 구현
		int total=foodOrderService.orderListCnt(odv);
		//페이징 처리
		model.addAttribute("pageMaker",new PageDTO(odv,total));
				
		
		return "/food/admin/orderhistory"; 
	}
}
