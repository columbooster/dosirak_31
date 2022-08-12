package com.dosirak31.food.order.vo;

import com.dosirak31.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO extends CommonVO {	//�ֹ������̺�

	//ȸ������
	private int client_no; //ȸ���Ϸù�ȣ
	private String client_id; //ȸ�����̵�
	private String client_pw; //ȸ����й�ȣ
	private String client_name; //ȸ���̸�
	private String client_email; //ȸ���̸���
	private String client_phone; //ȸ����ȭ��ȣ
	private String client_address; //ȸ���ּ�
	private String client_date; //ȸ��������
	private String client_update; //ȸ������������
	
	
	//���ö�����
	private int dosirak_no; 	//���ö���ȣ
	private String dosirak_name;	//���ö���
	private String food_img1;	//��ǰ��1
	private String food_img2;	//��ǰ��2
	private String food_img3;	//��ǰ��3
	private String food_img4;	//��ǰ��4
	private String food_img5;	//��ǰ��5
	
	//�ֹ�����
	private int order_no;//�ֹ� ��ȣ(�ֹ����̺��� ���� ȸ���� ���¹�ȣ�� 1,2�� ��� �ֹ���ȣ�� �ִ��� Ȯ���ϰ� ������ �ֹ����̺�����ְ� �ֹ���)
	private String order_date;	//���¹�ȣ 2�϶� �� ��
	private String order_client_name;
	private String order_client_phone;
	private String order_address;//���¹�ȣ 2�϶� �� ��
	//ȸ�� ��ȣ(session���� �޾ƿ�)
	private int order_status_no;//�ֹ����¹�ȣ 1.��ٱ��� 2.�ֹ� �� 3.�ֹ� �� 4.�ֹ� ���
	
	
		//�ֹ���ȣ(�ֹ����̺��� ���� ȸ���� ���¹�ȣ�� 1,2�� ��� �ֹ���ȣ�� �ִ��� Ȯ���ϰ� ������ �ֹ����̺�����ְ� �ֹ���)
	private int order_quantity;	//�ֹ�����
	private int order_price;	//�ֹ�����
	//���ö���ȣ(���ö� ���� �� �ֱ�)
	
	//��������
	private int payment_no;

	private String payment_method;
	private int payment_delete;
	private String payment_date;
	
}
