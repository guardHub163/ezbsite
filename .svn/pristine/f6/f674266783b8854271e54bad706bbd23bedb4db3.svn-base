package com.lyf.controller;

import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/** 
* @ClassName: BasicController 
* @Description: TODO(Contraller基类) 
* @author lyf 
* @date 2015年8月7日 下午1:55:48 
*  
*/
public class BasicController{
	
	/** 
	* @Fields dateFormat : TODO(将日期格式化：yyyy-MM-dd) 
	*/ 
	protected SimpleDateFormat dateFormat;
	
	/** 
	* @Fields datetimeFormat : TODO(将日期格式化：yyyy-MM-dd HH:mm:ss) 
	*/ 
	protected SimpleDateFormat datetimeFormat;
	
	/** 
	* @Fields logger : TODO(日志对象) 
	*/ 
	protected Logger logger;
	private Class<?> classz;
	
	protected Gson gson;
	
	/** 
	* <p>Title: Contrall基类构造函数</p> 
	* <p>Description: 初始化一些Contrall的公有属性、方法、事件等</p>  
	*/
	public BasicController(Class<?> classz){
		this.classz=classz;
		init();
	}
	
	/** 
	* @Title: init 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param     设定文件 
	* @return void    返回类型 
	* @throws 
	*/
	private void init(){
		dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger = Logger.getLogger(classz);
		gson = new GsonBuilder().serializeNulls().create();
	}
	
}
