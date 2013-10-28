package com.telenoetica.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/jsp")
public class SingleViewController extends BaseController {

	@RequestMapping(value = "/dashboard/home")
	public String home() {
		return "dashboard-home";
	}
	
	@RequestMapping(value = "/underconstruction")
	public String underConstruction() {
		return "under-construction";
	}
}
