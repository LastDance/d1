package com.dms.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.common.dao.IUserDAO;
import com.dms.common.model.User;
import com.dms.om.model.PaginationSupport;

@Service
public class UserService implements IUserService{

	@Autowired
	private IUserDAO userDAO;
	
	@Transactional
	public List<User> validateLogin(User user) {
		return userDAO.validateLogin(user);
	}

	@Transactional
	public void createUser(User user) {
		userDAO.createUser(user);
	}

	@Transactional
	public void removeUser(Integer id) {
		userDAO.removeUser(id);
	}
	
	@Transactional
	public List<User> findAllUsers() {
		return userDAO.listUsers();
	}
	
	@Transactional
	public User getUser(int userID) {
		return userDAO.getUser(userID);
	}

	@Transactional
	public void updateUser(User user) {
		userDAO.updateUser(user);
	}

	@Transactional
	public PaginationSupport<User> findPageByQuery(int pageSize,
			int startIndex) {
		return userDAO.findPageByQuery("from User", pageSize, startIndex);
	}

}
