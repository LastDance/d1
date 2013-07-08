package com.dms.common.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;

import com.dms.om.model.PaginationSupport;

public abstract class AbstractHibernateDAO<T extends Serializable> {
	private Class<T> clazz;
	@Autowired
	SessionFactory sessionFactory;

	public void setClazz(final Class<T> clazzToSet) {
		clazz = clazzToSet;
	}

	@SuppressWarnings("unchecked")
	public T findOne(final int id) {
		return (T) getCurrentSession().get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return getCurrentSession().createQuery("from " + clazz.getName())
				.list();
	}

	public void save(final T entity) {
		getCurrentSession().persist(entity);
	}

	@SuppressWarnings("unchecked")
	public T update(final T entity) {
		return (T) getCurrentSession().merge(entity);
	}

	public void delete(final T entity) {
		getCurrentSession().delete(entity);
	}

	public void deleteById(final int id) {
		final T entity = findOne(id);
		delete(entity);
	}

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public PaginationSupport<?> findPageByCriteria(
			final DetachedCriteria detachedCriteria, final int pageSize,
			final int startIndex) {

		Criteria criteria = detachedCriteria
				.getExecutableCriteria(getCurrentSession());
		Long lTotalCount = (Long)(criteria.setProjection(
				Projections.rowCount()).uniqueResult());
		int totalCount = lTotalCount.intValue();
		criteria.setProjection(null);
		List<?> items = criteria.setFirstResult(startIndex)
				.setMaxResults(pageSize).list();
		PaginationSupport<?> ps = new PaginationSupport(items, totalCount,
				pageSize, startIndex);
		return ps;

	}
	
	public  PaginationSupport<T> findPageByQuery( final  String hsql,  final int pageSize,final int startIndex){ 
	     
	             Query query  =  getCurrentSession().createQuery(hsql);
	             int totalCount=query.list().size();
	             query.setFirstResult(startIndex); 
	             query.setMaxResults(pageSize); 
	             List<T> items  = query.list();
	          PaginationSupport<T> ps = new PaginationSupport<T>(items,
	       totalCount, pageSize, startIndex);
	          return ps;
	  }


}