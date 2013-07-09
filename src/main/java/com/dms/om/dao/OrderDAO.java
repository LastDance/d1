package com.dms.om.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
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

	@SuppressWarnings("unchecked")
	@Override
	public PaginationSupport<Order> findPageByCriteria(
			DetachedCriteria detachedCriteria, int pageSize, int startIndex) {
		if (detachedCriteria == null) 
			detachedCriteria = DetachedCriteria.forClass(Order.class);			
		return (PaginationSupport<Order>) super.findPageByCriteria(detachedCriteria, pageSize, startIndex);
	}

	@Override
	public PaginationSupport<Order> findPageByQuery(String hsql, int pageSize,
			int startIndex) {
		return super.findPageByQuery(hsql, pageSize, startIndex);
	}
	
}
