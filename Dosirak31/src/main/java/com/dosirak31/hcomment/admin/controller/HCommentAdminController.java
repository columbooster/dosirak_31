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
	 * 관리자게시판 left.jsp에서 운동 댓글 관리 페이지 클릭시 운동 댓글 관리 페이지로 넘어가게함
	
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage"; 
	}
	
	 ****************************************************************************/
	
	
	
	/****************************************************************************
	 * 관리자 헬스 댓글 게시판 조회
	 ****************************************************************************/
	 @GetMapping(value = "/hcommentManage") 
	 public String list(HCommentVO hvo, Model model) {
		 	
		 //전체 레코드 조회
	        List<HCommentVO> list = null;
	        list = hcommentService.select(hvo); // 페이징 처리된 댓글 전체 가져오기
	        model.addAttribute("list",list);
	        
	        //전체 레코드 수 구현
			int total = hcommentService.hcommentListCnt(); 
			
			//페이징 처리
			model.addAttribute("pageMaker", new PageDTO(hvo, total));
			
			return "hcomment/admin/hcommentManage";  // 200
	        
	    }
	 
	 
	    /****************************************************************************
		 * 관리자 헬스 댓글 게시판 지정된 댓글을 삭제
		****************************************************************************/
	
			@RequestMapping("/remove")   //ex. /comment/1 <- 1번 댓글번호를 가진 것들을 삭제한다.
			public String remove(HCommentVO hvo,Model model) {
				
				int rowCnt = hcommentService.deleteadmin(hvo); // 삭제해야할 댓글 고유번호를 넘겨줌

				//전체 레코드 조회
		        List<HCommentVO> list = null;
		        list = hcommentService.select(hvo); // 페이징 처리된 댓글 전체 가져오기
		        model.addAttribute("list",list);
		        
		        //전체 레코드 수 구현
				int total = hcommentService.hcommentListCnt(); 
				
				//페이징 처리
				model.addAttribute("pageMaker", new PageDTO(hvo, total));
				
				return "hcomment/admin/hcommentManage";
			}
	 

}
