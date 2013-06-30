package com.dms.om.validator;

import org.springframework.validation.Errors;

import com.dms.om.model.User;

public class LoginValidator {

	public void validate(Object obj, Errors errors) {
		
		User user = (User) obj;

		if (user.getUsername() == null || user.getUsername().length() == 0) {
			errors.rejectValue("username", "error.empty.field", "请输入用户名");
		}

		if (user.getPassword() == null || user.getPassword().length() == 0) {
			errors.rejectValue("password", "error.empty.field", "请输入密码");
		}
	}

}
