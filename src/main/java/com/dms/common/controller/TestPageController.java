package com.dms.common.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dms.common.model.TestForm;

@Controller
public class TestPageController {
	
	@RequestMapping("/testPage")
	public String welcome(Map<String, Object> map) {
		map.put("testForm", new TestForm());
		return "test/testPage";
	}
	
	@RequestMapping(value = "/testPageSave", method = RequestMethod.POST)
	public String save(@ModelAttribute("testFrom") TestForm uploadForm,
            Model map) {
		
		return "test/testPage";
	}
}
