package com.dms.om.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.om.dao.IUserDAO;
import com.dms.om.model.User;

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

}
