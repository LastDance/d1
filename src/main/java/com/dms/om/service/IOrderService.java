package com.dms.om.service;

import com.dms.om.model.Order;

public interface IOrderService {

	public void createOrder(Order order);

	public void removeOrder();

	public Order getOrder(int id);
	
	public void removeDeletedOrderLines(Order order);
	
	public Order initializeOrder(String enteredBy);

	public Order SetOrderStatus(String step, Order order);
	
}
