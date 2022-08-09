package com.dosirak31.login.client.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
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
	
	@GetMapping("/loginmain")
	public String loginForm() {
		
		log.info("client �α��� ȭ�� ȣ��");
		
		return "login/client/loginmain";
		//     /WEB-INF/views/login/client/loginmain.jsp�� ������(������ ������������ ����)
		
		//redirect:�� ������ ��û�ϴ°��� -> ��Ʈ�ѷ��� �ٽ� �޼��� �ۼ��ؾߵ�
		
	} 
	
	@RequestMapping("/searchid")
	public String serarchId() {
		return "login/client/searchid"; //     /WEB-INF/views/login/client/searchid.jsp�� �̵� , ���̵� ã�� ȭ��
	}
	
	@RequestMapping("/searchpw")
	public String searchPw() { 
		return "login/client/searchpw"; //     /WEB-INF/views/login/client/searchpw.jsp�� �̵� , ��й�ȣ ã�� ȭ��
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
		//�α��� ��ư�� Ŭ���Ͽ� �α������� �� ����
		//���⼭ �α��� ������ ó��
		
		String url="";
		
		ClientLoginVO clientLogin = clientLoginService.loginProcess(login);
		
		if(clientLogin != null) { 
			
			model.addAttribute("client_info",clientLogin);
			
			HttpSession session = request.getSession();

			session.setAttribute("client_info", clientLogin);
			
			session.setAttribute("client_no", clientLogin.getClient_no());
			
			url="successlogin"; //������ �α��� ������������ �̵� 
					
		}else {
			
			ras.addFlashAttribute("errorMsg","�α��� ����");
			
			//return "/client/loginmain";
			
			url="faillogin";
		}
		
			return "redirect:"+url;
	}
	
	
	
	@RequestMapping("/idconfirm")
	public String idConfirm(ClientLoginVO login, Model model) {
		//���̵� ã�� â���� ���̵�, ��ȭ��ȣ�� �� ����
		//���⼭ ���̵�ã�� ������ ó��
		
		ClientLoginVO clientsearchid = clientLoginService.idConfirm(login); //���̵�, ��ȭ��ȣ�� ��ġ�ϴ� ���� ��ü�� ���޹���
		
		if(clientsearchid != null) {
			
			model.addAttribute("clientsearchid",clientsearchid);
			
			return "login/client/successidconfirm"; //     /WEB-INF/views/login/client/succecssidconfirm.jsp�� �̵�
			
		}else {
			
			return "login/client/failidconfirm"; //  /WEB-INF/views/login/client/failidconfirm.jsp�� �̵�
			
		}
		
	}
	
	@RequestMapping(value = "/kakaologin", method = RequestMethod.POST)
	public String kakaoLogin(Model model, HttpServletRequest request){
		String kakaoemail=request.getParameter("kakaoemail"); //īī�� �̸��� ���� �޾ƿͼ� ����
		String kakaoname=request.getParameter("kakaoname"); //īī�� �г��� ���� �޾ƿͼ� ����
		
		
		ClientLoginVO cvo = new ClientLoginVO(); //īī�� �⺻ ������ VO��ü�� �����
		cvo.setClient_email(kakaoemail); //īī�� �̸����� client_eamil ������ ����
		cvo.setClient_name(kakaoname);//īī�� �г����� client_name ������ ����
		
	
		if (clientLoginService.getUserByEmail(cvo) == null) { //īī�� �̸��Ϸ� �α��� �� ���� �ִ��� Ȯ��
													//īī�� �α��� �� ���� ���ٸ�, 
			model.addAttribute("kakaoclient", cvo); //īī�� �⺻����(�̸�, �̸���)�� ��� ��ü�� īī�� ȸ������ �������� �Ѱ��ش�.
			
			return "/signup/client/kakao_join_form"; //īī�� ȸ������ �������� ����
			
		}else {
			
			String url = "";
			
			//īī�� �������� �α����� ���� ���� �� �� ȸ���� ������ �ҷ���
			ClientLoginVO clientLogin = clientLoginService.getUserByEmail(cvo);
			
			HttpSession session = request.getSession();
			
			//ȸ�� ������ ���ǿ� �����Ѵ�.
			session.setAttribute("client_info", clientLogin);
			
			url = "successlogin";
			
			return "redirect:"+url;
			
		}
		
	}
	
	//�α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		String url = "";
		
		log.info("�α׾ƿ� ó��");
		
        session.invalidate();
        
        url = "completelogout";
        
		
		return "redirect:"+url;
	}
	
	
	@RequestMapping("completelogout")
	public String logout() {
		
		return "main"; //     /WEB-INF/views/login/client/completelogout.jsp�� �̵� , ���̵� ã�� ȭ��
	}
	
	
	
	
	

}
