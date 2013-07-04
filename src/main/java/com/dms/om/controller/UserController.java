package com.dms.om.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dms.common.util.Encryption;
import com.dms.om.model.User;
import com.dms.om.service.IUserService;
import com.dms.om.validator.LoginValidator;

@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	private static final Logger logger = Logger
			.getLogger(UserController.class);

	@RequestMapping("/welcome")
	public String welcome(Map<String, Object> map) {
		return "welcome";
	}
	
	@RequestMapping("/logoff")
	public String logoff(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login";
	}
	
	@RequestMapping("/underwork")
	public String underWork(Map<String, Object> map) {
		return "underwork";
	}
	
	@RequestMapping("/login")
	public String login(Map<String, Object> map) {
		map.put("user", new User());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String authenticate(@ModelAttribute("user") User user,
			BindingResult result, HttpServletRequest request) {

		LoginValidator loginValidator = new LoginValidator();
		loginValidator.validate(user, result);

		user.setPassword(Encryption.encrypt(user.getPassword()));
		List<User> loginlist = userService.validateLogin(user);

		if (result.hasErrors()) {
			return "login";
		} else if (loginlist.isEmpty()) {
			result.addError(new ObjectError("AuthenticationFailed", "密码错误"));
			return "login";
		} else {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			logger.info(user.getUsername()+ " logged in at " + sdf.format(date));
			request.getSession().setAttribute("user", user.getUsername());
			request.getSession().setAttribute("loginTimestamp", sdf.format(date));
			return "redirect:/welcome";
		}
	}

	@RequestMapping("/user")
	public String listSysUsers(Map<String, Object> map) {
		map.put("user", new User());
		return "user";
	}

//	@RequestMapping(value = "/add", method = RequestMethod.POST)
//	public String addSysUser(@ModelAttribute("sysUser") User sysUser,
//			BindingResult result) {
//		sysUser.setPassword(Encryption.encrypt(sysUser.getPassword()));
//		sysUserService.addSysUser(sysUser);
//
//		return "redirect:/user";
//	}
//
//	@RequestMapping("/delete/{sysUserId}")
//	public String deleteSysUser(@PathVariable("sysUserId") Integer sysUserId) {
//		sysUserService.removeSysUser(sysUserId);
//
//		return "redirect:/user";
//	}

}
