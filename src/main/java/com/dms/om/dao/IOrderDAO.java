package com.dms.om.dao;

import java.util.List;

import com.dms.om.model.Order;

public interface IOrderDAO {

	public void createOrder(Order order);
	
	public void removeOrder();
	
	public List<Order> getOrder(String number);
}
