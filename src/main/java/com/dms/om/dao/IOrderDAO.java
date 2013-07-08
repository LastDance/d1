package com.dms.om.dao;

import java.util.List;

import com.dms.om.model.Order;
import com.dms.om.model.PaginationSupport;

public interface IOrderDAO {

	public void createOrder(Order order);

	public void removeOrder();

	public Order getOrder(int number);

	public List<Order> getOrders() ;
	
	public abstract PaginationSupport<Order> findPageByQuery(String hsql, int pageSize,
			int startIndex);
}
