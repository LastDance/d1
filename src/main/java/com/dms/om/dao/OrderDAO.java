package com.dms.om.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.dms.common.dao.AbstractHibernateDAO;
import com.dms.om.model.Order;
import com.dms.om.model.PaginationSupport;

@Repository
public class OrderDAO extends AbstractHibernateDAO<Order> implements IOrderDAO {

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

	@Override
	public List<Order> getOrders() {
		return super.findAll();
	}

}
