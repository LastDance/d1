package com.dms.common.dao;

import java.util.List;

import com.dms.common.model.User;
import com.dms.om.model.PaginationSupport;


public interface IUserDAO {
	
	public List<User> validateLogin(User user);

	public void createUser(User user);

	public void removeUser(Integer id);
	
	public abstract List<User> listUsers();
	
	public User getUser(int userID);
	
	public void updateUser(User user);
	
	public PaginationSupport<User> findPageByQuery(String hsql, int pageSize,
			int startIndex);
	
}
