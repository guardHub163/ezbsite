package com.lyf.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.lyf.core.LeeTree;
import com.lyf.pojo.User;
import com.lyf.service.UserService;
import com.lyf.unit.RandomCode;

@Controller
@RequestMapping("user")
public class UserController extends BasicController {

	public UserController() {
		super(UserController.class);
	}

	@Autowired
	private UserService userService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			mv.setViewName("login");
		} else {
			String code = "";
			while (true) {
				code = RandomCode.random();
				int count = userService.exsitCode(code);
				if (count == 0) {
					break;
				}
			}
			mv.addObject("code", code);
			mv.addObject("TJCode", user.getId());
			mv.addObject("menuId", "7");
			mv.setViewName("user");
		}
		return mv;
	}

	@RequestMapping(value = "isCreate", method = RequestMethod.POST)
	@ResponseBody
	public String isCreate(HttpSession httpSession) {
		String result = "";
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			int count = userService.selectCountByParentId(user.getId());
			if (count >= 3) {
				result = "{'result':false,'msg':'用户已有三个子用户，不能再添加！'}";
			} else {
				result = "{'result':true}";
			}
		}
		return result;
	}

	@RequestMapping(value = "changePwd", method = RequestMethod.POST)
	@ResponseBody
	public String changePwd(String pwd,HttpSession session){
		String result="";
		//setAttribute("user",user);
		try {
			User currentUser = (User) session.getAttribute("user");
			User user = new User();
			user.setId(currentUser.getId());
			user.setPassword(pwd);
			userService.updateByPrimaryKeySelective(user);
			result="{'result':true}";
		} catch (Exception e) {
			result="{'result':false,'msg':'修改密码失败，请联系管理员！'}";
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public String save(String jsonStr) {
		String result = "";
		gson = new Gson();
		User user = gson.fromJson(jsonStr, User.class);
		user.setCreatedate(new Date());
		user.setLevel(1);
		user.setLeveldate(new Date());
		user.setIsadmin(0);
		user.setIconCls("treeIcon");
		user.setIsout(0);
		user.setBeyond(0);
		String parentId = user.getReferee();
		System.out.println(parentId);
		/*for (int i = 0; i < 8; i++) {
			User parentUser = userService.selectByPrimaryKey(parentId);

			if (parentUser != null) {
				int count = userService.selectCountByParentId(parentId);
				if (count > 0) {
					break;
				}
				if (parentUser.getLevel() == 8) {
					break;
				}
				parentId = parentUser.getReferee();
				System.out.println(parentUser.getId());
				userService.updateLevel(parentUser.getId());
			} else {
				break;
			}
		}*/
		try {
			userService.insert(user);
			result = "{'result':true}";
		} catch (Exception e) {
			e.printStackTrace();
			result = "{'result':false,'msg':'添加失敗！'}";
		}
		return result;
	}

	@RequestMapping(value = "/userTree", method = RequestMethod.POST)
	@ResponseBody
	public String userTree(HttpSession httpSession) {
		LeeTree<User> leeTree = null;
		try {
			User user = (User) httpSession.getAttribute("user");
			if (user != null) {
				leeTree = userService.userTree(user.getId());
				// gson日期格式化
				gson = new GsonBuilder().setDateFormat("yyyy-MM-dd hh-mm-ss")
						.create();
				return "["
						+ gson.toJson(leeTree).replace("\"children\":[],", "")
						+ "]";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/exsitUserCode", method = RequestMethod.GET)
	@ResponseBody
	public String exsitUserCode(String userCode) {
		String result = "";
		int count = userService.exsitByUserCode(userCode);
		if (count > 0) {
			result = "{'result':false}";
		} else {
			result = "{'result':true}";
		}
		return result;
	}

	@RequestMapping(value = "/exsitWeChat", method = RequestMethod.POST)
	@ResponseBody
	public String exsitWeChat(String weChat) {
		String result = "";
		int count = userService.exsitByWeChat(weChat);
		if (count > 0) {
			result = "{'result':false}";
		} else {
			result = "{'result':true}";
		}
		return result;
	}
}
