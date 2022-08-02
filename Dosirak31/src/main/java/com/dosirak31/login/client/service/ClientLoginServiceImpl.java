package com.dosirak31.login.client.service;

import org.springframework.stereotype.Service;

import com.dosirak31.login.client.dao.ClientLoginDao;
import com.dosirak31.login.client.vo.ClientLoginVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ClientLoginServiceImpl implements ClientLoginService{

	private ClientLoginDao clientLoginDao;
	
	@Override
	public ClientLoginVO loginProcess(ClientLoginVO login) {
		
		ClientLoginVO clientLogin = clientLoginDao.loginProcess(login);
				
		return clientLogin;
	}
	
	
	@Override
	public ClientLoginVO idConfirm(ClientLoginVO login) {
		
		ClientLoginVO clientSearchid = clientLoginDao.idConfirm(login);
		
		return clientSearchid;
	} 
	

	@Override
	public ClientLoginVO getUserByEmail(ClientLoginVO cvo) {
		
		ClientLoginVO kakaouser = clientLoginDao.getUserByEmail(cvo);
		
		return kakaouser;
	}


}
