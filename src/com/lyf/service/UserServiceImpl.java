package com.lyf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lyf.core.LeeTree;
import com.lyf.dao.UserMapper;
import com.lyf.pojo.User;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper mapper;
	
	@Override
	public int deleteByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return mapper.insert(record);
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return mapper.insertSelective(record);
	}

	@Override
	public User selectByPrimaryKey(String id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return mapper.updateByPrimaryKey(record);
	}

	@Override
	public int exsitCode(String code) {
		// TODO Auto-generated method stub
		return mapper.exsitCode(code);
	}
	
	

	@Override
	public LeeTree<User> userTree(String id) {
		User user = mapper.selectByPrimaryKey(id);
		LeeTree<User> leeTree =  new LeeTree<>(user.getId(),user.getUsername(),"",user.getIconCls(),null,true);
		List<User> list = mapper.selectByParentId(id);
		LeeTree<User> node;
		for(User u : list){
			node = new LeeTree<>(u.getId(), u.getUsername(), u.getReferee(),user.getIconCls(),u, true);
			leeTree.add(node);
		}
		return leeTree;
	}

	@Override
	public int updateLevel(String id,Integer level) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("level", level);
		return mapper.updateLevel(map);
	}

	@Override
	public List<User> findByPage(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return mapper.findByPage(map);
	}

	@Override
	public int pageCount() {
		// TODO Auto-generated method stub
		return mapper.pageCount();
	}

	@Override
	public  User loginbyUP(Map<String, String> map) {
		// TODO Auto-generated method stub
		return mapper.loginbyUP(map);
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	@Override
	public int exsitByUserCode(String usercode) {
		// TODO Auto-generated method stub
		return mapper.exsitByUserCode(usercode);
	}

	@Override
	public int exsitByWeChat(String weChat) {
		// TODO Auto-generated method stub
		return mapper.exsitByWeChat(weChat);
	}

	@Override
	public int selectCountByParentId(String id) {
		// TODO Auto-generated method stub
		return mapper.selectCountByParentId(id);
	}

	@Override
	public int updateIsout(String id) {
		return mapper.updateIsout(id);
	}

	

}
