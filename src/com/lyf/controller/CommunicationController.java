package com.lyf.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lyf.pojo.User;


@Controller
@RequestMapping("communication")
public class CommunicationController extends BasicController{

	public CommunicationController() {
		super(CommunicationController.class);
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user= (User)httpSession.getAttribute("user"); 
		if(user==null){
			mv.setViewName("login");
		}else{
			mv.setViewName("community");
		}
		
		return mv;
	}

}
