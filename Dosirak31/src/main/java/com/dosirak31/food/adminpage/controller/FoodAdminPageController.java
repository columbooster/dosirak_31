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
	/*��ٱ��Ͽ� ��ǰ �߰� �� ��ٱ��� �������� �̵��ϸ鼭 select*/
	@RequestMapping(value="/orderhistory",method=RequestMethod.GET)
	public String orderhistory(OrderDetailVO odv, Model model){
		List<OrderDetailVO> orderhistory=foodOrderService.orderhistory(odv);
		model.addAttribute("orderhistory",orderhistory);
		
		//��ü ���ڵ� �� ����
		int total=foodOrderService.orderListCnt(odv);
		//����¡ ó��
		model.addAttribute("pageMaker",new PageDTO(odv,total));
				
		
		return "/food/admin/orderhistory"; 
	}
}
