package com.dms.om.service;

import java.util.List;

import com.dms.om.model.Order;
import com.dms.om.model.OrderLine;

public interface IOrderService {

	public void createOrder(Order order);

	public void removeOrder();

	public Order getOrder(int id);
	
	public Order removeDeletedOrderLines(Order order);
	
	public Order initializeOrder(String enteredBy);

	public Order SetOrderStatus(String step, Order order);
	
	public OrderLine getOrderLine(Order order, int lineNbr);
	
	public List<Order> getOrders();
}
