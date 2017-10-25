package com.lyf.service;

import java.util.List;
import java.util.Map;

import com.lyf.core.LeeTree;
import com.lyf.pojo.User;

public interface UserService {

	 int selectCountByParentId(String id);
	 int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int exsitCode(String id);
    
    LeeTree<User> userTree(String id);
    
    int updateLevel(String id,Integer level);
    
    int updateIsout(String id);
    
    List<User> findByPage(Map<String, Integer> map);
    
    int pageCount();
    
    User loginbyUP(Map<String, String> map);
    
    List<User> selectAll();
    
    int exsitByUserCode(String usercode);
    
    int exsitByWeChat(String weChat);
}
