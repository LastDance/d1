package com.dms.om.dao;

import java.util.List;

import com.dms.om.model.User;

public interface IUserDAO {
	
	public List<User> validateLogin(User user);

	public void createUser(User user);

	public void removeUser(Integer id);
}
