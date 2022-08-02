package com.dosirak31.food.review.vo;

import lombok.Data;

@Data
public class FoodReviewVO {
	
	private int review_no				=0;		//���� �Ϸù�ȣ
	private String review_contents		="";	//���� ����
	private int	review_score			=0;		//���� ����
	private String review_date			="";	//���� �ۼ��Ͻ�
	private int client_no				=0;		//ȸ���Ϸù�ȣ
	private int order_no				=0;		//�ֹ��Ϸù�ȣ
	private String review_name			="";	//���� �ۼ���
	private int page_no					=0;		//������ ��ȣ
	
}
