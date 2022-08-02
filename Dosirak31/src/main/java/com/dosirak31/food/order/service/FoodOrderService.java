package com.dosirak31.food.order.service;

import java.util.List;

import com.dosirak31.food.order.vo.OrderDetailVO;

public interface FoodOrderService {
	public int bagInsert(OrderDetailVO odv);//��ٱ��Ͽ� insert
	public List<OrderDetailVO> bagList(int client_no);//��ٱ��Ϸ� �̵��ϱ�.select�ؿ���
	public int bagUpdate(OrderDetailVO odv);//���� ���� �� �ֹ����� ����
	public int bagDelete1(int dosirak_no);//���ö��� ����
	public int bagOrderNo(int order_no);//�ֹ��󼼹�ȣ ����� ��ȸ
	public int bagDelete2(int order_no);////�ֹ��󼼾����� �ֹ����̺� ����
	public int orderInsert(OrderDetailVO odv);//�ֹ��� insert
	public OrderDetailVO orderList(OrderDetailVO odv);//�ֹ���ȣ select
}
