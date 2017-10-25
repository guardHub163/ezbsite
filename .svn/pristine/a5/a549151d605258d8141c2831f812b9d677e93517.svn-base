package com.lyf.core;

import java.util.ArrayList;
import java.util.List;

public class LeeTree<T> extends BasicCore{
	public LeeTree(){
		children = new ArrayList<>();
	}
	
	/** 
	* <p>Title: </p> 
	* <p>Description: 构造函数</p> 
	* @param id
	* @param text
	* @param pareId
	* @param obj
	* @param isLeaf 
	*/
	public LeeTree(String id,String text,String pareId, String iconCls, Object obj,boolean isLeaf){
		children = new ArrayList<>();
		this.id = id;
		this.text = text;
		this.pareId = pareId;
		this.iconCls = iconCls;
		this.obj = obj;
		this.isLeaf = isLeaf;
	}
	
	/** 
	* @Fields id : TODO(唯一标识) 
	*/ 
	private String id;
	
	/** 
	* @Fields text : TODO(显示信息) 
	*/ 
	private String text;
	
	/** 
	* @Fields isLeaf : TODO(是否展开) 
	*/ 
	private boolean isLeaf;
	
	/** 
	* @Fields pareId : TODO(父节点标识) 
	*/ 
	private String pareId;
	
	private String iconCls;
	
	/** 
	* @Fields children : TODO(子节点) 
	*/ 
	private List<LeeTree<T>> children;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public String getPareId() {
		return pareId;
	}

	public void setPareId(String pareId) {
		this.pareId = pareId;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public List<LeeTree<T>> getChildren() {
		return children;
	}

	public void setChildren(List<LeeTree<T>> children) {
		this.children = children;
	}
	
	/** 
	* @Title: add 
	* @Description: TODO(添加子节点) 
	* @param @param node    设定文件 
	* @return void    返回类型 
	* @throws 
	*/
	public void add(LeeTree<T> node){
		if(node.getId().isEmpty()||node.getId()==null||node.getId().equals("0")){
			this.children.add(node);
		}else if(node.getPareId().equals(this.id)){
			this.children.add(node);
		}else{
			for(LeeTree<T> tmp_node : children){
				tmp_node.add(node);
			}
		}
	}
}
