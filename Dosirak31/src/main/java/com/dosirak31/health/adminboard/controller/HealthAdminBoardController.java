package com.dosirak31.health.adminboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.common.vo.PageDTO;
import com.dosirak31.health.board.service.HealthBoardService;
import com.dosirak31.health.board.vo.HealthBoardVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Log4j
@Controller // HealthBoardController 인스턴스 만들어주기.
@RequestMapping("/health/*")
/*
 * 요청 URL을 어떤 method가 처리할지 mapping해주는 Annotation이다. 요청을 받는 형식인 GET, POST, PATCH,
 * PUT, DELETE 를 정의하기도 한다. 디폴트는 GET으로 설정된다.
 */
@AllArgsConstructor /* 모든 필드 값을 파라미터로 받는 생성자를 추가한다. */
public class HealthAdminBoardController {

	private HealthBoardService healthBoardService;

	/****************************************************************************
	 * Workout 게시판 조회
	 ***************************************************************************/
	@RequestMapping(value = "/admin/hBoardList", method = RequestMethod.GET)
	public String boardList() {

		return "health/admin/hBoardList"; // /WEB-INF/views/health/hBoardList.jsp <- Servlet-context.xml에서 설정함.
	}

	/****************************************************************************
	 * 웨이트 게시판 구현
	 ***************************************************************************/
	@RequestMapping(value = "/admin/weightList", method = RequestMethod.GET)
	public String weightList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("weightList 호출 성공");

		List<HealthBoardVO> weightList = healthBoardService.healthList(hbvo);
		model.addAttribute("weightList", weightList);
		
		//전체 레코드 수 구현
	    int total=healthBoardService.boardListCnt(hbvo);
	    //페이징 처리
	    model.addAttribute("pageMaker",new PageDTO(hbvo,total));
		
		return "health/admin/weightList";
	}

	/****************************************************************************
	 * 웨이트 운동 이미지 상세보기 구현
	 ***************************************************************************/
	@RequestMapping(value = "/admin/weightDetail", method = RequestMethod.GET)
	public String weightDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("weightDetail 호출 성공");
		// 조회수 조회
		healthBoardService.healthHit(hbvo);

		HealthBoardVO weightDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("weightDetail", weightDetail);

		return "health/admin/weightDetail";
	}
	/****************************************************************************
	 * 유산소 게시판 구현
	 ***************************************************************************/
	@RequestMapping(value = "/admin/cardioList", method = RequestMethod.GET)
	public String cardioList(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {

		log.info("cardioList 호출 성공");

		List<HealthBoardVO> cardioList = healthBoardService.healthList(hbvo);
		model.addAttribute("cardioList", cardioList);

		//전체 레코드 수 구현
	    int total=healthBoardService.boardListCnt(hbvo);
	    //페이징 처리
	    model.addAttribute("pageMaker",new PageDTO(hbvo,total));
		
		return "health/admin/cardioList";
	}
	
	/****************************************************************************
	 * 유산소 운동 이미지 상세보기 구현
	 ***************************************************************************/
	@RequestMapping(value = "/admin/cardioDetail", method = RequestMethod.GET)
	public String cardioDetail(@ModelAttribute("data") HealthBoardVO hbvo, Model model) {
		log.info("cardioDetail 호출 성공");
		// 조회수 조회
		healthBoardService.healthHit(hbvo);

		HealthBoardVO cardioDetail = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
		model.addAttribute("cardioDetail", cardioDetail);

		return "health/admin/cardioDetail";
	}
	
	/****************************************************************************	
	 *	글쓰기 폼 출력하기
	 ***************************************************************************/
	@RequestMapping(value="/admin/healthWriteForm")
	  	public String healthWriteForm() {
	      log.info("healthWriteForm");
	      
	      return "health/admin/healthWriteForm";
	   }
	
	/****************************************************************************	
	 *	글쓰기 구현
	 ***************************************************************************/
	   @RequestMapping(value="/admin/healthBoardInsert",method=RequestMethod.POST)
	   
	   public String healthBoardInsert(HealthBoardVO hbvo, Model model) throws Exception{
	      log.info("healthBoardInsert 호출 성공");
	      
	      int result=0;
	      String url="";
	      
	      result=healthBoardService.healthBoardInsert(hbvo);
	      if(result==1) {
	         url="/health/admin/weightList";
	      }else {
	         url="/health/admin/healthWriteForm";
	      }
	      return "redirect:"+url; 
	   }
	   /****************************************************************************	
		 *	웨이트 업데이트 폼 화면으로 이동
		 ***************************************************************************/
		@RequestMapping(value="/admin/weightUpdateForm")
		  	public String weightUpdateForm(@ModelAttribute("data") HealthBoardVO hbvo, Model model)  {
		      log.info("weightUpdateForm");
		      
		      HealthBoardVO weightUpdateForm = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
			
		      model.addAttribute("weightUpdate", weightUpdateForm);

				return "health/admin/weightUpdateForm";
		}
		
		 /****************************************************************************	
		 *	웨이트 업데이트 폼 구현하기
		 ***************************************************************************/
	   @RequestMapping(value="/admin/weightUpdate",method=RequestMethod.POST)
		   public String weightUpdate(@ModelAttribute HealthBoardVO hbvo, RedirectAttributes ras) throws Exception{
		      log.info("weightUpdate 호출 성공");
		      
		      int result=0;
		      String url="";
		      
		      result=healthBoardService.healthBoardUpdate(hbvo);
		      ras.addFlashAttribute("data",hbvo);
		      
		      if(result==1) {
		         url="/health/admin/weightDetail?health_no="+hbvo.getHealth_no();
		      }else {
		         url="/health/admin/weightUpdateForm";
		      }
		      return "redirect:"+url;
		   }
	   
	   /****************************************************************************	
		 *	카디오 업데이트 폼 화면으로 이동
		 ***************************************************************************/
		@RequestMapping(value="/admin/cardioUpdateForm")
		  	public String cardioUpdateForm(@ModelAttribute("data") HealthBoardVO hbvo, Model model)  {
		      log.info("cardioUpdateForm");
		      
		      HealthBoardVO cardioUpdateForm = (HealthBoardVO) healthBoardService.healthDetail(hbvo);
			
		      model.addAttribute("cardioUpdate", cardioUpdateForm);

				return "health/admin/cardioUpdateForm";
		}
		
		 /****************************************************************************	
		 *	카디오 업데이트 폼 구현하기
		 ***************************************************************************/
	   @RequestMapping(value="/admin/cardioUpdate",method=RequestMethod.POST)
		   public String cardioUpdate(@ModelAttribute HealthBoardVO hbvo, RedirectAttributes ras) throws Exception{
		      log.info("cardioUpdate 호출 성공");
		      
		      int result=0;
		      String url="";
		      
		      result=healthBoardService.healthBoardUpdate(hbvo);
		      ras.addFlashAttribute("data",hbvo);
		      
		      if(result==1) {
		         url="/health/admin/cardioDetail?health_no="+hbvo.getHealth_no();
		      }else {
		         url="/health/admin/cardioUpdateForm";
		      }
		      return "redirect:"+url;
		   }
	   
	   /****************************************************************************	
		 *	웨이트 글 삭제 구현하기
		 ***************************************************************************/
	   @RequestMapping(value="/admin/healthBoardDelete1")
	   public String weightBoardDelete(@ModelAttribute HealthBoardVO hbvo, RedirectAttributes ras) throws Exception{
	      log.info("weightBoardDelete 호출 성공");
	     
	      int result=0;
	      String url="";
	      
	      result=healthBoardService.healthBoardDelete(hbvo);
	      ras.addFlashAttribute("healthBoardVO",hbvo);
	      
	      if(result==1) {
	         url="/health/admin/weightList?health_category_no="+hbvo.getHealth_category_no();
	      }else {
	         url="/health/admin/weightDetail";
	      }
	      return "redirect:"+url;
	   }
	   
	   /****************************************************************************	
		 *	카디오 글 삭제 구현하기
		 ***************************************************************************/
	   @RequestMapping(value="/admin/healthBoardDelete2")
	   public String cardioBoardDelete(@ModelAttribute HealthBoardVO hbvo, RedirectAttributes ras) throws Exception{
	      log.info("cardioBoardDelete 호출 성공");
	     
	      int result=0;
	      String url="";
	      
	      result=healthBoardService.healthBoardDelete(hbvo);
	      ras.addFlashAttribute("healthBoardVO",hbvo);
	      
	      if(result==1) {
	         url="/health/admin/cardioList?health_category_no="+hbvo.getHealth_category_no();
	      }else {
	         url="/health/admin/cardioDetail";
	      }
	      return "redirect:"+url;
	   }
		   
}
