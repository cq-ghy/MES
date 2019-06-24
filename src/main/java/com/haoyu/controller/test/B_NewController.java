package com.haoyu.controller.test;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
//springmvc��Ҫ��ͨ���Բ����󶨵��Ż�������ʼ��������
@RequestMapping("/test")
public class B_NewController {

	@RequestMapping("/test")
	public ModelAndView test(String name) {//User user ,Model model,Map map--ԭ���Ͼ�ͨ��beanע���
		System.out.println(name);
		ModelMap model=new ModelMap();
		model.put("fromName","hello");
		return new ModelAndView("index",model);
	}
	
}
