package com.dms.test.dao;

import java.util.List;

import com.dms.test.model.SysUser;

public interface SysUserDAO {
	
	public List<SysUser> validateLogin(SysUser sysUser);
	
	public void addSysUser(SysUser sysUser);

	public List<SysUser> listSysUser();

	public void removeSysUser(Integer id);
}
