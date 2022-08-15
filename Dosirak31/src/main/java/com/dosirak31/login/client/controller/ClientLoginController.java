package com.dosirak31.login.client.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dosirak31.login.client.service.ClientLoginService;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@SessionAttributes("client_info")
@Controller
@AllArgsConstructor
@RequestMapping("/client/*")
@Log4j
public class ClientLoginController {
	
	
	private ClientLoginService clientLoginService;


	@Autowired
	private JavaMailSender mailSender;
	
	
	@GetMapping("/loginmain")
	public String loginForm() {
		
		log.info("client 占싸깍옙占쏙옙 화占쏙옙 호占쏙옙");
		
		return "login/client/loginmain";
		//     /WEB-INF/views/login/client/loginmain.jsp占쏙옙 占쏙옙占쏙옙占쏙옙(占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙)
		
		//redirect:占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙청占싹는곤옙占쏙옙 -> 占쏙옙트占싼뤄옙占쏙옙 占쌕쏙옙 占쌨쇽옙占쏙옙 占쌜쇽옙占쌔야듸옙
		
	} 
	
	@RequestMapping("/searchid")
	public String serarchId() {
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp占쏙옙 占싱듸옙 , 占쏙옙占싱듸옙 찾占쏙옙 화占쏙옙
	}
	
	@RequestMapping("/searchpw")
	public String searchPw() { 
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp占쏙옙 占싱듸옙 , 占쏙옙橘占싫� 찾占쏙옙 화占쏙옙
	}
	
	
	@RequestMapping("successlogin")
	public String successLogin() {
		
		return "login";
	}
	
	@RequestMapping("faillogin")
	public String failIdLogin() {
		
		return "login/client/faillogin";
	}
	
	
	

	@PostMapping("/userlogin")
	public String loginProcess(ClientLoginVO login, Model model, HttpServletRequest request,RedirectAttributes ras) {
		//占싸깍옙占쏙옙 占쏙옙튼占쏙옙 클占쏙옙占싹울옙 占싸깍옙占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占썩서 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 처占쏙옙
		
		String url="";
		
		ClientLoginVO clientLogin = clientLoginService.loginProcess(login);
		
		if(clientLogin != null) { 
			
			model.addAttribute("client_info",clientLogin);
			
			HttpSession session = request.getSession();

			session.setAttribute("client_info", clientLogin);
			
			session.setAttribute("client_no", clientLogin.getClient_no());
			
			session.setAttribute("client_id", clientLogin.getClient_id());//占쏙옙占쏙옙 占쏙스占쌉쏙옙占쏙옙 占쏙옙謗占쏙옙占� 占싱울옙占쏙옙 session占쏙옙
		
			
			url="successlogin"; //占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙 
			
			
			return "redirect:"+url;
					
		}else {
			
			ras.addFlashAttribute("errorMsg","占싸깍옙占쏙옙 占쏙옙占쏙옙");
			
			//return "/client/loginmain";
			
			return "login/client/faillogin";
		}
		
			
	}
	
	
	
	@RequestMapping("/idconfirm")
	public String idConfirm(ClientLoginVO login, Model model) {
		//占쏙옙占싱듸옙 찾占쏙옙 창占쏙옙占쏙옙 占쏙옙占싱듸옙, 占쏙옙화占쏙옙호占쏙옙 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占썩서 占쏙옙占싱듸옙찾占쏙옙 占쏙옙占쏙옙占쏙옙 처占쏙옙
		
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //占쏙옙占싱듸옙, 占쏙옙화占쏙옙호占쏙옙 占쏙옙치占싹댐옙 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌨뱄옙占쏙옙
		
		if(clientsearchid != null) {
			
			model.addAttribute("clientsearchid",clientsearchid);
			
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp占쏙옙 占싱듸옙
			
		}else {
			
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp占쏙옙 占싱듸옙
			
		}
		
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaoLogin(Model model, HttpServletRequest request){
		String kakaoemail=request.getParameter("kakaoemail"); //카카占쏙옙 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쌨아와쇽옙 占쏙옙占쏙옙
		String kakaoname=request.getParameter("kakaoname"); //카카占쏙옙 占싻놂옙占쏙옙 占쏙옙占쏙옙 占쌨아와쇽옙 占쏙옙占쏙옙
		
		
		ClientLoginVO cvo = new ClientLoginVO(); //카카占쏙옙 占썩본 占쏙옙占쏙옙占쏙옙 VO占쏙옙체占쏙옙 占쏙옙占쏙옙占�
		cvo.setClient_email(kakaoemail); //카카占쏙옙 占싱몌옙占쏙옙占쏙옙 client_eamil 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		cvo.setClient_name(kakaoname);//카카占쏙옙 占싻놂옙占쏙옙占쏙옙 client_name 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		
	
		if (clientLoginService.getUserByEmail(cvo) == null) { //카카占쏙옙 占싱몌옙占싹뤄옙 占싸깍옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쌍댐옙占쏙옙 확占쏙옙
													//카카占쏙옙 占싸깍옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쌕몌옙, 
			model.addAttribute("kakaoclient", cvo); //카카占쏙옙 占썩본占쏙옙占쏙옙(占싱몌옙, 占싱몌옙占쏙옙)占쏙옙 占쏙옙占� 占쏙옙체占쏙옙 카카占쏙옙 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쌔댐옙.
			
			return "signup/client/kakao_join_form"; //카카占쏙옙 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
			
		}else {
			
			String url = "";
			
			//카카占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌀뤄옙占쏙옙
			ClientLoginVO clientLogin = clientLoginService.getUserByEmail(cvo);
			
			HttpSession session = request.getSession();
			
			//회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙占싼댐옙.
			session.setAttribute("client_info", clientLogin);
			
			url = "successlogin";
			
			return "redirect:"+url;
			
		}
		
	}
	
	@RequestMapping("/logout")
	   public String logout(SessionStatus sessionStatus) {
	      
	      String url = "";
	      
	     
	      sessionStatus.setComplete();
	      
	        
	        url = "completelogout";
	        
	      
	      return "redirect:"+url;
	   }
	
	@RequestMapping("completelogout")
	public String logout() {
		
		return "main"; //    
	}
	
	
	@RequestMapping("/pwconfirm")
	public ModelAndView sendEmail(ClientLoginVO pwvo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		
		ClientLoginVO pwconfirm = clientLoginService.selectMember(pwvo); // 占쏙옙占쏙옙占쏙옙 占쌉력뱄옙占쏙옙 占쏙옙(占쏙옙占싱듸옙,占싱몌옙,占싱몌옙占쏙옙)占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙占쏙옙占싹댐옙占쏙옙 확占쏙옙占싹곤옙 占쌔댐옙 占쏙옙체占쏙옙 占쏙옙占쌨뱄옙占쏙옙
		
		if(pwconfirm != null) { //占쏙옙占싱듸옙,占싱몌옙,占싱몌옙占쏙옙占쏙옙 占쏙옙치占싹댐옙 占쏙옙체占쏙옙 占쏙옙占쏙옙占싼다몌옙
			
			Random r = new Random(); //占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占싹울옙 占싱몌옙占싹뤄옙 占쏙옙占쏙옙占쏙옙占쏙옙
			int num = r.nextInt(999999); 
			
				session.setAttribute("client_email", pwconfirm.getClient_email()); //占쏙옙체占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙占쏙옙占쏙옙
				
				String email = pwconfirm.getClient_email(); 
				
				/*******************************************************
				 * 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌜쇽옙
				 *******************************************************/
				String subject = "[DOSIRAK31] 占쏙옙橘占싫� 占쏙옙占쏙옙 占싱몌옙占쏙옙 占쌉니댐옙";
				
		        String content = "占싫놂옙占싹쇽옙占쏙옙 회占쏙옙占쏙옙!!!<br/>"+ "dosirak31 占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙호占쏙옙 " + num + " 占쌉니댐옙.";
		        
		        String from = "dosirak31company@naver.com";
		        
		        String to = email;
		        
		        
		        try {
		            	MimeMessage mail = mailSender.createMimeMessage();
		            	MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
		            	
		            	mailHelper.setFrom(from);
		         
		            	mailHelper.setTo(to);
		            	mailHelper.setSubject(subject);
		            	mailHelper.setText(content, true);
		            
		            	mailSender.send(mail); // 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏙옙
		            
		        	}catch(Exception e) {
		        		
		        		e.printStackTrace(); //占싱몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
		        	}
		        
		        
	        	ModelAndView mv = new ModelAndView(); 
	        	
	        	mv.setViewName("login/client/pw_auth"); //占싱몌옙占싹븝옙占쏙옙占쏙옙-> 회占쏙옙占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏘봄 -> 占쏙옙占쏙옙占쏙옙호 확占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 -> 占쏙옙占쏙옙占쏙옙호 확占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
	        	
	        	mv.addObject("num", num); // 占쏙옙占쏙옙占쏙옙호 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 확占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쏙옙
	        	
	        	return mv;
	        		
	        	
		}else { //占싱몌옙, 占쏙옙占싱듸옙, 占싱몌옙占쏙옙占쏙옙 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙. -> 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙 占쏙옙
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login/client/failpwsearch");
			
			return mv;
		
		}
	}
	
	/**********************************************************************************************
	  	占쏙옙占싹뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙치占싹댐옙占쏙옙 확占쏙옙
	 **********************************************************************************************/
	@RequestMapping("/pwauth")
	public String pwAuth(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num,HttpSession session, Model model){
		
		//占쏙옙占쏙옙占쏙옙호-num, 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호 - email_injeung 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占싹뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 확占쏙옙
		
		String client_email = (String)session.getAttribute("client_email");
		
		model.addAttribute("client_email",client_email);
		
		if(email_injeung.equals(num)) {
			
			return "login/client/pw_new";
			
		}else {
			
			return "login/client/pw_auth_fail";
		}
		
		
		
	}
	

	/**********************************************************************************************
	  	占쏙옙橘占싫� 占썹설占쏙옙
	 **********************************************************************************************/
	@RequestMapping("/pw_new")
	public String pwNew(String first_pw, String second_pw, String client_email, HttpSession session){
		
		ClientLoginVO cvo = new ClientLoginVO();
		
		cvo.setClient_pw(first_pw);
		cvo.setClient_email(client_email);
		
		int result = clientLoginService.pwupdate(cvo);
		
		if(result == 1) { 
			
			return "login/client/completechangepw";
			
		}else {
			
			return "login/client/faillogin";
		}
		
	}
	
	
	
	
	

}
