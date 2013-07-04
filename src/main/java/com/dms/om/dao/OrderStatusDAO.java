package com.dms.om.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dms.om.model.OrderStatus;

@Repository
public class OrderStatusDAO implements IOrderStatusDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderStatus> getOrderStatus() {
		return sessionFactory.getCurrentSession()
				.createQuery("from OrderStatus").list();

	}
}
