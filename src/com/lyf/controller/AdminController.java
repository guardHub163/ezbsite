package com.lyf.controller;

import java.lang.reflect.Type;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;
import com.lyf.pojo.User;
import com.lyf.service.UserService;
import com.lyf.unit.RandomCode;

@Controller
@RequestMapping("admin")
public class AdminController extends BasicController {

	public AdminController() {
		super(AdminController.class);
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			mv.setViewName("login");
		} else if (user.getIsadmin() == 1) {
			mv.setViewName("admin");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "adminInfo", method = RequestMethod.GET)
	public ModelAndView adminInfo(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		String code = "";
		while (true) {
			code = RandomCode.random();
			int count = userService.exsitCode(code);
			if (count == 0) {
				break;
			}
		}
		mv.addObject("code", code);
		mv.setViewName("adminInfo");
		return mv;
	}

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/adminList", method = RequestMethod.POST)
	@ResponseBody
	public String PageBind(int page, int rows) {
		String json = "";
		page = (page == 0 ? 1 : page);
		rows = (rows == 0 ? 15 : rows);
		int start = (page - 1) * rows;
		rows = start + rows;
		logger.info("this page rows is " + page + "|" + rows);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("p1", start);
		map.put("p2", rows);

		List<User> list = userService.findByPage(map);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		int total = userService.pageCount();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		gson = new GsonBuilder().registerTypeAdapter(User.class,
				new JsonSerializer<User>() {

					@Override
					public JsonElement serialize(User src, Type typeOfSrc,
							JsonSerializationContext context) {
						JsonObject o = new JsonObject();
						o.addProperty("id", src.getId());
						o.addProperty("usercode", src.getUsercode());
						o.addProperty("cardnumber", src.getCardnumber());
						o.addProperty("phone", src.getPhone());
						o.addProperty("wechatnumber", src.getWechatnumber());
						o.addProperty("referee", src.getReferee());
						o.addProperty("isadmin", src.getIsadmin() == 0 ? "否"
								: "是");
						if (src.getLevel() == 0) {
							o.addProperty("level", "第零级");
						} else if (src.getLevel() == 1) {
							o.addProperty("level", "第一级");
						} else if (src.getLevel() == 2) {
							o.addProperty("level", "第二级");
						} else if (src.getLevel() == 3) {
							o.addProperty("level", "第三级");
						} else if (src.getLevel() == 4) {
							o.addProperty("level", "第四级");
						} else if (src.getLevel() == 5) {
							o.addProperty("level", "第五级");
						} else if (src.getLevel() == 6) {
							o.addProperty("level", "第六级");
						} else if (src.getLevel() == 7) {
							o.addProperty("level", "第七级");
						} else if (src.getLevel() == 8) {
							o.addProperty("level", "第八级");
						}
						return o;
					}
				}).create();
		json = gson.toJson(jsonMap);
		logger.info("this station list strJson is " + json);
		return json;

	}

	@RequestMapping(value = "save", method = RequestMethod.POST)
	@ResponseBody
	public String save(String jsonStr) {
		String result = "";
		gson = new Gson();
		User user = gson.fromJson(jsonStr, User.class);
		user.setCreatedate(new Date());
		user.setLevel(0);
		user.setLeveldate(new Date());
		user.setIsadmin(1);

		try {
			userService.insert(user);
			result = "{'result':true}";
		} catch (Exception e) {
			e.printStackTrace();
			result = "{'result':false,'msg':'添加失敗！'}";
		}
		return result;
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(String id) {
		String result="";
		try
		{
			userService.deleteByPrimaryKey(id);
			result= "{'result':true}";
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
			result= "{'result':false,'msg':'删除失敗！'}";
		}
		return result;
	}

	
	

}
