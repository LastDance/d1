package com.dms.om.service;

import java.util.List;

import com.dms.om.model.User;

public interface IUserService {

	public List<User> validateLogin(User user);

	public void createUser(User user);

	public void removeUser(Integer id);

}
