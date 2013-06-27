package com.dms.test.validator;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;

import com.dms.common.util.Encryption;
import com.dms.test.model.SysUser;
import com.dms.test.service.SysUserService;

public class LoginValidator {

	public void validate(Object obj, Errors errors) {
		
		SysUser user = (SysUser) obj;

		if (user.getUsername() == null || user.getUsername().length() == 0) {
			errors.rejectValue("username", "error.empty.field", "请输入用户名");
		}

		if (user.getPassword() == null || user.getPassword().length() == 0) {
			errors.rejectValue("password", "error.empty.field", "请输入密码");
		}
	}

}
