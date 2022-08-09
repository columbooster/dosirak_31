package com.dosirak31.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	
	private int pageNum=0;	//��������ȣ
	private int amount=0;	//�������� ������ ������ ��
	
	
	//���ǰ˻��� ����� �ʵ�(�˻����, �˻��ܾ�)
	private String search="";
	private String keyword="";
	
	public CommonVO() {
		this(1,10);
	}
	
	public CommonVO(int pageNum,int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
}
