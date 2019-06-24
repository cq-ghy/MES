package com.haoyu.controller.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
public class A_OldController extends MultiActionController{
	
	public String toIndex(HttpServletRequest request,HttpServletResponse response) {
		return "toIndex";
	}
	public ModelAndView showName(HttpServletRequest request,HttpServletResponse response) {
		String name=request.getParameter("name");
		System.out.println("================="+name);
		ModelMap model=new ModelMap();
		model.put("name",name);
		model.put("fromName","hello");
		return new ModelAndView("index",model);
	}
}
