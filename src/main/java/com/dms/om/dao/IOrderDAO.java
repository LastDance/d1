package com.dms.om.dao;

import com.dms.om.model.Order;

public interface IOrderDAO {

	public void createOrder(Order order);
	
	public void removeOrder();
	
	public Order getOrder(int number);
}
