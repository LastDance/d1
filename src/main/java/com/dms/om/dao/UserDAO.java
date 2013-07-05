package com.dms.om.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.dms.om.model.User;

@Repository
public class UserDAO extends AbstractHibernateDAO<User> implements IUserDAO {

	@SuppressWarnings("unchecked")
	@Override
	public List<User> validateLogin(User user) {
		return getCurrentSession()
				.createQuery(
						"from User where username=:username and password=:password")
				.setString("username", user.getUsername())
				.setString("password", user.getPassword()).list();

	}

	@Override
	public void createUser(User user) {
		super.save(user);
	}

	@Override
	public void removeUser(Integer id) {
		/*User user = (User) sessionFactory.getCurrentSession().load(
				User.class, id);
		if (user != null) {
			sessionFactory.getCurrentSession().delete(user);
		}*/
		super.deleteById(id);
	}

}
