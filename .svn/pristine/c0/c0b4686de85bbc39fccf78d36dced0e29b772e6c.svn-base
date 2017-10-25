package com.lyf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lyf.pojo.User;
import com.lyf.service.UserService;

@Controller
@RequestMapping("index")
public class MainController extends BasicController {

	public MainController() {
		super(MainController.class);
	}
	@Autowired
	private UserService userService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user= (User)httpSession.getAttribute("user"); 
		if(user==null){
			mv.setViewName("login");
		}else{
			List<User> list=userService.selectAll();
			user.setTotal(getTotal(list,user.getId()));
			mv.addObject("user", user);
			mv.setViewName("index");
		}
		mv.addObject("menuId", "0");
		return mv;
	}
	
	public int getTotal(List<User> list,String id){
		int i =0;
		ArrayList<String> temp=new ArrayList<String>();
		ArrayList<String> temp2=new ArrayList<String>();
		temp.add(id);
		for(int k = 0;k<8;k++){
			for(String s1 :temp){				
				for(User u :list){
					if(s1 == u.getReferee()){
						temp2.add(u.getId());
						i++;
						continue;
					}
				}
			}
			temp=new ArrayList<String>();
			temp = temp2;
			temp2=new ArrayList<String>();
		}
		return i;
	}

}
