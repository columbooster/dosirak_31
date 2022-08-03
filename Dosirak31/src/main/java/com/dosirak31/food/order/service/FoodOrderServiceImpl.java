package com.dosirak31.food.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.dosirak31.food.order.dao.FoodOrderDao;
import com.dosirak31.food.order.vo.OrderDetailVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class FoodOrderServiceImpl implements FoodOrderService {

	private FoodOrderDao foodOrderDao;
	//장바구니에 입력
	@Override
	public int bagInsert(OrderDetailVO odv) {
		int result=foodOrderDao.bagInsert(odv);
		return result;
	}
	//장바구니 조회
	@Override
	public List<OrderDetailVO> bagList(int client_no) {
		List<OrderDetailVO> bagList=foodOrderDao.bagList(client_no);
		return bagList;
	}
	//도시락만 삭제
	@Override
	public int bagDelete1(int dosirak_no) {
		int result=0;
		result=foodOrderDao.bagDelete1(dosirak_no);
		return result;
	}
	//주문상세없으면 주문테이블도 삭제
	@Override
	public int bagDelete2(int order_no) {
		int result=0;
		result=foodOrderDao.bagDelete2(order_no);
		return result;
	}
	
	//주문상세테이블에 주문번호가 몇개인지	
	@Override
	public int bagOrderNo(int order_no) {
		int result=0;
		result=foodOrderDao.bagOrderNo(order_no);
		return result;
	}
	//장바구니 수량 변경
	@Override
	public int bagUpdate(OrderDetailVO odv) {
		int result=0;
		result=foodOrderDao.bagUpdate(odv);
		return result;
	}
	/*결제시 2번으로 주문 insert*/
	@Override
	public int orderInsert(OrderDetailVO odv) {
		int result=foodOrderDao.orderInsert(odv);
		return result;
	}
	/*결제 2번으로 주문 한 것 insert값 select조회*/
	@Override
	public OrderDetailVO orderList(OrderDetailVO odv) {
		OrderDetailVO orderList=foodOrderDao.orderList(odv);
		return orderList;
	}
	@Override
	public int paymentInsert(OrderDetailVO odv) {
		
		return foodOrderDao.paymentInsert(odv);
	}
	@Override
	public int orderUpdate(OrderDetailVO odv) {
		return foodOrderDao.orderUpdate(odv);
	}

}
