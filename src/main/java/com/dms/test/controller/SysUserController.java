package com.dms.test.controller;

import java.util.Map;

import com.dms.test.model.SysUser;
import com.dms.test.service.SysUserService;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.apache.log4j.Logger;

@Controller
public class SysUserController {

	@Autowired
	private SysUserService sysUserService;
	
	private static final Logger logger = Logger.getLogger(SysUserController.class);
	
	@RequestMapping("/index")
	public String listSysUsers(Map<String, Object> map) {
		 
        map.put("sysUser", new SysUser());
        map.put("sysUserList", sysUserService.listSysUser());
 
        return "sysUser";
    }
 
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addSysUser(@ModelAttribute("sysUser")
    SysUser sysUser, BindingResult result) {
 
    	sysUserService.addSysUser(sysUser);
 
        return "redirect:/index";
    }
 
    @RequestMapping("/delete/{sysUserId}")
    public String deleteSysUser(@PathVariable("sysUserId")
    Integer sysUserId) {
 
    	sysUserService.removeSysUser(sysUserId);
 
        return "redirect:/index";
    }
	
}
