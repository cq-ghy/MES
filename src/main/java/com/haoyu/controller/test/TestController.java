package com.haoyu.controller.test;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.RequestMapping;

import com.haoyu.service.TestService;

//@Controller
@RequestMapping("/testController")
public class TestController {
	@Resource
	private TestService testService;

	@RequestMapping("/test")
	public String test() {
//		testService.testUser();
		return "test";
	}
}
