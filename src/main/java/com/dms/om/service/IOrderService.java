package com.dms.om.service;

import java.util.List;

import com.dms.om.model.Order;
import com.dms.om.model.OrderStatus;

public interface IOrderService {

	public void createOrder(Order order);

	public void removeOrder();

	public Order getOrder(int id);
	
	public void removeDeletedOrderLines(Order order);
	
	public List<OrderStatus> getOrderStatusList();

	public Order initializeOrder(String enteredBy);

	public Order SetOrderStatus(String step, Order order);
	
}
