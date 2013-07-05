package com.dms.om.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dms.om.model.Order;

@Repository
public class OrderDAO extends AbstractHibernateDAO<Order> implements IOrderDAO{
	
	public OrderDAO() {
		setClazz(Order.class);
	}

	@Override
	public void createOrder(Order order) {
		super.save(order);
	}

	@Override
	public void removeOrder() {
		
	}

	@Override
	public List<Order> getOrder(String number) {
		return null;
	}
	

}
