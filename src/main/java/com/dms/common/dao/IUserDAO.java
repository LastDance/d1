package com.dms.common.dao;

import java.util.List;

import com.dms.common.model.User;


public interface IUserDAO {
	
	public List<User> validateLogin(User user);

	public void createUser(User user);

	public void removeUser(Integer id);
	
	public abstract List<User> listUsers();
	
}
