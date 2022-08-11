package com.dosirak31.hcomment.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 관리자게시판 left.jsp에서 이동
	 ****************************************************************************/
	@RequestMapping("/hcommentManage")
	public String hcommentManage() {
		
		return  "hcomment/admin/hcommentManage"; 
	}
	
	/****************************************************************************
	 * 관리자 헬스 댓글 게시판 조회
	 ****************************************************************************/
	 @ResponseBody
	 @GetMapping("/comments")  //
	    public ResponseEntity<List<HCommentVO>> list() {
		 
	        List<HCommentVO> list = null;
	        
	        try {
	        	
	            list = hcommentService.select();
	            
	            return new ResponseEntity<List<HCommentVO>>(list, HttpStatus.OK);  // 200
	        
	        } catch (Exception e) {
	        	
	            e.printStackTrace();
	            
	            return new ResponseEntity<List<HCommentVO>>(HttpStatus.BAD_REQUEST); // 400
	        }
	    }
	 
	 
	    /****************************************************************************
		 * 관리자 헬스 댓글 게시판 지정된 댓글을 삭제
		****************************************************************************/
	
			@DeleteMapping("/comments/{health_comment_no}")   //ex. /comment/1 <- 1번 댓글번호를 가진 것들을 삭제한다.
			public ResponseEntity<String> remove(@PathVariable Integer health_comment_no) {
				
				
				HCommentVO hvo = new HCommentVO();
				
				hvo.setHealth_comment_no(health_comment_no);
				
					try {	
							int rowCnt = hcommentService.deleteadmin(hvo); // 삭제해야할 댓글 고유번호를 넘겨줌

							if(rowCnt!=1)
								
								throw new Exception("Delete Failed");

							return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
							
					} catch (Exception e) {
						
							e.printStackTrace();
							
							return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
					}
			}
	 

}
