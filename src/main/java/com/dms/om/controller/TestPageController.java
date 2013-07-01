package com.dms.om.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestPageController {
	@RequestMapping("/testPage")
	public String welcome(Map<String, Object> map) {
		return "test/testPage";
	}
}
