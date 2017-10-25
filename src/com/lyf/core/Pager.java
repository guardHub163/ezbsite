package com.lyf.core;

import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

public class Pager<T> extends BasicCore {
	
	private Gson gson;
	
	public Pager() {
		super();
	}

	/**
	 * @Fields page : TODO(当前页码)
	 */
	private int page;

	/**
	 * @Fields rows : TODO(每页行数)
	 */
	private int rows;

	/**
	 * @Fields jsonMap : TODO(分页需要两个键值对：total分页总数，rows：当前页内容)
	 */
	private Map<String, Object> jsonMap;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		page = (page == 0 ? 1 : page);
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		rows = (rows == 0 ? 1 : rows);
		this.rows = rows;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public String pagerJson(T t,final Map<String,String> parameters,List<T> list,int total){
		String strJson = null;
		jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		gson = new GsonBuilder().registerTypeAdapter(t.getClass(), new JsonSerializer<T>() {

			@Override
			public JsonElement serialize(T src, Type typeOfSrc,
					JsonSerializationContext context) {
				JsonObject o = new JsonObject();
				for(Entry<String,String> entry:parameters.entrySet()){
					o.addProperty(entry.getKey(), entry.getValue());
				}
				return o;
			}
			
		}).create();
		strJson = gson.toJson(jsonMap);
		return strJson;
	}
}
