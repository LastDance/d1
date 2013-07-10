package com.dms.common.service;

import java.util.List;

import com.dms.common.model.User;
import com.dms.om.model.PaginationSupport;

public interface IUserService {

	public List<User> validateLogin(User user);

	public void createUser(User user);

	public void removeUser(Integer id);
	
	public List<User> findAllUsers();
	
	public User getUser(int UserID);
	
	public void updateUser(User user);
	
	public PaginationSupport<User> findPageByQuery(int pageSize,
			int startIndex);

}
