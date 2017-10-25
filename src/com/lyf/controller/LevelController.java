package com.lyf.controller;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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
import com.lyf.pojo.Level;
import com.lyf.pojo.User;
import com.lyf.service.LevelService;
import com.lyf.service.UserService;

@Controller
@RequestMapping("level")
public class LevelController {
	public LevelController() {

	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView index(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			mv.setViewName("login");
			return mv;
		}
		mv.setViewName("level");
		mv.addObject("menuId", "5");
		return mv;
	}

	@RequestMapping(value = "applyed", method = RequestMethod.POST)
	@ResponseBody
	public String applyed(int id) {
		String result = "";

		try {
			Level level = levelService.selectById(id);
			levelService.updateApply(id, new Date());
			userService.updateLevel(level.getUserid().toString(),
					level.getLevel());
			result = "{'result':true}";
		} catch (Exception e) {
			result = "{'result':false,'msg':'审核失败，请联系管理员！'}";
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "levelList", method = RequestMethod.POST)
	@ResponseBody
	public String levelList(HttpSession session) {
		String str = "";

		User user = (User) session.getAttribute("user");
		List<Level> levels = levelService.selectByPareIdLeftUser(user.getId());
		Gson gson = new GsonBuilder().registerTypeAdapter(Level.class,
				new JsonSerializer<Level>() {

					@Override
					public JsonElement serialize(Level src, Type typeOfSrc,
							JsonSerializationContext context) {
						JsonObject o = new JsonObject();
						o.addProperty("Id", src.getId());
						o.addProperty("accountname", src.getUser()
								.getAccountname());
						o.addProperty("usercode", src.getUser().getUsercode());
						o.addProperty("paymenttype", paymentType(src.getUser()
								.getPaymenttype()));
						if (src.getUser().getPaymenttype() == 0) {
							o.addProperty("account", src.getUser()
									.getWechatnumber());
						} else {
							o.addProperty("account", src.getUser().getAccount());
						}
						o.addProperty("phone", src.getUser().getPhone());
						/* o.addProperty("cash", convertCash(src.getLevel())); */
						o.addProperty("level", "第" + src.getLevel() + "级");
						o.addProperty(
								"oper",
								src.getApply() == 1 ? "<a href='javascript:void(0)' onclick='applyed("
										+ src.getId() + ")'>审核</a>"
										: "已审核");
						return o;
					}
				}).create();
		str = gson.toJson(levels);
		return str;
	}

	void recursiveUser(String parentId, List<User> users, Integer[] levels) {
		for (User u : users) {
			if (u.getReferee().equals(parentId)) {
				switch (u.getLevel()) {
				case 1:
					levels[0]++;
					break;
				case 2:
					levels[1]++;
					break;
				case 3:
					levels[2]++;
					break;
				case 4:
					levels[3]++;
					break;
				case 5:
					levels[4]++;
					break;
				case 6:
					levels[5]++;
					break;
				case 7:
					levels[6]++;
					break;
				case 8:
					levels[7]++;
					break;
				}
				recursiveUser(u.getId(), users, levels);
			}
		}
	}

	@RequestMapping(value = "apply", method = RequestMethod.GET)
	public ModelAndView apply(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("apply");
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			mv.setViewName("login");
			return mv;
		}
		List<User> users = userService.selectAll();
		Integer[] levels = new Integer[] { 0, 0, 0, 0, 0, 0, 0, 0 };
		// Integer[] cashs = new Integer[]{0,0,0,0,0,0,0,0};
		recursiveUser(user.getId(), users, levels);
		mv.addObject("level", user.getLevel());
		mv.addObject("nextlevel", user.getLevel() + 1);
		mv.addObject("level1", levels[0]);
		mv.addObject("cash1", levels[0] * 10);
		mv.addObject("level2", levels[1]);
		mv.addObject("cash2", levels[1] * 20);
		mv.addObject("level3", levels[2]);
		mv.addObject("cash3", levels[2] * 30);
		mv.addObject("level4", levels[3]);
		mv.addObject("cash4", levels[3] * 50);
		mv.addObject("level5", levels[4]);
		mv.addObject("cash5", levels[4] * 80);
		mv.addObject("level6", levels[5]);
		mv.addObject("cash6", levels[5] * 120);
		mv.addObject("level7", levels[6]);
		mv.addObject("cash7", levels[6] * 200);
		mv.addObject("level8", levels[7]);
		mv.addObject("cash8", levels[7] * 300);

		return mv;
	}

	@Resource
	UserService userService;

	@Resource
	LevelService levelService;

	/**
	 * @Title: levelApply
	 * @Description: TODO(申请升级)
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	@RequestMapping(value = "levelApply", method = RequestMethod.POST)
	@ResponseBody
	public String levelApply(HttpSession httpSession) {
		String result = "";
		User user = (User) httpSession.getAttribute("user");
		if (user.getLevel() == 8) {
			return "{'result':false,'msg':'申请失败，您已经是顶级会员！'}";
		}

		User parent = new User();
		//parent = recursiveUser(user.getReferee());

		/*List<Level> levels = levelService.selectByUserId(user.getId());
		for (Level lev : levels) {
			if (lev.getApply() == 1) {
				return "{'result':false,'msg':'申请失败，您升级" + lev.getLevel()
						+ "级还未通过审核！,户名：" + parent.getAccountname() + "付款方式："
						+ paymentType(parent.getPaymenttype()) + "会员编号："
						+ parent.getId() + "微信号：" + parent.getWechatnumber()
						+ "电话：" + parent.getPhone() + "请抄写或者截图保存！进入等待审核阶段！'}";
			}
		}*/

		Level level = new Level();
		level.setApply(1);
		level.setUserid(user.getId());
		level.setLevel(user.getLevel() + 1);
		level.setApplydate(new Date());

		// User parent = new User();// = recursiveUser(user.getReferee());

		switch (user.getLevel()) {
		case 1:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 2:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 3:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 4:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 5:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 6:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		case 7:
			parent = recursiveUser(user.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			parent = recursiveUser(parent.getReferee());
			break;
		/*
		 * case 8: parent = recursiveUser(user.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); parent =
		 * recursiveUser(parent.getReferee()); break;
		 */
		}
		level.setPareId(parent.getId());

		List<Level> levels = levelService.selectByUserId(user.getId());
		for (Level lev : levels) {
			if (lev.getApply() == 1) {
				return "{'result':false,'msg':'申请失败，您升级" + lev.getLevel()
						+ "级还未通过审核！,户名：" + parent.getAccountname() + "付款方式："
						+ paymentType(parent.getPaymenttype()) + "会员编号："
						+ parent.getId() + "微信号：" + parent.getWechatnumber()
						+ "电话：" + parent.getPhone() + "请抄写或者截图保存！进入等待审核阶段！'}";
			}
		}
		
		try {
			levelService.insert(level);
			result = "{'result':true,'userInfo':'户名：" + parent.getAccountname()
					+ "付款方式：" + paymentType(parent.getPaymenttype()) + "会员编号："
					+ parent.getId() + "微信号：" + parent.getWechatnumber()
					+ "电话：" + parent.getPhone() + "请抄写或者截图保存！进入等待审核阶段！'}";
			// if(parent.getLevel())
			parent = recursiveUser(user.getReferee());
			if (parent.getLevel() < 8) {
				if (parent.getLevel() + 1 < user.getLevel()) {
					int byd = parent.getBeyond() + 1;

					if (byd >= 2) {
						parent.setIsout(1);
					} else {
						parent.setBeyond(1);
					}

					userService.updateByPrimaryKey(parent);
				}
			}

			/*
			 * if (parent.getBeyond() == 1 && parent.getLevel() + 1 <
			 * user.getLevel()) { parent.setIsout(1);
			 * userService.updateByPrimaryKey(parent); }
			 */
		} catch (Exception e) {
			result = "{'result':false,'msg':'申请失败，请联系管理员！'}";
			e.printStackTrace();
		}

		return result;
	}

	String paymentType(int pay) {
		String val = "";

		switch (pay) {
		case 0:
			val = "微信";
			break;
		case 1:
			val = "财付通";
			break;
		case 2:
			val = "支付宝";
			break;
		default:
			val = "微信";
			break;
		}

		return val;
	}

	User recursiveUser(String pareId) {
		User parent = userService.selectByPrimaryKey(pareId);
		if (parent.getIsout() == 1) {
			parent = recursiveUser(parent.getReferee());
		}
		return parent;
	}

	@RequestMapping(value = "record", method = RequestMethod.GET)
	public ModelAndView applyRecord(HttpSession httpSession) {
		ModelAndView mv = new ModelAndView();
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			mv.setViewName("login");
			return mv;
		}
		mv.setViewName("record");

		return mv;
	}

	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	@RequestMapping(value = "recordList", method = RequestMethod.POST)
	@ResponseBody
	public String recordList(HttpSession session) {
		String str = "";

		User user = (User) session.getAttribute("user");
		List<Level> records = levelService.selectByUserIdLeftUser(user.getId());
		Gson gson = new GsonBuilder().registerTypeAdapter(Level.class,
				new JsonSerializer<Level>() {

					@Override
					public JsonElement serialize(Level src, Type typeOfSrc,
							JsonSerializationContext context) {
						JsonObject o = new JsonObject();
						o.addProperty("Id", src.getId());
						o.addProperty("username", src.getUser().getUsername());
						o.addProperty("usercode", src.getUser().getUsercode());
						o.addProperty("applyDate",
								dateFormat.format(src.getApplydate()));
						if (src.getConfirmdate() != null) {
							o.addProperty("confirmDate",
									dateFormat.format(src.getConfirmdate()));
						} else {
							o.addProperty("confirmDate", "");
						}
						/* o.addProperty("cash", convertCash(src.getLevel())); */
						o.addProperty("level", "第" + src.getLevel() + "级");
						o.addProperty("oper", src.getApply() == 1 ? "还未审核"
								: "已经审核");
						return o;
					}
				}).create();
		str = gson.toJson(records);
		return str;
	}

	/*
	 * int convertCash(int level) { int cash = 0; switch (level) { case 1: cash
	 * = 10; break; case 2: cash = 20; break; case 3: cash = 30; break; case 4:
	 * cash = 50; break; case 5: cash = 80; break; case 6: cash = 120; break;
	 * case 7: cash = 200; break; case 8: cash = 300; break; } return cash; }
	 */

}
