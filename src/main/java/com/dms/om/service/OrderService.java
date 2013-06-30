package com.dms.om.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.om.dao.IOrderDAO;
import com.dms.om.model.Order;

@Service
public class OrderService implements IOrderService{

	@Autowired
	private IOrderDAO orderDAO;
	
	@Transactional
	public void createOrder(Order order) {
		orderDAO.createOrder(order);
	}

	@Transactional
	public void removeOrder() {
		
	}

	@Transactional
	public List<Order> getOrder(String number) {
		return null;
	}
	

}
