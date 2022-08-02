package com.dosirak31.login.client.service;

import com.dosirak31.login.client.vo.ClientLoginVO;

public interface ClientLoginService {

	public ClientLoginVO loginProcess(ClientLoginVO login);

	public ClientLoginVO idConfirm(ClientLoginVO login);

	public ClientLoginVO getUserByEmail(ClientLoginVO cvo);

}
