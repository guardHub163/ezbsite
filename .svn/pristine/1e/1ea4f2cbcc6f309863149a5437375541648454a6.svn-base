package com.lyf.dao;

import java.util.List;
import java.util.Map;

import com.lyf.pojo.User;


public interface UserMapper {
    int deleteByPrimaryKey(String id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    int exsitCode(String code);
    
    List<User> selectAll();
    
    List<User> selectByParentId(String id);
    
    int updateLevel(Map<String, Object> map);
    
    int updateIsout(String id);
    
    List<User> findByPage(Map<String, Integer> map);
    
    int pageCount();
    
    User loginbyUP(Map<String, String> map);
    
    int exsitByUserCode(String usercode);
    
    int exsitByWeChat(String weChat);
    
    int selectCountByParentId(String id);
}