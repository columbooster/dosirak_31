package com.dosirak31.client.signup.service;

import com.dosirak31.client.signup.vo.ClientVO;

public interface ClientService {
	
	public int clientSignup(ClientVO cvo) throws Exception; // 회원가입
	
	
}
