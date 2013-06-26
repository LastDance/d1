package com.dms.test.dao;

import java.util.List;

import com.dms.test.model.SysUser;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SysUserDAOImpl implements SysUserDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<SysUser> validateLogin(SysUser sysUser){
		return sessionFactory.getCurrentSession().createQuery(
				"from SysUser where username=:username and password=:password")
				.setString("username", sysUser.getUsername()).setString("password",sysUser.getPassword()).list();
	}
	
	public void addSysUser(SysUser sysUser) {
		sessionFactory.getCurrentSession().save(sysUser);
	}

	public List<SysUser> listSysUser() {
		return sessionFactory.getCurrentSession().createQuery("from SysUser").list();
	}

	public void removeSysUser(Integer id) {
		SysUser sysUser = (SysUser) sessionFactory.getCurrentSession().load(
				SysUser.class, id);
		if (sysUser != null) {
			sessionFactory.getCurrentSession().delete(sysUser);
		}
	}
}
