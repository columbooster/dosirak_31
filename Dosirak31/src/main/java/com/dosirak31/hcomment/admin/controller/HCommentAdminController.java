package com.dosirak31.hcomment.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dosirak31.client.community.vo.CommunityVO;
import com.dosirak31.common.vo.CommonVO;
import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.hcomment.client.service.HCommentService;
import com.dosirak31.hcomment.client.vo.HCommentVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/adminhreplies/*")
@Log4j
@AllArgsConstructor
public class HCommentAdminController {
	
	private HCommentService hcommentService; 
	
	/****************************************************************************
	 * �����ڰԽ��� left.jsp���� � ��� ���� ������ Ŭ���� � ��� ���� �������� �Ѿ����
	
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage"; 
	}
	
	 ****************************************************************************/
	
	
	
	/****************************************************************************
	 * ������ �ｺ ��� �Խ��� ��ȸ
	 ****************************************************************************/
	 @GetMapping(value = "/hcommentManage") 
	 public String list(HCommentVO hvo, Model model) {
		 	
		 //��ü ���ڵ� ��ȸ
	        List<HCommentVO> list = null;
	        list = hcommentService.select(hvo); // ����¡ ó���� ��� ��ü ��������
	        model.addAttribute("list",list);
	        
	        //��ü ���ڵ� �� ����
			int total = hcommentService.hcommentListCnt(); 
			
			//����¡ ó��
			model.addAttribute("pageMaker", new PageDTO(hvo, total));
			
			return "hcomment/admin/hcommentManage";  // 200
	        
	    }
	 
	 
	    /****************************************************************************
		 * ������ �ｺ ��� �Խ��� ������ ����� ����
		****************************************************************************/
	
			@RequestMapping("/remove")   //ex. /comment/1 <- 1�� ��۹�ȣ�� ���� �͵��� �����Ѵ�.
			public String remove(HCommentVO hvo,Model model) {
				
				int rowCnt = hcommentService.deleteadmin(hvo); // �����ؾ��� ��� ������ȣ�� �Ѱ���

				//��ü ���ڵ� ��ȸ
		        List<HCommentVO> list = null;
		        list = hcommentService.select(hvo); // ����¡ ó���� ��� ��ü ��������
		        model.addAttribute("list",list);
		        
		        //��ü ���ڵ� �� ����
				int total = hcommentService.hcommentListCnt(); 
				
				//����¡ ó��
				model.addAttribute("pageMaker", new PageDTO(hvo, total));
				
				return "hcomment/admin/hcommentManage";
			}
	 

}
