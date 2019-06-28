package com.haoyu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/analysis")
public class AnalysisController {

	private static String FPATH = "analysis/";

	@RequestMapping("/analysis")
	public String analysisPage() {
		return FPATH+"analysis";
	}
	
	@RequestMapping("/analysis2")
	public String analysisPage2() {
		return FPATH+"analysis2";
	}
	
}
