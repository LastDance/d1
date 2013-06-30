package com.dms.om.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dms.om.model.Order;

@Repository
public class OrderDAO implements IOrderDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void createOrder(Order order) {
		sessionFactory.getCurrentSession().save(order);
	}

	@Override
	public void removeOrder() {
		
	}

	@Override
	public List<Order> getOrder(String number) {
		return null;
	}
	

}
