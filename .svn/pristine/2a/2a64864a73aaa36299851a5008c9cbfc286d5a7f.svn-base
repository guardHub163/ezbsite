package com.lyf.dao;

import java.util.List;
import java.util.Map;

import com.lyf.pojo.Level;

public interface LevelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Level record);

    int insertSelective(Level record);

    Level selectByPrimaryKey(Integer id);
    
    List<Level> selectByUserId(String userId);

    int updateByPrimaryKeySelective(Level record);

    int updateByPrimaryKey(Level record);

	List<Level> selectByUserIdLeftUser(String userId);
	
	List<Level> selectByPareIdLeftUser(String pareId);

	int updateApply(Map<String,Object> map);
}