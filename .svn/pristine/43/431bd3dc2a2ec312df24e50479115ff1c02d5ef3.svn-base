package com.lyf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
@RequestMapping("paramers")
public class ParamersController extends BasicController{

	public ParamersController() {
		super(ParamersController.class);
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="payment",method=RequestMethod.POST)
	@ResponseBody
	public String payment(){
		String json = "[{\"id\":\"0\",\"text\":\"微信\"},{\"id\":\"1\",\"text\":\"财付通\"},{\"id\":\"2\",\"text\":\"支付宝\"}]";
		return json;
	}
	
	@RequestMapping(value="area",method=RequestMethod.POST)
	@ResponseBody
	public String area(){
		String json = "[{\"id\":\"0\",\"text\":\"左区\"},{\"id\":\"1\",\"text\":\"中区\"},{\"id\":\"2\",\"text\":\"右区\"}]";
		return json;
	}

}
