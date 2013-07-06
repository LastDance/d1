package com.dms.om.dao;

import org.springframework.stereotype.Repository;

import com.dms.common.dao.AbstractHibernateDAO;
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
	public Order getOrder(int id) {
		return super.findOne(id);
	}
	

}
