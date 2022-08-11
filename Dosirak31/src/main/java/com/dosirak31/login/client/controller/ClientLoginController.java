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
		
<<<<<<< HEAD
		log.info("client 로그인 화면 호출");
=======
		log.info("client 占싸깍옙占쏙옙 화占쏙옙 호占쏙옙");
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
		return "login/client/loginmain";
<<<<<<< HEAD
		//     /WEB-INF/views/login/client/loginmain.jsp로 포워드(관리자 시작페이지로 구분)
=======
		//     /WEB-INF/views/login/client/loginmain.jsp占쏙옙 占쏙옙占쏙옙占쏙옙(占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙)
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
<<<<<<< HEAD
		//redirect:는 맵핑을 요청하는것임 -> 컨트롤러에 다시 메서드 작성해야됨
=======
		//redirect:占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙청占싹는곤옙占쏙옙 -> 占쏙옙트占싼뤄옙占쏙옙 占쌕쏙옙 占쌨쇽옙占쏙옙 占쌜쇽옙占쌔야듸옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
	} 
	
	@RequestMapping("/searchid")
	public String serarchId() {
<<<<<<< HEAD
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp
=======
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp占쏙옙 占싱듸옙 , 占쏙옙占싱듸옙 찾占쏙옙 화占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	}
	
	@RequestMapping("/searchpw")
	public String searchPw() { 
<<<<<<< HEAD
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp
=======
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp占쏙옙 占싱듸옙 , 占쏙옙橘占싫� 찾占쏙옙 화占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
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
<<<<<<< HEAD
		//로그인 버튼을 클릭하여 로그인폼이 온 상태
		//여기서 로그인 과정을 처리
=======
		//占싸깍옙占쏙옙 占쏙옙튼占쏙옙 클占쏙옙占싹울옙 占싸깍옙占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占썩서 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙 처占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
		String url="";
		
		ClientLoginVO clientLogin = clientLoginService.loginProcess(login);
		
		if(clientLogin != null) { 
			
			model.addAttribute("client_info",clientLogin);
			
			HttpSession session = request.getSession();

			session.setAttribute("client_info", clientLogin);
			
			session.setAttribute("client_no", clientLogin.getClient_no());
			
<<<<<<< HEAD
			session.setAttribute("client_id", clientLogin.getClient_id());//추후 헬스게시판 댓글에서 이용할 session값
=======
			session.setAttribute("client_id", clientLogin.getClient_id());//占쏙옙占쏙옙 占쏙스占쌉쏙옙占쏙옙 占쏙옙謗占쏙옙占� 占싱울옙占쏙옙 session占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
			
<<<<<<< HEAD
			url="successlogin"; //성공시 로그인 성공페이지로 이동 
=======
			url="successlogin"; //占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙 
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
			
			return "redirect:"+url;
					
		}else {
			
<<<<<<< HEAD
			ras.addFlashAttribute("errorMsg","로그인 실패");
=======
			ras.addFlashAttribute("errorMsg","占싸깍옙占쏙옙 占쏙옙占쏙옙");
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
			//return "/client/loginmain";
			
			return "/login/client/faillogin";
		}
		
			
	}
	
	
	
	@RequestMapping("/idconfirm")
	public String idConfirm(ClientLoginVO login, Model model) {
<<<<<<< HEAD
		//아이디를 찾기 창에서 아이디, 전화번호가 온 상태
		//여기서 아이디찾기 과정을 처리
=======
		//占쏙옙占싱듸옙 찾占쏙옙 창占쏙옙占쏙옙 占쏙옙占싱듸옙, 占쏙옙화占쏙옙호占쏙옙 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占썩서 占쏙옙占싱듸옙찾占쏙옙 占쏙옙占쏙옙占쏙옙 처占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
<<<<<<< HEAD
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //아이디, 전화번호가 일치하는 고객의 객체를 전달받음
=======
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //占쏙옙占싱듸옙, 占쏙옙화占쏙옙호占쏙옙 占쏙옙치占싹댐옙 占쏙옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쌨뱄옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
		if(clientsearchid != null) {
			
			model.addAttribute("clientsearchid",clientsearchid);
			
<<<<<<< HEAD
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp
=======
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp占쏙옙 占싱듸옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
		}else {
			
<<<<<<< HEAD
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp
=======
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp占쏙옙 占싱듸옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
		}
		
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaoLogin(Model model, HttpServletRequest request){
<<<<<<< HEAD
		String kakaoemail=request.getParameter("kakaoemail"); //카카오 이메일 값을 받아와서 저장
		String kakaoname=request.getParameter("kakaoname");  //카카오 닉네임 값을 받아와서 저장
=======
		String kakaoemail=request.getParameter("kakaoemail"); //카카占쏙옙 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쌨아와쇽옙 占쏙옙占쏙옙
		String kakaoname=request.getParameter("kakaoname"); //카카占쏙옙 占싻놂옙占쏙옙 占쏙옙占쏙옙 占쌨아와쇽옙 占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
		
<<<<<<< HEAD
		ClientLoginVO cvo = new ClientLoginVO();//카카오 기본 정보를 VO객체에 담아줌
		cvo.setClient_email(kakaoemail); //카카오 이메일을 client_eamil 변수에 저장
		cvo.setClient_name(kakaoname);//카카오 닉네임을 client_name 변수에 저장
=======
		ClientLoginVO cvo = new ClientLoginVO(); //카카占쏙옙 占썩본 占쏙옙占쏙옙占쏙옙 VO占쏙옙체占쏙옙 占쏙옙占쏙옙占�
		cvo.setClient_email(kakaoemail); //카카占쏙옙 占싱몌옙占쏙옙占쏙옙 client_eamil 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		cvo.setClient_name(kakaoname);//카카占쏙옙 占싻놂옙占쏙옙占쏙옙 client_name 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
	
<<<<<<< HEAD
		if (clientLoginService.getUserByEmail(cvo) == null) { //카카오 이메일로 로그인 한 적이 있는지 확인
													//카카오 로그인 한 적이 없다면, 
			model.addAttribute("kakaoclient", cvo);//카카오 기본정보(이름, 이메일)이 담긴 객체를 카카오 회원가입 페이지로 넘겨준다.
=======
		if (clientLoginService.getUserByEmail(cvo) == null) { //카카占쏙옙 占싱몌옙占싹뤄옙 占싸깍옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쌍댐옙占쏙옙 확占쏙옙
													//카카占쏙옙 占싸깍옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙占쌕몌옙, 
			model.addAttribute("kakaoclient", cvo); //카카占쏙옙 占썩본占쏙옙占쏙옙(占싱몌옙, 占싱몌옙占쏙옙)占쏙옙 占쏙옙占� 占쏙옙체占쏙옙 카카占쏙옙 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쌔댐옙.
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
<<<<<<< HEAD
			return "/signup/client/kakao_join_form"; //카카오 회원가입 페이지로 맵핑
=======
			return "/signup/client/kakao_join_form"; //카카占쏙옙 회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
		}else {
			
			String url = "";
			
<<<<<<< HEAD
			//카카오 계정으로 로그인한 적이 있을 때 그 회원의 정보를 불러옴
=======
			//카카占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌀뤄옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			ClientLoginVO clientLogin = clientLoginService.getUserByEmail(cvo);
			
			HttpSession session = request.getSession();
			
<<<<<<< HEAD
			//회원 정보를 세션에 저장한다.
=======
			//회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙占싼댐옙.
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			session.setAttribute("client_info", clientLogin);
			
			url = "successlogin";
			
			return "redirect:"+url;
			
		}
		
	}
	
<<<<<<< HEAD
	//로그아웃
=======
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	@RequestMapping("/logout")
<<<<<<< HEAD
	public String logout(SessionStatus sessionStatus) {
		
		String url = "";
		
		log.info("로그아웃 처리");
		
		sessionStatus.setComplete();
		
        
        url = "completelogout";
        
		
		return "redirect:"+url;
	}
	
=======
	   public String logout(SessionStatus sessionStatus) {
	      
	      String url = "";
	      
	     
	      sessionStatus.setComplete();
	      
	        
	        url = "completelogout";
	        
	      
	      return "redirect:"+url;
	   }
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	
	@RequestMapping("completelogout")
	public String logout() {
		
<<<<<<< HEAD
		return "main"; //     /WEB-INF/views/login/client/completelogout.jsp로 이동 , 아이디 찾기 화면
=======
		return "main"; //    
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	}
	
	
	@RequestMapping("/pwconfirm")
	public ModelAndView sendEmail(ClientLoginVO pwvo, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		
<<<<<<< HEAD
		ClientLoginVO pwconfirm = clientLoginService.selectMember(pwvo); // 폼에서 입력받은 값(아이디,이름,이메일)을 보내서 객체 존재하는지 확인하고 해당 객체를 전달받음
=======
		ClientLoginVO pwconfirm = clientLoginService.selectMember(pwvo); // 占쏙옙占쏙옙占쏙옙 占쌉력뱄옙占쏙옙 占쏙옙(占쏙옙占싱듸옙,占싱몌옙,占싱몌옙占쏙옙)占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙체 占쏙옙占쏙옙占싹댐옙占쏙옙 확占쏙옙占싹곤옙 占쌔댐옙 占쏙옙체占쏙옙 占쏙옙占쌨뱄옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
<<<<<<< HEAD
		if(pwconfirm != null) { //아이디,이름,이메일이 일치하는 객체가 존재한다면
=======
		if(pwconfirm != null) { //占쏙옙占싱듸옙,占싱몌옙,占싱몌옙占쏙옙占쏙옙 占쏙옙치占싹댐옙 占쏙옙체占쏙옙 占쏙옙占쏙옙占싼다몌옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
<<<<<<< HEAD
			Random r = new Random(); //난수 값 생성하여 이메일로 보낸것임
=======
			Random r = new Random(); //占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占싹울옙 占싱몌옙占싹뤄옙 占쏙옙占쏙옙占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			int num = r.nextInt(999999); 
			
<<<<<<< HEAD
				session.setAttribute("client_email", pwconfirm.getClient_email()); //객체의 이메일을 세션에 저장해줌
=======
				session.setAttribute("client_email", pwconfirm.getClient_email()); //占쏙옙체占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占실울옙 占쏙옙占쏙옙占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
				
				String email = pwconfirm.getClient_email(); 
				
				/*******************************************************
<<<<<<< HEAD
				 * 이메일 보낼 내용 작성
=======
				 * 占싱몌옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쌜쇽옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
				 *******************************************************/
<<<<<<< HEAD
				String subject = "[DOSIRAK31] 비밀번호 인증 이메일 입니다";
=======
				String subject = "[DOSIRAK31] 占쏙옙橘占싫� 占쏙옙占쏙옙 占싱몌옙占쏙옙 占쌉니댐옙";
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
				
<<<<<<< HEAD
		        String content = "안녕하세요 회원님!!!<br/>"+"dosirak31 비밀번호 인증번호는 " + num +" 입니다.";
=======
		        String content = "占싫놂옙占싹쇽옙占쏙옙 회占쏙옙占쏙옙!!!<br/>"+ "dosirak31 占쏙옙橘占싫� 占쏙옙占쏙옙占쏙옙호占쏙옙 " + num + " 占쌉니댐옙.";
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		        
		        String from = "dosirak31company@naver.com";
		        
		        String to = email;
		        
		        
		        try {
		            	MimeMessage mail = mailSender.createMimeMessage();
		            	MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
		            	
		            	mailHelper.setFrom(from);
		         
		            	mailHelper.setTo(to);
		            	mailHelper.setSubject(subject);
		            	mailHelper.setText(content, true);
		            
<<<<<<< HEAD
		            	mailSender.send(mail); // 이메일을 보냄
=======
		            	mailSender.send(mail); // 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		            
		        	}catch(Exception e) {
		        		
<<<<<<< HEAD
		        		e.printStackTrace(); //이메일 보내기 오류나면 띄움
=======
		        		e.printStackTrace(); //占싱몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占�
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		        	}
		        
		        
	        	ModelAndView mv = new ModelAndView(); 
	        	
<<<<<<< HEAD
	        	mv.setViewName("login/client/pw_auth"); //이메일 보냈음-> 회원은 이메일을 열어봄 -> 인증번호 확인했을것임 -> 인증번호 확인 페이지로 가자
=======
	        	mv.setViewName("login/client/pw_auth"); //占싱몌옙占싹븝옙占쏙옙占쏙옙-> 회占쏙옙占쏙옙 占싱몌옙占쏙옙占쏙옙 占쏙옙占쏘봄 -> 占쏙옙占쏙옙占쏙옙호 확占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 -> 占쏙옙占쏙옙占쏙옙호 확占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	        	
<<<<<<< HEAD
	        	mv.addObject("num", num); // 인증번호 인증을 위해 난수도 같이 확인 페이지로 넘겨줌
=======
	        	mv.addObject("num", num); // 占쏙옙占쏙옙占쏙옙호 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 확占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싼곤옙占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	        	
	        	return mv;
	        		
	        	
<<<<<<< HEAD
		}else { //이름, 아이디, 이메일이 일치하는 회원이 없다. -> 일치하는 회원이 없습니다
=======
		}else { //占싱몌옙, 占쏙옙占싱듸옙, 占싱몌옙占쏙옙占쏙옙 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙. -> 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙 占쏙옙 占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("login/client/failpwsearch");
			
			return mv;
		
		}
	}
	
	/**********************************************************************************************
<<<<<<< HEAD
  	 메일로 보낸 랜덤 인증번호와 사용자가 입력한 인증번호가 일치하는지 확인
    **********************************************************************************************/
=======
	  	占쏙옙占싹뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙치占싹댐옙占쏙옙 확占쏙옙
	 **********************************************************************************************/
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
	@RequestMapping("/pwauth")
	public String pwAuth(@RequestParam(value="email_injeung") String email_injeung, @RequestParam(value = "num") String num,HttpSession session, Model model){
		
<<<<<<< HEAD
		//인증번호-num, 사용자가 입력한 인증번호 - email_injeung 이 도착
		//메일로 보낸 인증번호와 사용자가 입력한 인증번호가 동일한지 확인
=======
		//占쏙옙占쏙옙占쏙옙호-num, 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호 - email_injeung 占쏙옙 占쏙옙占쏙옙
		//占쏙옙占싹뤄옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙微占� 占쌉뤄옙占쏙옙 占쏙옙占쏙옙占쏙옙호占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 확占쏙옙
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
		
		String client_email = (String)session.getAttribute("client_email");
		
		model.addAttribute("client_email",client_email);
		
		if(email_injeung.equals(num)) {
			
			return "login/client/pw_new";
			
		}else {
			
			return "login/client/pw_auth_fail";
		}
		
		
		
	}
	

	/**********************************************************************************************
<<<<<<< HEAD
  	  비밀번호 재설정
    **********************************************************************************************/
=======
	  	占쏙옙橘占싫� 占썹설占쏙옙
	 **********************************************************************************************/
>>>>>>> branch 'dev' of https://github.com/columbooster/dosirak_31.git
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
