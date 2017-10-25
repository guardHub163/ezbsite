package com.lyf.service;

import java.util.Date;
import java.util.List;

import com.lyf.pojo.Level;

public interface LevelService {
	int insert(Level level);
	int update(Level level);
	
	int updateApply(int id,Date confirmdate);
	
	List<Level> selectByUserId(String userId);
	
	List<Level> selectByUserIdLeftUser(String userId);
	
	List<Level> selectByPareIdLeftUser(String pareId);
	
	Level selectById(int id);
}
