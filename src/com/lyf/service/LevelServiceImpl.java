package com.lyf.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyf.dao.LevelMapper;
import com.lyf.pojo.Level;

@Service("LevelService")
public class LevelServiceImpl implements LevelService {
	@Autowired
	private LevelMapper mapper;
	@Override
	public int insert(Level level) {
		return mapper.insert(level);
	}
	@Override
	public int update(Level level) {
		return mapper.updateByPrimaryKey(level);
	}
	@Override
	public List<Level> selectByUserId(String userId) {
		return mapper.selectByUserId(userId);
	}
	@Override
	public List<Level> selectByUserIdLeftUser(String userId) {
		return mapper.selectByUserIdLeftUser(userId);
	}
	@Override
	public List<Level> selectByPareIdLeftUser(String pareId) {
		return mapper.selectByPareIdLeftUser(pareId);
	}
	@Override
	public int updateApply(int id,Date confirmdate) {
		Map<String,Object> map = new HashMap<>();
		map.put("id", id);
		map.put("confirmdate", confirmdate);
		return mapper.updateApply(map);
	}
	@Override
	public Level selectById(int id) {
		return mapper.selectByPrimaryKey(id);
	}

}
