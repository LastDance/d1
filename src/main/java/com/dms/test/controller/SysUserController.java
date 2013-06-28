package com.dms.test.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dms.common.util.Encryption;
import com.dms.test.model.SysUser;
import com.dms.test.service.SysUserService;
import com.dms.test.validator.LoginValidator;

@Controller
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;

	private static final Logger logger = Logger
			.getLogger(SysUserController.class);

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
		map.put("sysUser", new SysUser());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String authenticate(@ModelAttribute("sysUser") SysUser sysUser,
			BindingResult result, HttpServletRequest request) {

		LoginValidator loginValidator = new LoginValidator();
		loginValidator.validate(sysUser, result);

		sysUser.setPassword(Encryption.encrypt(sysUser.getPassword()));
		List<SysUser> loginlist = sysUserService.validateLogin(sysUser);

		if (result.hasErrors()) {
			return "login";
		} else if (loginlist.isEmpty()) {
			result.addError(new ObjectError("AuthenticationFailed", "密码错误"));
			return "login";
		} else {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			
			request.getSession().setAttribute("sysuser", sysUser.getUsername());
			request.getSession().setAttribute("loginTimestamp", sdf.format(date));
			return "redirect:/welcome";
		}

	}

	@RequestMapping("/user")
	public String listSysUsers(Map<String, Object> map) {
		map.put("sysUser", new SysUser());
		map.put("sysUserList", sysUserService.listSysUser());

		return "sysUser";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addSysUser(@ModelAttribute("sysUser") SysUser sysUser,
			BindingResult result) {
		sysUser.setPassword(Encryption.encrypt(sysUser.getPassword()));
		sysUserService.addSysUser(sysUser);

		return "redirect:/user";
	}

	@RequestMapping("/delete/{sysUserId}")
	public String deleteSysUser(@PathVariable("sysUserId") Integer sysUserId) {
		sysUserService.removeSysUser(sysUserId);

		return "redirect:/user";
	}

}
