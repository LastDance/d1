package com.dms.om.service;

import java.util.List;

import com.dms.om.model.Order;
import com.dms.om.model.OrderStatus;

public interface IOrderService {

	public void createOrder(Order order);

	public void removeOrder();

	public List<Order> getOrder(String number);

	public void genOrderNumbers(Order order);
	
	public List<OrderStatus> getOrderStatusList();
}
