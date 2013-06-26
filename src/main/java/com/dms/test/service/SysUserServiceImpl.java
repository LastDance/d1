package com.dms.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dms.test.dao.SysUserDAO;
import com.dms.test.model.SysUser;

@Service
public class SysUserServiceImpl implements SysUserService {
	@Autowired
	private SysUserDAO sysUserDAO;

	@Transactional
	public List<SysUser> validateLogin(SysUser sysUser) {
		return sysUserDAO.validateLogin(sysUser);
	}

	@Transactional
	public void addSysUser(SysUser sysUser) {
		sysUserDAO.addSysUser(sysUser);
	}

	@Transactional
	public List<SysUser> listSysUser() {

		return sysUserDAO.listSysUser();
	}

	@Transactional
	public void removeSysUser(Integer id) {
		sysUserDAO.removeSysUser(id);
	}
}
