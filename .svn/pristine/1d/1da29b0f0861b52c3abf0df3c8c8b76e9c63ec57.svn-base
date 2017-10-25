package com.lyf.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.lyf.pojo.User;
import com.lyf.service.UserService;

@Controller
@RequestMapping("login")
public class LoginController extends BasicController {

	public LoginController() {
		super(LoginController.class);
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("login");
		return mv;
	}

	@Autowired
	private UserService userService;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public String login(String usercode,String password,HttpSession httpSession) {
		String result = "";
		gson = new Gson();
		//User user = gson.fromJson(jsonStr, User.class);
		Map<String, String> map = new HashMap<String, String>();
		map.put("usercode", usercode);
		map.put("password", password);
		User user = userService.loginbyUP(map);
		if (user == null) {
			result = "{'result':false,'msg':'用户不存在或密码错误！'}";
		} else {
			httpSession.setAttribute("user",user);
			
			result = "{'result':true,'id':'"+user.getId()+"'}";
		}
		return result;
	}
}
