package com.dms.test.service;

import java.util.List;

import com.dms.test.model.SysUser;

public interface SysUserService {
	
	public void addSysUser(SysUser sysUser);

	public List<SysUser> listSysUser();

	public void removeSysUser(Integer id);

}
