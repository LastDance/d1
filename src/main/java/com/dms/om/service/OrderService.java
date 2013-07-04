package com.dms.om.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.om.dao.IOrderDAO;
import com.dms.om.dao.IOrderStatusDAO;
import com.dms.om.model.Order;
import com.dms.om.model.OrderStatus;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private IOrderDAO orderDAO;
	
	@Autowired
	private IOrderStatusDAO orderStatusDAO;
	
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
	
	@Transactional
	public List<OrderStatus> getOrderStatusList() {
		return orderStatusDAO.getOrderStatus();
	}

	@Override
	public void genOrderNumbers(Order order) {
		
		//Set Order Prefix
		order.setPrefix("test");
		
		//Remove the ##deleted_lines
		int lineNumber = 1;
		for (int i = 0; i< order.getOrderLines().size(); i ++){
			if(order.getOrderLines().get(i).getItem().equals("####order_line_deleted###"))
				order.getOrderLines().remove(i);
			else{
				order.getOrderLines().get(i).setOrder(order);
				order.getOrderLines().get(i).setLine(lineNumber);
			}
		}
	}
}
